module @test_single_kernel {
  


  %t60 = AIE.tile(6, 0)
  %t62 = AIE.tile(6, 2)
  %t63 = AIE.tile(6, 3)
  %t64 = AIE.tile(6, 4)

  %buf62_0 = AIE.buffer(%t62) {sym_name = "buf62_0"} : memref<1024xi32>
  %buf62_1 = AIE.buffer(%t62) {sym_name = "buf62_1"} : memref<1024xi32>
  %buf62_2 = AIE.buffer(%t62) {sym_name = "buf62_2"} : memref<1024xi32>
  %buf62_3 = AIE.buffer(%t62) {sym_name = "buf62_3"} : memref<1024xi32>

  %buf63_0 = AIE.buffer(%t63) {sym_name = "buf63_0"} : memref<1024xi32>
  %buf63_1 = AIE.buffer(%t63) {sym_name = "buf63_1"} : memref<1024xi32>
  %buf63_2 = AIE.buffer(%t63) {sym_name = "buf63_2"} : memref<1024xi32>
  %buf63_3 = AIE.buffer(%t63) {sym_name = "buf63_3"} : memref<1024xi32>
  %buf64_0 = AIE.buffer(%t64) {sym_name = "buf64_0"} : memref<1024xi32>
  %buf64_1 = AIE.buffer(%t64) {sym_name = "buf64_1"} : memref<1024xi32>
  %buf64_2 = AIE.buffer(%t64) {sym_name = "buf64_2"} : memref<1024xi32>


  %sw62 = AIE.switchbox(%t62) {
    AIE.connect<"DMA" : 0, "North" : 0>
    AIE.connect<"DMA" : 1, "North" : 1>
  }

  %m62 = AIE.mem(%t62) {
    %lock62_4 = AIE.lock(%t62, 4)
    %lock62_5 = AIE.lock(%t62, 5)
    %lock62_6 = AIE.lock(%t62, 6)
    %lock62_7 = AIE.lock(%t62, 7)
    AIE.dmaStart("MM2S0", ^bd4, ^dma2)
    ^dma2:
        AIE.dmaStart("MM2S1", ^bd6, ^end)
    ^bd4:
      AIE.useLock(%lock62_4, "Acquire", 0)
      AIE.dmaBdPacket(0x0, 0x0)
      AIE.dmaBd(<%buf62_0 : memref<1024xi32>, 0, 1024>, 0)
      AIE.useLock(%lock62_4, "Release", 1)
      cf.br ^bd5
    ^bd5:
      AIE.useLock(%lock62_5, "Acquire", 0)
      AIE.dmaBdPacket(0x1, 0x1)
      AIE.dmaBd(<%buf62_1 : memref<1024xi32>, 0, 1024>, 0)
      AIE.useLock(%lock62_5, "Release", 1)
      cf.br ^bd4
    ^bd6:
      AIE.useLock(%lock62_6, "Acquire", 0)
      AIE.dmaBdPacket(0x2, 0x2)
      AIE.dmaBd(<%buf62_2 : memref<1024xi32>, 0, 1024>, 0)
      AIE.useLock(%lock62_6, "Release", 1)
      cf.br ^bd7
    ^bd7:
      AIE.useLock(%lock62_7, "Acquire", 0)
      AIE.dmaBdPacket(0x3, 0x3)
      AIE.dmaBd(<%buf62_3 : memref<1024xi32>, 0, 1024>, 0)
      AIE.useLock(%lock62_7, "Release", 1)
      cf.br ^bd6
    ^end:
      AIE.end
  }

 

  func private @extern_kernel(%A: memref<1024xi32>, %B: memref<1024xi32>, %acc: memref<1024xi32>, %C: memref<1024xi32>) -> ()

  %sw63 = AIE.switchbox(%t63) {
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

  %sw64 = AIE.switchbox(%t64) {
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


  %lock63_2 = AIE.lock(%t63, 2)
  %core63 = AIE.core(%t63) { 
    AIE.useLock(%lock63_0, "Acquire", 1) // acquire for read(e.g. input ping)
    AIE.useLock(%lock63_1, "Acquire", 1) // acquire for write
    AIE.useLock(%lock63_2, "Acquire", 0)
    call @extern_kernel(%buf63_0, %buf63_1, %buf63_2, %buf63_3) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%lock63_2, "Release", 1)
    AIE.end
  } { link_with="kernel.o" }

  %lock64_2 = AIE.lock(%t64, 2)
  %core64 = AIE.core(%t64) { 
    AIE.useLock(%lock63_2, "Acquire", 1)
    AIE.useLock(%lock64_0, "Acquire", 1) // acquire for read(e.g. input ping)
    AIE.useLock(%lock64_1, "Acquire", 1) // acquire for write
    AIE.useLock(%lock64_2, "Acquire", 0)
    call @extern_kernel(%buf64_0, %buf64_1, %buf63_3, %buf64_2) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%lock64_2, "Release", 1)
    AIE.end
  } { link_with="kernel.o" }


}