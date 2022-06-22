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
#define MAP_SIZE 16UL
#define MAP_MASK (MAP_SIZE - 1)

void devmemRW32(uint32_t address, uint32_t value, bool write)
{
  int fd;
  uint32_t *map_base;
  uint32_t read_result;
  uint32_t offset = address - 0xF70A0000;

  if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1)
    printf("ERROR!!!! open(devmem)\n");
  printf("\n/dev/mem opened.\n");
  fflush(stdout);

  map_base = (uint32_t *)mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xF70A0000);
  if (map_base == (void *)-1)
    printf("ERROR!!!! map_base\n");
  printf("Memory mapped at address %p.\n", map_base);
  fflush(stdout);

  read_result = map_base[uint32_t(offset / 4)];
  printf("Value at address 0x%X: 0x%X\n", address, read_result);
  fflush(stdout);

  if (write)
  {
    map_base[uint32_t(offset / 4)] = value;
    //msync(map_base, MAP_SIZE, MS_SYNC);
    read_result = map_base[uint32_t(offset / 4)];
    printf("Written 0x%X; readback 0x%X\n", value, read_result);
    fflush(stdout);
  }

  //msync(map_base, MAP_SIZE, MS_SYNC);
  if (munmap(map_base, MAP_SIZE) == -1)
    printf("ERROR!!!! unmap_base\n");
  printf("/dev/mem closed.\n");
  fflush(stdout);
  close(fd);
}


int
main(int argc, char *argv[])
{

    devmemRW32(0xF70A000C, 0xF9E8D7C6, true);
    devmemRW32(0xF70A0000, 0x04000000, true);
    devmemRW32(0xF70A0004, 0x040381B1, true);
    devmemRW32(0xF70A0000, 0x04000000, true);
    devmemRW32(0xF70A0004, 0x000381B1, true);
    devmemRW32(0xF70A000C, 0x12341234, true);
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

    mlir_aie_sync_mem_dev(_xaie, 0);
    mlir_aie_sync_mem_dev(_xaie, 1);

#ifdef LIBXAIENGINEV2
    mlir_aie_external_set_addr_myBuffer_70_0((u64)mem_ptr0);
    mlir_aie_external_set_addr_myBuffer_70_1((u64)mem_ptr1);
    mlir_aie_configure_shimdma_70(_xaie);
#endif

    mlir_aie_clear_tile_memory(_xaie, 7, 1);
    mlir_aie_clear_tile_memory(_xaie, 7, 2);

    usleep(sleep_u);

    for (int bd=0;bd<DMA_COUNT;bd++) {
        mlir_aie_write_buffer_acc(_xaie, bd, 1);
    }


    printf("before core start\n");


    mlir_aie_start_cores(_xaie);

    mlir_aie_release_lock(_xaie, 7, 0, 1, 1, 0);
    mlir_aie_release_lock(_xaie, 7, 0, 2, 1, 0);


    int tries = 1;
    printf("Waiting to acquire output lock for read ...\n");
    while (tries < 1000 && !mlir_aie_acquire_lock(_xaie, 7, 2, 0, 1, 0)) {
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
