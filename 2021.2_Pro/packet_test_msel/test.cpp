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
    printf("test start.\n");
    devmemRW32(0xF70A000C, 0xF9E8D7C6, true);
    devmemRW32(0xF70A0000, 0x04000000, true);
    devmemRW32(0xF70A0004, 0x040381B1, true);
    devmemRW32(0xF70A0000, 0x04000000, true);
    devmemRW32(0xF70A0004, 0x000381B1, true);
    devmemRW32(0xF70A000C, 0x12341234, true);
    aie_libxaie_ctx_t *_xaie = mlir_aie_init_libxaie();
    mlir_aie_init_device(_xaie);

    u32 sleep_u = 100000; 
    usleep(sleep_u);
    printf("before configure cores.\n");

    mlir_aie_configure_cores(_xaie);

    usleep(sleep_u);
    printf("before configure sw.\n");
    
    int b721=mlir_aie_acquire_lock(_xaie, 7, 2, 1, 0, 0);
    int b741=mlir_aie_acquire_lock(_xaie, 7, 4, 1, 0, 0);
    int b701=mlir_aie_acquire_lock(_xaie, 7, 0, 1, 0, 0);
    int b722=mlir_aie_acquire_lock(_xaie, 7, 2, 2, 0, 0);

    printf("Lock7_0_1:%d\n", b701);
    printf("Lock7_2_1:%d\n", b721);
    printf("Lock7_2_2:%d\n", b722);
    printf("Lock7_4_1:%d\n", b741);



    mlir_aie_configure_switchboxes(_xaie);

    
    usleep(sleep_u);
    printf("before DMA config\n");

    mlir_aie_configure_dmas(_xaie);
    mlir_aie_initialize_locks(_xaie);
    mlir_aie_init_mems(_xaie, 1);
    int errors = 0;

    printf("Finish configure\n");

    int c721=mlir_aie_acquire_lock(_xaie, 7, 2, 1, 1, 0);
    int c741=mlir_aie_acquire_lock(_xaie, 7, 4, 1, 1, 0);
    int c701=mlir_aie_acquire_lock(_xaie, 7, 0, 1, 1, 0);
    int c722=mlir_aie_acquire_lock(_xaie, 7, 2, 2, 1, 0);

    printf("Lock7_0_1:%d\n", c701);
    printf("Lock7_2_1:%d\n", c721);
    printf("Lock7_2_2:%d\n", c722);
    printf("Lock7_4_1:%d\n", c741);



    mlir_aie_clear_tile_memory(_xaie, 7, 2);
    mlir_aie_clear_tile_memory(_xaie, 7, 4);
    
    
    //uint32_t *ddr_ptr_in;
    //#define DDR_ADDR_IN  (0x4000+0x020100000000LL)
    #define DMA_COUNT 256
    //int fd = open("/dev/mem", O_RDWR | O_SYNC);
    //if (fd != -1) {
    //    ddr_ptr_in  = (uint32_t *)mmap(NULL, 0x8000, PROT_READ|PROT_WRITE, MAP_SHARED, fd, DDR_ADDR_IN);
    //    for (int i=0; i<DMA_COUNT; i++) {
    //        ddr_ptr_in[i] = 72;
    //    }
    //}
    

    for (int bd=0;bd<DMA_COUNT;bd++) {
        mlir_aie_write_buffer_buf72_1(_xaie, bd,72);
    }


    int *mem_ptr0 =
      mlir_aie_mem_alloc(_xaie, 0, 0x4000 + 0x020100000000LL, DMA_COUNT);
    //int *mem_ptr1 =
    //  mlir_aie_mem_alloc(_xaie, 1, 0x5000 + 0x020100000000LL, DMA_COUNT);

    for (int i = 0; i < DMA_COUNT; i++) {
      *(mem_ptr0 + i) = 72;
      //*(mem_ptr1 + i) = 74;
    }
    mlir_aie_sync_mem_dev(_xaie, 0);

#ifdef LIBXAIENGINEV2
    mlir_aie_external_set_addr_myBuffer_70_0((u64)mem_ptr0);
    mlir_aie_configure_shimdma_70(_xaie);
#endif



    usleep(sleep_u);
    int d721=mlir_aie_acquire_lock(_xaie, 7, 2, 1, 0, 0);
    int d741=mlir_aie_acquire_lock(_xaie, 7, 4, 1, 0, 0);
    int d701=mlir_aie_acquire_lock(_xaie, 7, 0, 1, 0, 0);
    int d722=mlir_aie_acquire_lock(_xaie, 7, 2, 2, 0, 0);

    printf("Lock7_0_1:%d\n", d701);
    printf("Lock7_2_1:%d\n", d721);
    printf("Lock7_2_2:%d\n", d722);
    printf("Lock7_4_1:%d\n", d741);


    mlir_aie_release_lock(_xaie, 7, 0, 1, 1, 0);
    mlir_aie_release_lock(_xaie, 7, 2, 2, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 2, 1, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 4, 1, 0, 0);

    
    

    usleep(sleep_u);

    int tries = 1;
    printf("Waiting to acquire output lock for read ...\n");
    while (tries < 1000 && (!mlir_aie_acquire_lock(_xaie, 7, 4, 1, 1, 0)) ) { //&& !mlir_aie_acquire_lock(_xaie, 7, 4, 1, 1, 0)
      tries++;
    }
    printf("It took %d tries.\n", tries);

    int a721=mlir_aie_acquire_lock(_xaie, 7, 2, 1, 1, 0);
    int a741=mlir_aie_acquire_lock(_xaie, 7, 4, 1, 0, 0);
    int a7411=mlir_aie_acquire_lock(_xaie, 7, 4, 1, 1, 0);
    int a722=mlir_aie_acquire_lock(_xaie, 7, 2, 2, 1, 0);

    printf("Lock7_2_1:%d\n", a721);
    printf("Lock7_2_2:%d\n", a722);
    printf("Lock7_4_1:%d\n", a741);
    printf("Lock7_4_11:%d\n", a7411);

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
