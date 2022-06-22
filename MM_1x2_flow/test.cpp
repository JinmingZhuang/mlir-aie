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
int check_parity(unsigned int n) 
{
    int b;
    //Left Shifting by double of previous operation shift
    //And take xor with the previous result.
    b = n ^ (n >> 1); 
    b = b ^ (b >> 2); 
    b = b ^ (b >> 4); 
    b = b ^ (b >> 8); 
    b = b ^ (b >> 16); 
    //Now b contain the parity value
    //If b is odd mean odd parity else even parity
    if (b & 1) //This is used for checking odd
        return 1; 
    else      
        return 0; 
}

int generateHeader(unsigned int col, unsigned int row, unsigned int pktType, unsigned int ID){
    int header=0;
    header |= ID;
    header |= pktType<<12;
    header |= row<<16;
    header |= col<<21;
    if(check_parity(header)==0){
      header |= 1<<31;
    }
    return header;
}

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
    //mlir_aie_init_mems(_xaie, 4);
    int errors = 0;

    printf("Finish configure\n");
#define DMA_COUNT 1024
    //int *mem_ptr0 =
    //  mlir_aie_mem_alloc(_xaie, 0, 0x4000 + 0x020100000000LL, DMA_COUNT);
    //int *mem_ptr1 =
    //  mlir_aie_mem_alloc(_xaie, 1, 0x5000 + 0x020100000000LL, DMA_COUNT);
    //int *mem_ptr2 =
    //  mlir_aie_mem_alloc(_xaie, 2, 0x6000 + 0x020100000000LL, DMA_COUNT);
    //int *mem_ptr3 =
    //  mlir_aie_mem_alloc(_xaie, 3, 0x7000 + 0x020100000000LL, DMA_COUNT);
//
    //for (int i = 0; i < DMA_COUNT; i++) {
    //  
    //  *(mem_ptr0 + i) = 1;
    //  *(mem_ptr1 + i) = 2;
    //  *(mem_ptr2 + i) = 1;
    //  *(mem_ptr3 + i) = 2;
    //  
    //}

    //mlir_aie_sync_mem_dev(_xaie, 0);
    //mlir_aie_sync_mem_dev(_xaie, 1);
    //mlir_aie_sync_mem_dev(_xaie, 2);
    //mlir_aie_sync_mem_dev(_xaie, 3);

#ifdef LIBXAIENGINEV2
    //mlir_aie_external_set_addr_myBuffer_70_0((u64)mem_ptr0);
    //mlir_aie_external_set_addr_myBuffer_70_1((u64)mem_ptr1);
    //mlir_aie_external_set_addr_myBuffer_70_2((u64)mem_ptr2);
    //mlir_aie_external_set_addr_myBuffer_70_3((u64)mem_ptr3);
    //mlir_aie_configure_shimdma_70(_xaie);
#endif
    
    mlir_aie_clear_tile_memory(_xaie, 7, 2);
    mlir_aie_clear_tile_memory(_xaie, 7, 3);
    mlir_aie_clear_tile_memory(_xaie, 7, 4);


    usleep(sleep_u);

    //for (int i = 0; i < DMA_COUNT; i++) {
    //  
    //  *(mem_ptr0 + i) = 1;
    //  *(mem_ptr1 + i) = 2;
    //  *(mem_ptr2 + i) = 1;
    //  *(mem_ptr3 + i) = 2;
    //  
    //}

    for (int bd=0;bd<DMA_COUNT;bd++) {
        mlir_aie_write_buffer_buf72_0(_xaie, bd, 1);
        mlir_aie_write_buffer_buf72_1(_xaie, bd, 2);
        mlir_aie_write_buffer_buf72_2(_xaie, bd, 1);
        mlir_aie_write_buffer_buf72_3(_xaie, bd, 2);
    }


    for (int bd=0;bd<DMA_COUNT;bd++) {
        mlir_aie_write_buffer_buf73_2(_xaie, bd, 1);
    }


    mlir_aie_release_lock(_xaie, 7, 2, 4, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 2, 5, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 2, 6, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 2, 7, 0, 0);

    mlir_aie_release_lock(_xaie, 7, 3, 0, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 3, 1, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 3, 2, 0, 0);

    mlir_aie_release_lock(_xaie, 7, 4, 0, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 4, 1, 0, 0);
    mlir_aie_release_lock(_xaie, 7, 4, 2, 0, 0);

    usleep(sleep_u);
    


    printf("before core start\n");


    mlir_aie_start_cores(_xaie);
    usleep(sleep_u);

    mlir_aie_print_tile_status(_xaie, 7, 3);
    mlir_aie_print_tile_status(_xaie, 7, 4);

    int tries0 = 1;
    int tries1 = 1;

    while ((tries1 < 1000) && (!mlir_aie_acquire_lock(_xaie, 7, 4, 2, 1, 0))) {
      tries1++;
    }


    printf("It took %d tries0.\n", tries0);
    printf("It took %d tries1.\n", tries1);

    for (int bd=0;bd<DMA_COUNT;bd++) {
        mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf72_0(_xaie, bd), 1,
                   errors);
        mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf72_1(_xaie, bd), 2,
                   errors);
        mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf72_2(_xaie, bd), 1,
                   errors);
        mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf72_3(_xaie, bd), 2,
                   errors);
        mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf73_2(_xaie, bd), 1,
                   errors);
        mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf73_3(_xaie, bd),33,
                   errors);
        mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf74_2(_xaie, bd), 161,
                   errors);
    }

    mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf73_0(_xaie, 1023), 1,
                   errors);
    mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf73_1(_xaie, 1023), 1,
               errors);
    mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf74_0(_xaie, 1023), 2,
                   errors);
    mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf74_1(_xaie, 1023), 2,
               errors);


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
