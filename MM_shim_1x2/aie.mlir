module @test_single_kernel {
  


  %t70 = AIE.tile(7, 0)
  %t72 = AIE.tile(7, 2)
  %t73 = AIE.tile(7, 3)
  %t74 = AIE.tile(7, 4)
  

  %buffer0 = AIE.external_buffer 0x020100002000 : memref<1025 x i32> 
  %buffer1 = AIE.external_buffer 0x020100004000 : memref<1025 x i32>
  %buffer2 = AIE.external_buffer 0x020100006000 : memref<1025 x i32> 
  %buffer3 = AIE.external_buffer 0x020100008000 : memref<1025 x i32>

  %buf73_0 = AIE.buffer(%t73) {sym_name = "buf73_0"} : memref<1024xi32>
  %buf73_1 = AIE.buffer(%t73) {sym_name = "buf73_1"} : memref<1024xi32>
  %buf73_2 = AIE.buffer(%t73) {sym_name = "buf73_2"} : memref<1024xi32>
  %buf73_3 = AIE.buffer(%t73) {sym_name = "buf73_3"} : memref<1024xi32>
  %buf74_0 = AIE.buffer(%t74) {sym_name = "buf74_0"} : memref<1024xi32>
  %buf74_1 = AIE.buffer(%t74) {sym_name = "buf74_1"} : memref<1024xi32>
  %buf74_2 = AIE.buffer(%t74) {sym_name = "buf74_2"} : memref<1024xi32>

  AIE.flow(%t70, "DMA" : 0, %t72, "North" : 0)
  AIE.flow(%t70, "DMA" : 1, %t72, "North" : 1)

  %dma0 = AIE.shimDMA(%t70) {
    %lock70_0 = AIE.lock(%t70, 0)
    %lock70_1 = AIE.lock(%t70, 1)
    %lock70_2 = AIE.lock(%t70, 2)
    %lock70_3 = AIE.lock(%t70, 3)
    AIE.dmaStart(MM2S0, ^bd0, ^dma)
    ^dma:
      AIE.dmaStart(MM2S1, ^bd2, ^end)
    ^bd0:
      AIE.useLock(%lock70_0, Acquire, 1)
      AIE.dmaBd(<%buffer0 : memref<1025 x i32>, 0, 1025>, 0)
      AIE.useLock(%lock70_0, Release, 0)
      cf.br ^bd1
    ^bd1:
      AIE.useLock(%lock70_1, Acquire, 1)
      AIE.dmaBd(<%buffer1 : memref<1025 x i32>, 0, 1025>, 0)
      AIE.useLock(%lock70_1, Release, 0)
      cf.br ^bd0
    ^bd2:
      AIE.useLock(%lock70_2, Acquire, 1)
      AIE.dmaBd(<%buffer2 : memref<1025 x i32>, 0, 1025>, 0)
      AIE.useLock(%lock70_2, Release, 0)
      cf.br ^bd3
    ^bd3:
      AIE.useLock(%lock70_3, Acquire, 1)
      AIE.dmaBd(<%buffer3 : memref<1025 x i32>, 0, 1025>, 0)
      AIE.useLock(%lock70_3, Release, 0)
      cf.br ^bd2
    ^end:
      AIE.end
  }

  

 

  func private @extern_kernel(%A: memref<1024xi32>, %B: memref<1024xi32>, %acc: memref<1024xi32>, %C: memref<1024xi32>) -> ()

  %sw73 = AIE.switchbox(%t73) {
    %tmsel0 = AIE.amsel<0> (0) // <arbiter> (mask). mask is msel_enable
    %tmsel1 = AIE.amsel<1> (0) // <arbiter> (mask). mask is msel_enable
    %tmsel2 = AIE.amsel<2> (0) // <arbiter> (mask). mask is msel_enable
    %tmsel3 = AIE.amsel<3> (0) // <arbiter> (mask). mask is msel_enable
    %tmaster0 = AIE.masterset(DMA : 0, %tmsel0)
    %tmaster1 = AIE.masterset(North : 0, %tmsel1)
    %tmaster2 = AIE.masterset(DMA : 1, %tmsel2)
    %tmaster3 = AIE.masterset(North : 1, %tmsel3)
    AIE.packetrules(South : 0)  {
      AIE.rule(0x1f, 0x0, %tmsel0) // (mask, id)
      AIE.rule(0x1f, 0x1, %tmsel1) // (mask, id)
    }
    AIE.packetrules(South : 1)  {
      AIE.rule(0x1f, 0x2, %tmsel2) // (mask, id)
      AIE.rule(0x1f, 0x3, %tmsel3) // (mask, id)
    }
  }

  %sw74 = AIE.switchbox(%t74) {
    %tmsel0 = AIE.amsel<0> (0) // <arbiter> (mask). mask is msel_enable
    %tmsel1 = AIE.amsel<1> (0) // <arbiter> (mask). mask is msel_enable
    %tmaster0 = AIE.masterset(DMA : 0, %tmsel0)
    %tmaster1 = AIE.masterset(DMA : 1, %tmsel1)
    AIE.packetrules(South : 0)  {
      AIE.rule(0x1f, 0x1, %tmsel0) // (mask, id)
    }
    AIE.packetrules(South : 1)  {
      AIE.rule(0x1f, 0x3, %tmsel1) // (mask, id)
    }
  }

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