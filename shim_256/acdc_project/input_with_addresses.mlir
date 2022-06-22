module @test_single_kernel {
  %0 = AIE.tile(6, 0)
  %1 = AIE.tile(7, 3)
  %2 = AIE.tile(7, 0)
  %3 = AIE.tile(7, 2)
  %4 = AIE.external_buffer 2203318239232 : memref<256xi32>
  %5 = AIE.external_buffer 2203318243328 : memref<256xi32>
  %6 = AIE.external_buffer 2203318247424 : memref<256xi32>
  %7 = AIE.external_buffer 2203318251520 : memref<256xi32>
  AIE.flow(%0, DMA : 0, %1, DMA : 0)
  AIE.flow(%1, DMA : 0, %0, DMA : 0)
  AIE.flow(%2, DMA : 0, %3, DMA : 0)
  AIE.flow(%2, DMA : 1, %3, DMA : 1)
  %8 = AIE.shimDMA(%2) {
    %21 = AIE.lock(%2, 1)
    %22 = AIE.lock(%2, 2)
    %23 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %24 = AIE.dmaStart(MM2S1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%21, Acquire, 1)
    AIE.dmaBd(<%4 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%21, Release, 0)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%22, Acquire, 1)
    AIE.dmaBd(<%5 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%22, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %9 = AIE.shimDMA(%0) {
    %21 = AIE.lock(%0, 1)
    %22 = AIE.lock(%0, 2)
    %23 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %24 = AIE.dmaStart(S2MM0, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%21, Acquire, 1)
    AIE.dmaBd(<%6 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%21, Release, 0)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%22, Acquire, 0)
    AIE.dmaBd(<%7 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%22, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %10 = AIE.buffer(%3) {address = 4096 : i32, sym_name = "a"} : memref<256xi32>
  %11 = AIE.buffer(%3) {address = 5120 : i32, sym_name = "b"} : memref<256xi32>
  %12 = AIE.buffer(%1) {address = 4096 : i32, sym_name = "acc"} : memref<256xi32>
  %13 = AIE.buffer(%1) {address = 5120 : i32, sym_name = "c"} : memref<256xi32>
  %14 = AIE.lock(%3, 2)
  %15 = AIE.lock(%3, 3)
  %16 = AIE.lock(%1, 2)
  %17 = AIE.lock(%1, 3)
  %18 = AIE.mem(%3) {
    %21 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %22 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%14, Acquire, 0)
    AIE.dmaBd(<%10 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%14, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%15, Acquire, 0)
    AIE.dmaBd(<%11 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%15, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %19 = AIE.mem(%1) {
    %21 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %22 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%16, Acquire, 0)
    AIE.dmaBd(<%12 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%16, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%17, Acquire, 1)
    AIE.dmaBd(<%13 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%17, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<256xi32>, memref<256xi32>, memref<256xi32>, memref<256xi32>)
  %20 = AIE.core(%3) {
    AIE.useLock(%14, Acquire, 1)
    AIE.useLock(%15, Acquire, 1)
    AIE.useLock(%16, Acquire, 1)
    call @extern_kernel(%10, %11, %12, %13) : (memref<256xi32>, memref<256xi32>, memref<256xi32>, memref<256xi32>) -> ()
    AIE.useLock(%14, Release, 0)
    AIE.useLock(%15, Release, 0)
    AIE.useLock(%16, Release, 0)
    AIE.useLock(%17, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
}

