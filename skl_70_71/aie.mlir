module @test_single_kernel {

  %t70 = AIE.tile(7, 0)
  %t71 = AIE.tile(7, 1)
  %t72 = AIE.tile(7, 2)

   
  %buffer0 = AIE.external_buffer 0x020100004000 : memref<1024 x i32> 
  %buffer1 = AIE.external_buffer 0x020100006000 : memref<1024 x i32>

  AIE.flow(%t70, "DMA" : 0, %t71, "DMA" : 0)
  AIE.flow(%t70, "DMA" : 1, %t71, "DMA" : 1)


  %dma0 = AIE.shimDMA(%t70) {
    %lock1 = AIE.lock(%t70, 1)
    %lock2 = AIE.lock(%t70, 2)
    AIE.dmaStart(MM2S0, ^bd0, ^dma)
    ^dma:
      AIE.dmaStart(MM2S1, ^bd1, ^end)
    ^bd0:
      AIE.useLock(%lock1, Acquire, 1)
      AIE.dmaBd(<%buffer0 : memref<1024 x i32>, 0, 1024>, 0)
      AIE.useLock(%lock1, Release, 0)
      cf.br ^bd0
    ^bd1:
      AIE.useLock(%lock2, Acquire, 1)
      AIE.dmaBd(<%buffer1 : memref<1024 x i32>, 0, 1024>, 0)
      AIE.useLock(%lock2, Release, 0)
      cf.br ^bd1
    ^end:
      AIE.end
  }

  %buf71_0 = AIE.buffer(%t71) { sym_name = "a" } : memref<1024xi32>
  %buf71_1 = AIE.buffer(%t71) { sym_name = "b" } : memref<1024xi32>
  %buf72_0 = AIE.buffer(%t72) { sym_name = "acc" } : memref<1024xi32>
  %buf72_1 = AIE.buffer(%t72) { sym_name = "c" } : memref<1024xi32>

  %lock71_0 = AIE.lock(%t71, 0)
  %lock71_1 = AIE.lock(%t71, 1)
  %lock72_0 = AIE.lock(%t72, 0)

  %m71  = AIE.mem(%t71) {
    AIE.dmaStart(S2MM0, ^bd0, ^dma)
    ^dma:
      AIE.dmaStart(S2MM1, ^bd1, ^end)
    ^bd0:
      AIE.useLock(%lock71_0, "Acquire", 0)
      AIE.dmaBd(<%buf71_0 : memref<1024xi32>, 0, 1024>, 0)
      AIE.useLock(%lock71_0, "Release", 1)
      cf.br ^bd0
    ^bd1:
      AIE.useLock(%lock71_1, "Acquire", 0)
      AIE.dmaBd(<%buf71_1 : memref<1024xi32>, 0, 1024>, 0)
      AIE.useLock(%lock71_1, "Release", 1)
      cf.br ^bd1
    ^end:
      AIE.end
  }

  func private @extern_kernel(%A: memref<1024xi32>, %B: memref<1024xi32>, %acc: memref<1024xi32>, %C: memref<1024xi32>) -> ()

  %core71 = AIE.core(%t71) { 
    AIE.useLock(%lock71_0, "Acquire", 1) 
    AIE.useLock(%lock71_1, "Acquire", 1) 
    AIE.useLock(%lock72_0, "Acquire", 0) 
    call @extern_kernel(%buf71_0, %buf71_1, %buf72_0, %buf72_1) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%lock72_0, "Release", 1) 
    AIE.end
  } { link_with="kernel.o" }

}