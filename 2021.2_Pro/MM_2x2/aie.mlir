module @test_single_kernel {
  
  %t62 = AIE.tile(6, 2)
  %t52 = AIE.tile(5, 2)
  %t53 = AIE.tile(5, 3)
  %t54 = AIE.tile(5, 4)

  %t70 = AIE.tile(7, 0)
  %t72 = AIE.tile(7, 2)
  %t73 = AIE.tile(7, 3)
  %t74 = AIE.tile(7, 4)

  %buf72_0 = AIE.buffer(%t72) {sym_name = "buf72_0"} : memref<1024xi32>
  %buf72_1 = AIE.buffer(%t72) {sym_name = "buf72_1"} : memref<1024xi32>
  %buf72_2 = AIE.buffer(%t72) {sym_name = "buf72_2"} : memref<1024xi32>
  %buf72_3 = AIE.buffer(%t72) {sym_name = "buf72_3"} : memref<1024xi32>


  %buf53_0 = AIE.buffer(%t53) {sym_name = "buf53_0"} : memref<1024xi32>
  %buf53_1 = AIE.buffer(%t53) {sym_name = "buf53_1"} : memref<1024xi32>
  %buf53_2 = AIE.buffer(%t53) {sym_name = "buf53_2"} : memref<1024xi32>
  %buf53_3 = AIE.buffer(%t53) {sym_name = "buf53_3"} : memref<1024xi32>
  %buf54_0 = AIE.buffer(%t54) {sym_name = "buf54_0"} : memref<1024xi32>
  %buf54_1 = AIE.buffer(%t54) {sym_name = "buf54_1"} : memref<1024xi32>
  %buf54_2 = AIE.buffer(%t54) {sym_name = "buf54_2"} : memref<1024xi32>

  %buf73_0 = AIE.buffer(%t73) {sym_name = "buf73_0"} : memref<1024xi32>
  %buf73_1 = AIE.buffer(%t73) {sym_name = "buf73_1"} : memref<1024xi32>
  %buf73_2 = AIE.buffer(%t73) {sym_name = "buf73_2"} : memref<1024xi32>
  %buf73_3 = AIE.buffer(%t73) {sym_name = "buf73_3"} : memref<1024xi32>
  %buf74_0 = AIE.buffer(%t74) {sym_name = "buf74_0"} : memref<1024xi32>
  %buf74_1 = AIE.buffer(%t74) {sym_name = "buf74_1"} : memref<1024xi32>
  %buf74_2 = AIE.buffer(%t74) {sym_name = "buf74_2"} : memref<1024xi32>


  %sw72 = AIE.switchbox(%t72) {
    AIE.connect<"DMA" : 0, "North" : 0>
    AIE.connect<"DMA" : 1, "North" : 1>
    AIE.connect<"DMA" : 0, "West" : 0>
    AIE.connect<"DMA" : 1, "West" : 1>
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

  %sw62 = AIE.switchbox(%t62) {
    AIE.connect<"East" : 0, "West" : 0>
    AIE.connect<"East" : 1, "West" : 1>
  }

  %sw52 = AIE.switchbox(%t52) {
    AIE.connect<"East" : 0, "North" : 0>
    AIE.connect<"East" : 1, "North" : 1>
  }

  %sw53 = AIE.switchbox(%t53) {
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

  %sw54 = AIE.switchbox(%t54) {
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

  %lock53_0 = AIE.lock(%t53, 0)
  %lock53_1 = AIE.lock(%t53, 1)
  %m53 = AIE.mem(%t53)  {
  AIE.dmaStart("S2MM0", ^bd0, ^dma0)
  ^dma0:
    AIE.dmaStart("S2MM1", ^bd1, ^end)
  ^bd0: 
    AIE.useLock(%lock53_0, Acquire, 0)
    AIE.dmaBd(<%buf53_0 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock53_0, Release, 1)
    cf.br ^bd0
  ^bd1: 
    AIE.useLock(%lock53_1, Acquire, 0)
    AIE.dmaBd(<%buf53_1 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock53_1, Release, 1)
    cf.br ^bd1
  ^end: 
    AIE.end
  }


  %lock54_0 = AIE.lock(%t54, 0)
  %lock54_1 = AIE.lock(%t54, 1)
  %m54 = AIE.mem(%t54)  {
  
  AIE.dmaStart("S2MM0", ^bd0, ^dma0)
  ^dma0:
    AIE.dmaStart("S2MM1", ^bd1, ^end)
  ^bd0: 
    AIE.useLock(%lock54_0, Acquire, 0)
    AIE.dmaBd(<%buf54_0 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock54_0, Release, 1)
    cf.br ^bd0
  ^bd1: 
    AIE.useLock(%lock54_1, Acquire, 0)
    AIE.dmaBd(<%buf54_1 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%lock54_1, Release, 1)
    cf.br ^bd1
  ^end: 
    AIE.end
  }

  func private @extern_kernel(%A: memref<1024xi32>, %B: memref<1024xi32>, %acc: memref<1024xi32>, %C: memref<1024xi32>) -> ()


  %lock53_2 = AIE.lock(%t53, 2)
  %core53 = AIE.core(%t53) { 
    AIE.useLock(%lock53_0, "Acquire", 1) // acquire for read(e.g. input ping)
    AIE.useLock(%lock53_1, "Acquire", 1) // acquire for write
    AIE.useLock(%lock53_2, "Acquire", 0)
    call @extern_kernel(%buf53_0, %buf53_1, %buf53_2, %buf53_3) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%lock53_2, "Release", 1)
    AIE.end
  } { link_with="kernel.o" }


  %lock54_2 = AIE.lock(%t54, 2)
  %core54 = AIE.core(%t54) { 
    AIE.useLock(%lock53_2, "Acquire", 1)
    AIE.useLock(%lock54_0, "Acquire", 1) // acquire for read(e.g. input ping)
    AIE.useLock(%lock54_1, "Acquire", 1) // acquire for write
    AIE.useLock(%lock54_2, "Acquire", 0)
    call @extern_kernel(%buf54_0, %buf54_1, %buf53_3, %buf54_2) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%lock54_2, "Release", 1)
    AIE.end
  } { link_with="kernel.o" }


  

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