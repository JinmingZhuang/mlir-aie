module @test_single_kernel {
  %t60 = AIE.tile(6, 0)
  %t73 = AIE.tile(7, 3)
  %t70 = AIE.tile(7, 0)
  %t72 = AIE.tile(7, 2)
   
  %buffer0 = AIE.external_buffer 0x020100004000 : memref<256 x i32> 
  %buffer1 = AIE.external_buffer 0x020100005000 : memref<256 x i32>
  %buffer2 = AIE.external_buffer 0x020100006000 : memref<256 x i32>
  %buffer3 = AIE.external_buffer 0x020100007000 : memref<256 x i32>


  AIE.flow(%t60, "DMA" : 0, %t73, "DMA" : 0)
  AIE.flow(%t73, "DMA" : 0, %t60, "DMA" : 0)
  AIE.flow(%t70, "DMA" : 0, %t72, "DMA" : 0)
  AIE.flow(%t70, "DMA" : 1, %t72, "DMA" : 1)


  %dma0 = AIE.shimDMA(%t70) {
    %lock1 = AIE.lock(%t70, 1)
    %lock2 = AIE.lock(%t70, 2)
    AIE.dmaStart(MM2S0, ^bd0, ^dma)
    ^dma:
      AIE.dmaStart(MM2S1, ^bd1, ^end)
    ^bd0:
      AIE.useLock(%lock1, Acquire, 1)
      AIE.dmaBd(<%buffer0 : memref<256 x i32>, 0, 256>, 0)
      AIE.useLock(%lock1, Release, 0)
      cf.br ^bd0
    ^bd1:
      AIE.useLock(%lock2, Acquire, 1)
      AIE.dmaBd(<%buffer1 : memref<256 x i32>, 0, 256>, 0)
      AIE.useLock(%lock2, Release, 0)
      cf.br ^bd1
    ^end:
      AIE.end
  }

  
  %dma1 = AIE.shimDMA(%t60) {
    %lock3 = AIE.lock(%t60, 1)
    %lock4 = AIE.lock(%t60, 2)
    AIE.dmaStart(MM2S0, ^bd0, ^dma)
    ^dma:
      AIE.dmaStart(S2MM0, ^bd1, ^end)
    ^bd0:
      AIE.useLock(%lock3, Acquire, 1)
      AIE.dmaBd(<%buffer2 : memref<256 x i32>, 0, 256>, 0)
      AIE.useLock(%lock3, Release, 0)
      cf.br ^bd0
    ^bd1:
      AIE.useLock(%lock4, Acquire, 0)
      AIE.dmaBd(<%buffer3 : memref<256xi32>, 0, 256>, 0)
      AIE.useLock(%lock4, "Release", 1)
      cf.br ^bd1
    ^end:
      AIE.end
  }

  %buf72_0 = AIE.buffer(%t72) { sym_name = "a" } : memref<256xi32>
  %buf72_1 = AIE.buffer(%t72) { sym_name = "b" } : memref<256xi32>
  %buf73_0 = AIE.buffer(%t73) { sym_name = "acc" } : memref<256xi32>
  %buf73_1 = AIE.buffer(%t73) { sym_name = "c" } : memref<256xi32>

  %lock72_0 = AIE.lock(%t72, 2)
  %lock72_1 = AIE.lock(%t72, 3)
  %lock73_0 = AIE.lock(%t73, 2)
  %lock73_1 = AIE.lock(%t73, 3)

  %m72  = AIE.mem(%t72) {
    AIE.dmaStart(S2MM0, ^bd0, ^dma)
    ^dma:
      AIE.dmaStart(S2MM1, ^bd1, ^end)
    ^bd0:
      AIE.useLock(%lock72_0, "Acquire", 0)
      AIE.dmaBd(<%buf72_0 : memref<256xi32>, 0, 256>, 0)
      AIE.useLock(%lock72_0, "Release", 1)
      cf.br ^bd0
    ^bd1:
      AIE.useLock(%lock72_1, "Acquire", 0)
      AIE.dmaBd(<%buf72_1 : memref<256xi32>, 0, 256>, 0)
      AIE.useLock(%lock72_1, "Release", 1)
      cf.br ^bd1
    ^end:
      AIE.end
  }

  %m73  = AIE.mem(%t73) {
    AIE.dmaStart(S2MM0, ^bd0, ^dma)
    ^dma:
      AIE.dmaStart(MM2S0, ^bd1, ^end)
    ^bd0:
      AIE.useLock(%lock73_0, "Acquire", 0)
      AIE.dmaBd(<%buf73_0 : memref<256xi32>, 0, 256>, 0)
      AIE.useLock(%lock73_0, "Release", 1)
      cf.br ^bd0
    ^bd1:
      AIE.useLock(%lock73_1, "Acquire", 1)
      AIE.dmaBd(<%buf73_1 : memref<256xi32>, 0, 256>, 0)
      AIE.useLock(%lock73_1, "Release", 0)
      cf.br ^bd1
    
    ^end:
      AIE.end
  }
  

  func private @extern_kernel(%A: memref<256xi32>, %B: memref<256xi32>, %acc: memref<256xi32>, %C: memref<256xi32>) -> ()

  %core72 = AIE.core(%t72) { 
    AIE.useLock(%lock72_0, "Acquire", 1) // acquire for read
    AIE.useLock(%lock72_1, "Acquire", 1) // acquire for read
    AIE.useLock(%lock73_0, "Acquire", 1) // acquire for read
    call @extern_kernel(%buf72_0, %buf72_1, %buf73_0, %buf73_1) : (memref<256xi32>, memref<256xi32>, memref<256xi32>, memref<256xi32>) -> ()
    AIE.useLock(%lock72_0, "Release", 0) // release for write
    AIE.useLock(%lock72_1, "Release", 0) // release for write
    AIE.useLock(%lock73_0, "Release", 0) // release for write
    AIE.useLock(%lock73_1, "Release", 1) // release for read
    AIE.end
  } { link_with="kernel.o" }

}