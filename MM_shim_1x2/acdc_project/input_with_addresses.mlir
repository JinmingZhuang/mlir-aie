module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.tile(7, 2)
  %2 = AIE.tile(7, 3)
  %3 = AIE.tile(7, 4)
  %4 = AIE.external_buffer 2203318231040 : memref<1025xi32>
  %5 = AIE.external_buffer 2203318239232 : memref<1025xi32>
  %6 = AIE.external_buffer 2203318247424 : memref<1025xi32>
  %7 = AIE.external_buffer 2203318255616 : memref<1025xi32>
  %8 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf73_0"} : memref<1024xi32>
  %9 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "buf73_1"} : memref<1024xi32>
  %10 = AIE.buffer(%2) {address = 12288 : i32, sym_name = "buf73_2"} : memref<1024xi32>
  %11 = AIE.buffer(%2) {address = 16384 : i32, sym_name = "buf73_3"} : memref<1024xi32>
  %12 = AIE.buffer(%3) {address = 4096 : i32, sym_name = "buf74_0"} : memref<1024xi32>
  %13 = AIE.buffer(%3) {address = 8192 : i32, sym_name = "buf74_1"} : memref<1024xi32>
  %14 = AIE.buffer(%3) {address = 12288 : i32, sym_name = "buf74_2"} : memref<1024xi32>
  AIE.flow(%0, DMA : 0, %1, North : 0)
  AIE.flow(%0, DMA : 1, %1, North : 1)
  %15 = AIE.shimDMA(%0) {
    %28 = AIE.lock(%0, 0)
    %29 = AIE.lock(%0, 1)
    %30 = AIE.lock(%0, 2)
    %31 = AIE.lock(%0, 3)
    %32 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %33 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%28, Acquire, 1)
    AIE.dmaBd(<%4 : memref<1025xi32>, 0, 1025>, 0)
    AIE.useLock(%28, Release, 0)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%29, Acquire, 1)
    AIE.dmaBd(<%5 : memref<1025xi32>, 0, 1025>, 0)
    AIE.useLock(%29, Release, 0)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%30, Acquire, 1)
    AIE.dmaBd(<%6 : memref<1025xi32>, 0, 1025>, 0)
    AIE.useLock(%30, Release, 0)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%31, Acquire, 1)
    AIE.dmaBd(<%7 : memref<1025xi32>, 0, 1025>, 0)
    AIE.useLock(%31, Release, 0)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %16 = AIE.switchbox(%2) {
    %28 = AIE.amsel<0> (0)
    %29 = AIE.amsel<1> (0)
    %30 = AIE.amsel<2> (0)
    %31 = AIE.amsel<3> (0)
    %32 = AIE.masterset(DMA : 0, %28)
    %33 = AIE.masterset(North : 0, %29)
    %34 = AIE.masterset(DMA : 1, %30)
    %35 = AIE.masterset(North : 1, %31)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %28)
      AIE.rule(31, 1, %29)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %30)
      AIE.rule(31, 3, %31)
    }
  }
  %17 = AIE.switchbox(%3) {
    %28 = AIE.amsel<0> (0)
    %29 = AIE.amsel<1> (0)
    %30 = AIE.masterset(DMA : 0, %28)
    %31 = AIE.masterset(DMA : 1, %29)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %28)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %29)
    }
  }
  %18 = AIE.lock(%2, 0)
  %19 = AIE.lock(%2, 1)
  %20 = AIE.mem(%2) {
    %28 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %29 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%18, Acquire, 0)
    AIE.dmaBd(<%8 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%18, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%19, Acquire, 0)
    AIE.dmaBd(<%9 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%19, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %21 = AIE.lock(%3, 0)
  %22 = AIE.lock(%3, 1)
  %23 = AIE.mem(%3) {
    %28 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %29 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%21, Acquire, 0)
    AIE.dmaBd(<%12 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%21, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%22, Acquire, 0)
    AIE.dmaBd(<%13 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%22, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %24 = AIE.lock(%2, 2)
  %25 = AIE.core(%2) {
    AIE.useLock(%18, Acquire, 1)
    AIE.useLock(%19, Acquire, 1)
    AIE.useLock(%24, Acquire, 0)
    call @extern_kernel(%8, %9, %10, %11) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%24, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %26 = AIE.lock(%3, 2)
  %27 = AIE.core(%3) {
    AIE.useLock(%24, Acquire, 1)
    AIE.useLock(%21, Acquire, 1)
    AIE.useLock(%22, Acquire, 1)
    AIE.useLock(%26, Acquire, 0)
    call @extern_kernel(%12, %13, %11, %14) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%26, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
}

