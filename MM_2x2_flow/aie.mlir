module @test_single_kernel {
  
  %t62 = AIE.tile(6, 2)
  %t63 = AIE.tile(6, 3)
  %t64 = AIE.tile(6, 4)

  %t70 = AIE.tile(7, 0)
  %t72 = AIE.tile(7, 2)
  %t73 = AIE.tile(7, 3)
  %t74 = AIE.tile(7, 4)

  %buf72_0 = AIE.buffer(%t72) {sym_name = "buf72_0"} : memref<1024xi32>
  %buf72_1 = AIE.buffer(%t72) {sym_name = "buf72_1"} : memref<1024xi32>
  %buf72_2 = AIE.buffer(%t72) {sym_name = "buf72_2"} : memref<1024xi32>
  %buf72_3 = AIE.buffer(%t72) {sym_name = "buf72_3"} : memref<1024xi32>


  %buf63_0 = AIE.buffer(%t63) {sym_name = "buf63_0"} : memref<1024xi32>
  %buf63_1 = AIE.buffer(%t63) {sym_name = "buf63_1"} : memref<1024xi32>
  %buf63_2 = AIE.buffer(%t63) {sym_name = "buf63_2"} : memref<1024xi32>
  %buf63_3 = AIE.buffer(%t63) {sym_name = "buf63_3"} : memref<1024xi32>
  %buf64_0 = AIE.buffer(%t64) {sym_name = "buf64_0"} : memref<1024xi32>
  %buf64_1 = AIE.buffer(%t64) {sym_name = "buf64_1"} : memref<1024xi32>
  %buf64_2 = AIE.buffer(%t64) {sym_name = "buf64_2"} : memref<1024xi32>

  %buf73_0 = AIE.buffer(%t73) {sym_name = "buf73_0"} : memref<1024xi32>
  %buf73_1 = AIE.buffer(%t73) {sym_name = "buf73_1"} : memref<1024xi32>
  %buf73_2 = AIE.buffer(%t73) {sym_name = "buf73_2"} : memref<1024xi32>
  %buf73_3 = AIE.buffer(%t73) {sym_name = "buf73_3"} : memref<1024xi32>
  %buf74_0 = AIE.buffer(%t74) {sym_name = "buf74_0"} : memref<1024xi32>
  %buf74_1 = AIE.buffer(%t74) {sym_name = "buf74_1"} : memref<1024xi32>
  %buf74_2 = AIE.buffer(%t74) {sym_name = "buf74_2"} : memref<1024xi32>

  AIE.broad_packet(%t72, "DMA" : 0){
    AIE.bp_id(0x0){
      AIE.bp_dest<%t73, "DMA" : 0>
      AIE.bp_dest<%t63, "DMA" : 0>
    }
    AIE.bp_id(0x1){
      AIE.bp_dest<%t74, "DMA" : 0>
      AIE.bp_dest<%t64, "DMA" : 0>
    }
  }

   AIE.broad_packet(%t72, "DMA" : 1){
    AIE.bp_id(0x2){
      AIE.bp_dest<%t73, "DMA" : 1>
      AIE.bp_dest<%t63, "DMA" : 1>
    }
    AIE.bp_id(0x3){
      AIE.bp_dest<%t74, "DMA" : 1>
      AIE.bp_dest<%t64, "DMA" : 1>
    }
  }


  %m72 = AIE.mem(%t72) {
    %lock72_4 = AIE.lock(%t72, 4)
    %lock72_5 = AIE.lock(%t72, 5)
    %lock72_6 = AIE.lock(%t72, 6)
    %lock72_7 = AIE.lock(%t72, 7)
    AIE.dmaStart("MM2S0", ^bd4, ^dma2)
    ^dma2:
        AIE.dmaStart("MM2S1", ^bd6, ^end)
    ^bd4:
      AIE.useLock(%lock72_4, "Acquire", 0)
      AIE.dmaBdPacket(0x0, 0x0)
      AIE.dmaBd(<%buf72_0 : memref<1024xi32>, 0, 1024>, 0)
      AIE.useLock(%lock72_4, "Release", 1)
      cf.br ^bd5
    ^bd5:
      AIE.useLock(%lock72_5, "Acquire", 0)
      AIE.dmaBdPacket(0x1, 0x1)
      AIE.dmaBd(<%buf72_1 : memref<1024xi32>, 0, 1024>, 0)
      AIE.useLock(%lock72_5, "Release", 1)
      cf.br ^bd4
    ^bd6:
      AIE.useLock(%lock72_6, "Acquire", 0)
      AIE.dmaBdPacket(0x2, 0x2)
      AIE.dmaBd(<%buf72_2 : memref<1024xi32>, 0, 1024>, 0)
      AIE.useLock(%lock72_6, "Release", 1)
      cf.br ^bd7
    ^bd7:
      AIE.useLock(%lock72_7, "Acquire", 0)
      AIE.dmaBdPacket(0x3, 0x3)
      AIE.dmaBd(<%buf72_3 : memref<1024xi32>, 0, 1024>, 0)
      AIE.useLock(%lock72_7, "Release", 1)
      cf.br ^bd6
    ^end:
      AIE.end
  }

  %lock63_0 = AIE.lock(%t63, 0)
  %lock63_1 = AIE.lock(%t63, 1)
  %m63 = AIE.mem(%t63)  {
  AIE.dmaStart("S2MM0", ^bd0, ^dma0)
  ^dma0:
    AIE.dmaStart("S2MM1", ^bd1, ^end)
  ^bd0: 
    AIE.useLock(%lock63_0, Acquire, 0)
    AIE.dmaBd(<%buf63_0 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock63_0, Release, 1)
    cf.br ^bd0
  ^bd1: 
    AIE.useLock(%lock63_1, Acquire, 0)
    AIE.dmaBd(<%buf63_1 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock63_1, Release, 1)
    cf.br ^bd1
  ^end: 
    AIE.end
  }


  %lock64_0 = AIE.lock(%t64, 0)
  %lock64_1 = AIE.lock(%t64, 1)
  %m64 = AIE.mem(%t64)  {
  
  AIE.dmaStart("S2MM0", ^bd0, ^dma0)
  ^dma0:
    AIE.dmaStart("S2MM1", ^bd1, ^end)
  ^bd0: 
    AIE.useLock(%lock64_0, Acquire, 0)
    AIE.dmaBd(<%buf64_0 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock64_0, Release, 1)
    cf.br ^bd0
  ^bd1: 
    AIE.useLock(%lock64_1, Acquire, 0)
    AIE.dmaBd(<%buf64_1 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock64_1, Release, 1)
    cf.br ^bd1
  ^end: 
    AIE.end
  }

  func private @extern_kernel(%A: memref<1024xi32>, %B: memref<1024xi32>, %acc: memref<1024xi32>, %C: memref<1024xi32>) -> ()


  %lock63_3 = AIE.lock(%t63, 3)
  %core63 = AIE.core(%t63) { 
    AIE.useLock(%lock63_0, "Acquire", 1)
    AIE.useLock(%lock63_1, "Acquire", 1)
    AIE.useLock(%lock63_3, "Acquire", 0)
    call @extern_kernel(%buf63_0, %buf63_1, %buf63_2, %buf63_3) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%lock63_3, "Release", 1)
    AIE.end
  } { link_with="kernel.o" }


  %lock64_2 = AIE.lock(%t64, 2)
  %core64 = AIE.core(%t64) { 
    AIE.useLock(%lock63_3, "Acquire", 1)
    AIE.useLock(%lock64_0, "Acquire", 1)
    AIE.useLock(%lock64_1, "Acquire", 1)
    AIE.useLock(%lock64_2, "Acquire", 0)
    call @extern_kernel(%buf64_0, %buf64_1, %buf63_3, %buf64_2) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%lock64_2, "Release", 1)
    AIE.end
  } { link_with="kernel.o" }



  %lock73_0 = AIE.lock(%t73, 0)
  %lock73_1 = AIE.lock(%t73, 1)
  %m73 = AIE.mem(%t73)  {
  AIE.dmaStart("S2MM0", ^bd0, ^dma0)
  ^dma0:
    AIE.dmaStart("S2MM1", ^bd1, ^end)
  ^bd0: 
    AIE.useLock(%lock73_0, Acquire, 0)
    AIE.dmaBd(<%buf73_0 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock73_0, Release, 1)
    cf.br ^bd0
  ^bd1: 
    AIE.useLock(%lock73_1, Acquire, 0)
    AIE.dmaBd(<%buf73_1 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock73_1, Release, 1)
    cf.br ^bd1
  ^end: 
    AIE.end
  }


  %lock74_0 = AIE.lock(%t74, 0)
  %lock74_1 = AIE.lock(%t74, 1)
  %m74 = AIE.mem(%t74)  {
  
  AIE.dmaStart("S2MM0", ^bd0, ^dma0)
  ^dma0:
    AIE.dmaStart("S2MM1", ^bd1, ^end)
  ^bd0: 
    AIE.useLock(%lock74_0, Acquire, 0)
    AIE.dmaBd(<%buf74_0 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock74_0, Release, 1)
    cf.br ^bd0
  ^bd1: 
    AIE.useLock(%lock74_1, Acquire, 0)
    AIE.dmaBd(<%buf74_1 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock74_1, Release, 1)
    cf.br ^bd1
  ^end: 
    AIE.end
  }


  %lock73_2 = AIE.lock(%t73, 2)
  %core73 = AIE.core(%t73) { 
    AIE.useLock(%lock73_0, "Acquire", 1) // acquire for read(e.g. input ping)
    AIE.useLock(%lock73_1, "Acquire", 1) // acquire for write
    AIE.useLock(%lock73_2, "Acquire", 0)
    call @extern_kernel(%buf73_0, %buf73_1, %buf73_2, %buf73_3) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%lock73_2, "Release", 1)
    AIE.end
  } { link_with="kernel.o" }

  %lock74_2 = AIE.lock(%t74, 2)
  %core74 = AIE.core(%t74) { 
    AIE.useLock(%lock73_2, "Acquire", 1)
    AIE.useLock(%lock74_0, "Acquire", 1) // acquire for read(e.g. input ping)
    AIE.useLock(%lock74_1, "Acquire", 1) // acquire for write
    AIE.useLock(%lock74_2, "Acquire", 0)
    call @extern_kernel(%buf74_0, %buf74_1, %buf73_3, %buf74_2) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%lock74_2, "Release", 1)
    AIE.end
  } { link_with="kernel.o" }


}
