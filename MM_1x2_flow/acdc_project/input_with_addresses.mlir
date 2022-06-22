module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.switchbox(%0) {
  }
  %2 = AIE.tile(7, 2)
  %3 = AIE.switchbox(%2) {
    %30 = AIE.amsel<0> (0)
    %31 = AIE.masterset(North : 0, %30)
    AIE.packetrules(DMA : 1) {
      AIE.rule(30, 2, %30)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(30, 0, %30)
    }
  }
  %4 = AIE.tile(7, 3)
  %5 = AIE.switchbox(%4) {
    %30 = AIE.amsel<0> (0)
    %31 = AIE.amsel<0> (1)
    %32 = AIE.amsel<0> (2)
    %33 = AIE.masterset(DMA : 0, %32)
    %34 = AIE.masterset(DMA : 1, %31)
    %35 = AIE.masterset(North : 0, %30)
    AIE.packetrules(South : 0) {
      AIE.rule(29, 1, %30)
      AIE.rule(31, 2, %31)
      AIE.rule(31, 0, %32)
    }
  }
  %6 = AIE.tile(7, 4)
  %7 = AIE.switchbox(%6) {
    %30 = AIE.amsel<0> (0)
    %31 = AIE.amsel<0> (1)
    %32 = AIE.masterset(DMA : 0, %31)
    %33 = AIE.masterset(DMA : 1, %30)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %30)
      AIE.rule(31, 1, %31)
    }
  }
  %8 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf72_0"} : memref<1024xi32>
  %9 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "buf72_1"} : memref<1024xi32>
  %10 = AIE.buffer(%2) {address = 12288 : i32, sym_name = "buf72_2"} : memref<1024xi32>
  %11 = AIE.buffer(%2) {address = 16384 : i32, sym_name = "buf72_3"} : memref<1024xi32>
  %12 = AIE.buffer(%4) {address = 4096 : i32, sym_name = "buf73_0"} : memref<1024xi32>
  %13 = AIE.buffer(%4) {address = 8192 : i32, sym_name = "buf73_1"} : memref<1024xi32>
  %14 = AIE.buffer(%4) {address = 12288 : i32, sym_name = "buf73_2"} : memref<1024xi32>
  %15 = AIE.buffer(%4) {address = 16384 : i32, sym_name = "buf73_3"} : memref<1024xi32>
  %16 = AIE.buffer(%6) {address = 4096 : i32, sym_name = "buf74_0"} : memref<1024xi32>
  %17 = AIE.buffer(%6) {address = 8192 : i32, sym_name = "buf74_1"} : memref<1024xi32>
  %18 = AIE.buffer(%6) {address = 12288 : i32, sym_name = "buf74_2"} : memref<1024xi32>
  %19 = AIE.mem(%2) {
    %30 = AIE.lock(%2, 4)
    %31 = AIE.lock(%2, 5)
    %32 = AIE.lock(%2, 6)
    %33 = AIE.lock(%2, 7)
    %34 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %35 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%30, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%8 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%31, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%9 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%32, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%10 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%33, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%11 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %20 = AIE.lock(%4, 0)
  %21 = AIE.lock(%4, 1)
  %22 = AIE.mem(%4) {
    %30 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %31 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%20, Acquire, 0)
    AIE.dmaBd(<%12 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%20, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%21, Acquire, 0)
    AIE.dmaBd(<%13 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%21, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %23 = AIE.lock(%6, 0)
  %24 = AIE.lock(%6, 1)
  %25 = AIE.mem(%6) {
    %30 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %31 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%23, Acquire, 0)
    AIE.dmaBd(<%16 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%23, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%24, Acquire, 0)
    AIE.dmaBd(<%17 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%24, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %26 = AIE.lock(%4, 2)
  %27 = AIE.core(%4) {
    AIE.useLock(%20, Acquire, 1)
    AIE.useLock(%21, Acquire, 1)
    AIE.useLock(%26, Acquire, 0)
    call @extern_kernel(%12, %13, %14, %15) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%26, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %28 = AIE.lock(%6, 2)
  %29 = AIE.core(%6) {
    AIE.useLock(%26, Acquire, 1)
    AIE.useLock(%23, Acquire, 1)
    AIE.useLock(%24, Acquire, 1)
    AIE.useLock(%28, Acquire, 0)
    call @extern_kernel(%16, %17, %15, %18) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%28, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
}

