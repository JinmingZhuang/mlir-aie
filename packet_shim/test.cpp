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
    mlir_aie_init_mems(_xaie, 1);
    int errors = 0;

    printf("Finish configure\n");

    mlir_aie_clear_tile_memory(_xaie, 7, 2);
    mlir_aie_clear_tile_memory(_xaie, 7, 4);

#define DMA_COUNT 256
    int *mem_ptr0 =
      mlir_aie_mem_alloc(_xaie, 0, 0x4000 + 0x020100000000LL, DMA_COUNT+1);
    //int *mem_ptr1 =
    //  mlir_aie_mem_alloc(_xaie, 1, 0x5000 + 0x020100000000LL, DMA_COUNT);

    for (int i = 0; i < DMA_COUNT+1; i++) {
      if(i==0){
          *(mem_ptr0 + i) = 0xe1400c;
      }
      else{
          *(mem_ptr0 + i) = 72;
      }
      
      //*(mem_ptr1 + i) = 74;
    }

    
    usleep(sleep_u);

    printf("before core start\n");


    mlir_aie_start_cores(_xaie);

    mlir_aie_release_lock(_xaie, 7, 2, 1, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 4, 1, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 0, 1, 1, 0);
    //mlir_aie_release_lock(_xaie, 7, 0, 2, 1, 0);

    int tries = 1;
    printf("Waiting to acquire output lock for read ...\n");
    while (tries < 1000 && !mlir_aie_acquire_lock(_xaie, 7, 4, 1, 1, 0) ) { //&& !mlir_aie_acquire_lock(_xaie, 7, 4, 1, 1, 0)
      tries++;
    }
    printf("It took %d tries.\n", tries);

    for (int bd=0;bd<DMA_COUNT;bd++) {
        mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf72_0(_xaie, bd), 72,
                   errors);
        int b=mlir_aie_read_buffer_buf74_0(_xaie, bd);
        if(b!=72){
          printf("Count:%d, b=%d\n",bd,b);
        }
        
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
