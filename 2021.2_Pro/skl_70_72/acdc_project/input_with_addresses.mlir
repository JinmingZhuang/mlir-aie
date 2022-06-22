module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.tile(7, 2)
  %2 = AIE.tile(7, 3)
  %3 = AIE.external_buffer 2203318239232 : memref<1024xi32>
  %4 = AIE.external_buffer 2203318247424 : memref<1024xi32>
  AIE.flow(%0, DMA : 0, %1, DMA : 0)
  AIE.flow(%0, DMA : 1, %1, DMA : 1)
  %5 = AIE.shimDMA(%0) {
    %15 = AIE.lock(%0, 1)
    %16 = AIE.lock(%0, 2)
    %17 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %18 = AIE.dmaStart(MM2S1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%15, Acquire, 1)
    AIE.dmaBd(<%3 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%15, Release, 0)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%16, Acquire, 1)
    AIE.dmaBd(<%4 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%16, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %6 = AIE.buffer(%1) {address = 4096 : i32, sym_name = "a"} : memref<1024xi32>
  %7 = AIE.buffer(%1) {address = 8192 : i32, sym_name = "b"} : memref<1024xi32>
  %8 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "acc"} : memref<1024xi32>
  %9 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "c"} : memref<1024xi32>
  %10 = AIE.lock(%1, 0)
  %11 = AIE.lock(%1, 1)
  %12 = AIE.lock(%2, 0)
  %13 = AIE.mem(%1) {
    %15 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %16 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%10, Acquire, 0)
    AIE.dmaBd(<%6 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%10, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%11, Acquire, 0)
    AIE.dmaBd(<%7 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%11, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %14 = AIE.core(%1) {
    AIE.useLock(%10, Acquire, 1)
    AIE.useLock(%11, Acquire, 1)
    AIE.useLock(%12, Acquire, 0)
    call @extern_kernel(%6, %7, %8, %9) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%12, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
}

