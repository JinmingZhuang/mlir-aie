module @test_single_kernel {
  %0 = AIE.tile(6, 2)
  %1 = AIE.tile(5, 2)
  %2 = AIE.tile(5, 3)
  %3 = AIE.tile(5, 4)
  %4 = AIE.tile(7, 0)
  %5 = AIE.tile(7, 2)
  %6 = AIE.tile(7, 3)
  %7 = AIE.tile(7, 4)
  %8 = AIE.buffer(%5) {address = 4096 : i32, sym_name = "buf72_0"} : memref<1024xi32>
  %9 = AIE.buffer(%5) {address = 8192 : i32, sym_name = "buf72_1"} : memref<1024xi32>
  %10 = AIE.buffer(%5) {address = 12288 : i32, sym_name = "buf72_2"} : memref<1024xi32>
  %11 = AIE.buffer(%5) {address = 16384 : i32, sym_name = "buf72_3"} : memref<1024xi32>
  %12 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf53_0"} : memref<1024xi32>
  %13 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "buf53_1"} : memref<1024xi32>
  %14 = AIE.buffer(%2) {address = 12288 : i32, sym_name = "buf53_2"} : memref<1024xi32>
  %15 = AIE.buffer(%2) {address = 16384 : i32, sym_name = "buf53_3"} : memref<1024xi32>
  %16 = AIE.buffer(%3) {address = 4096 : i32, sym_name = "buf54_0"} : memref<1024xi32>
  %17 = AIE.buffer(%3) {address = 8192 : i32, sym_name = "buf54_1"} : memref<1024xi32>
  %18 = AIE.buffer(%3) {address = 12288 : i32, sym_name = "buf54_2"} : memref<1024xi32>
  %19 = AIE.buffer(%6) {address = 4096 : i32, sym_name = "buf73_0"} : memref<1024xi32>
  %20 = AIE.buffer(%6) {address = 8192 : i32, sym_name = "buf73_1"} : memref<1024xi32>
  %21 = AIE.buffer(%6) {address = 12288 : i32, sym_name = "buf73_2"} : memref<1024xi32>
  %22 = AIE.buffer(%6) {address = 16384 : i32, sym_name = "buf73_3"} : memref<1024xi32>
  %23 = AIE.buffer(%7) {address = 4096 : i32, sym_name = "buf74_0"} : memref<1024xi32>
  %24 = AIE.buffer(%7) {address = 8192 : i32, sym_name = "buf74_1"} : memref<1024xi32>
  %25 = AIE.buffer(%7) {address = 12288 : i32, sym_name = "buf74_2"} : memref<1024xi32>
  %26 = AIE.switchbox(%5) {
    AIE.connect<DMA : 0, North : 0>
    AIE.connect<DMA : 1, North : 1>
    AIE.connect<DMA : 0, West : 0>
    AIE.connect<DMA : 1, West : 1>
  }
  %27 = AIE.mem(%5) {
    %54 = AIE.lock(%5, 4)
    %55 = AIE.lock(%5, 5)
    %56 = AIE.lock(%5, 6)
    %57 = AIE.lock(%5, 7)
    %58 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %59 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%54, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%8 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%54, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%55, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%9 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%55, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%56, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%10 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%56, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%57, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%11 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%57, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  %28 = AIE.switchbox(%0) {
    AIE.connect<East : 0, West : 0>
    AIE.connect<East : 1, West : 1>
  }
  %29 = AIE.switchbox(%1) {
    AIE.connect<East : 0, North : 0>
    AIE.connect<East : 1, North : 1>
  }
  %30 = AIE.switchbox(%2) {
    %54 = AIE.amsel<0> (0)
    %55 = AIE.amsel<1> (0)
    %56 = AIE.amsel<2> (0)
    %57 = AIE.amsel<3> (0)
    %58 = AIE.masterset(DMA : 0, %54)
    %59 = AIE.masterset(North : 0, %55)
    %60 = AIE.masterset(DMA : 1, %56)
    %61 = AIE.masterset(North : 1, %57)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %54)
      AIE.rule(31, 1, %55)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %56)
      AIE.rule(31, 3, %57)
    }
  }
  %31 = AIE.switchbox(%3) {
    %54 = AIE.amsel<0> (0)
    %55 = AIE.amsel<1> (0)
    %56 = AIE.masterset(DMA : 0, %54)
    %57 = AIE.masterset(DMA : 1, %55)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %54)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %55)
    }
  }
  %32 = AIE.lock(%2, 0)
  %33 = AIE.lock(%2, 1)
  %34 = AIE.mem(%2) {
    %54 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %55 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%32, Acquire, 0)
    AIE.dmaBd(<%12 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%33, Acquire, 0)
    AIE.dmaBd(<%13 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %35 = AIE.lock(%3, 0)
  %36 = AIE.lock(%3, 1)
  %37 = AIE.mem(%3) {
    %54 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %55 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%35, Acquire, 0)
    AIE.dmaBd(<%16 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%35, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%36, Acquire, 0)
    AIE.dmaBd(<%17 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%36, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %38 = AIE.lock(%2, 2)
  %39 = AIE.core(%2) {
    AIE.useLock(%32, Acquire, 1)
    AIE.useLock(%33, Acquire, 1)
    AIE.useLock(%38, Acquire, 0)
    call @extern_kernel(%12, %13, %14, %15) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%38, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %40 = AIE.lock(%3, 2)
  %41 = AIE.core(%3) {
    AIE.useLock(%38, Acquire, 1)
    AIE.useLock(%35, Acquire, 1)
    AIE.useLock(%36, Acquire, 1)
    AIE.useLock(%40, Acquire, 0)
    call @extern_kernel(%16, %17, %15, %18) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%40, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %42 = AIE.switchbox(%6) {
    %54 = AIE.amsel<0> (0)
    %55 = AIE.amsel<1> (0)
    %56 = AIE.amsel<2> (0)
    %57 = AIE.amsel<3> (0)
    %58 = AIE.masterset(DMA : 0, %54)
    %59 = AIE.masterset(North : 0, %55)
    %60 = AIE.masterset(DMA : 1, %56)
    %61 = AIE.masterset(North : 1, %57)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %54)
      AIE.rule(31, 1, %55)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %56)
      AIE.rule(31, 3, %57)
    }
  }
  %43 = AIE.switchbox(%7) {
    %54 = AIE.amsel<0> (0)
    %55 = AIE.amsel<1> (0)
    %56 = AIE.masterset(DMA : 0, %54)
    %57 = AIE.masterset(DMA : 1, %55)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %54)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %55)
    }
  }
  %44 = AIE.lock(%6, 0)
  %45 = AIE.lock(%6, 1)
  %46 = AIE.mem(%6) {
    %54 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %55 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%44, Acquire, 0)
    AIE.dmaBd(<%19 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%45, Acquire, 0)
    AIE.dmaBd(<%20 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %47 = AIE.lock(%7, 0)
  %48 = AIE.lock(%7, 1)
  %49 = AIE.mem(%7) {
    %54 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %55 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%47, Acquire, 0)
    AIE.dmaBd(<%23 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%48, Acquire, 0)
    AIE.dmaBd(<%24 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %50 = AIE.lock(%6, 2)
  %51 = AIE.core(%6) {
    AIE.useLock(%44, Acquire, 1)
    AIE.useLock(%45, Acquire, 1)
    AIE.useLock(%50, Acquire, 0)
    call @extern_kernel(%19, %20, %21, %22) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%50, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %52 = AIE.lock(%7, 2)
  %53 = AIE.core(%7) {
    AIE.useLock(%50, Acquire, 1)
    AIE.useLock(%47, Acquire, 1)
    AIE.useLock(%48, Acquire, 1)
    AIE.useLock(%52, Acquire, 0)
    call @extern_kernel(%23, %24, %22, %25) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%52, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
}

