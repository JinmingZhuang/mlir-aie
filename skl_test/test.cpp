//===- test.cpp -------------------------------------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// (c) Copyright 2020 Xilinx Inc.
//
//===----------------------------------------------------------------------===//

#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <thread>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <xaiengine.h>
#include "test_library.h"

#define HIGH_ADDR(addr)	((addr & 0xffffffff00000000) >> 32)
#define LOW_ADDR(addr)	(addr & 0x00000000ffffffff)
#define MLIR_STACK_OFFSET 4096

#include "aie_inc.cpp"

int
main(int argc, char *argv[])
{
    printf("test start.\n");

    aie_libxaie_ctx_t *_xaie = mlir_aie_init_libxaie();
    mlir_aie_init_device(_xaie);

    u32 sleep_u = 100000; 
    usleep(sleep_u);
    printf("before configure cores.\n");

    mlir_aie_configure_cores(_xaie);

    usleep(sleep_u);
    printf("before configure sw.\n");
    
    
    mlir_aie_configure_switchboxes(_xaie);

    
    usleep(sleep_u);
    printf("before DMA config\n");

    mlir_aie_configure_dmas(_xaie);
    mlir_aie_initialize_locks(_xaie);
    mlir_aie_init_mems(_xaie, 2);
    int errors = 0;

    printf("Finish configure\n");
#define DMA_COUNT 1024
    int *mem_ptr0 =
      mlir_aie_mem_alloc(_xaie, 0, 0x4000 + 0x020100000000LL, DMA_COUNT);
    int *mem_ptr1 =
      mlir_aie_mem_alloc(_xaie, 1, 0x6000 + 0x020100000000LL, DMA_COUNT);

    for (int i = 0; i < DMA_COUNT; i++) {
      *(mem_ptr0 + i) = 1;
      *(mem_ptr1 + i) = 1;
    }

    mlir_aie_clear_tile_memory(_xaie, 7, 2);
    mlir_aie_clear_tile_memory(_xaie, 7, 3);

    usleep(sleep_u);

    for (int bd=0;bd<DMA_COUNT;bd++) {
        mlir_aie_write_buffer_acc(_xaie, bd, 1);
    }


    printf("before core start\n");


    mlir_aie_start_cores(_xaie);

    mlir_aie_release_lock(_xaie, 7, 0, 1, 1, 0);
    mlir_aie_release_lock(_xaie, 7, 0, 2, 1, 0);
    mlir_aie_release_lock(_xaie, 7, 3, 2, 1, 0);


    int tries = 1;
    printf("Waiting to acquire output lock for read ...\n");
    while (tries < 1000 && !mlir_aie_acquire_lock(_xaie, 7, 3, 3, 1, 0)) {
      tries++;
    }
    printf("It took %d tries.\n", tries);

    mlir_aie_check("After release lock:", mlir_aie_read_buffer_c(_xaie, 5), 33,
                   errors);
    
    mlir_aie_check("Before release lock:", mlir_aie_read_buffer_c(_xaie, 1023), 33,
                   errors);
    
    for (int bd=0;bd<DMA_COUNT;bd++) {
        mlir_aie_check("Before release lock:", mlir_aie_read_buffer_c(_xaie, bd), 33,
                   errors);
    }

    int res = 0;
    if (!errors) {
      printf("PASS!\n");
      res = 0;
    } else {
      printf("Fail!\n");
      res = -1;
    }
    mlir_aie_deinit_libxaie(_xaie);

    printf("test done.\n");
    
    return res;
}
