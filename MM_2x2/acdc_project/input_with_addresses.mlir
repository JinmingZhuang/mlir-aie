module @test_single_kernel {
  %0 = AIE.tile(6, 2)
  %1 = AIE.tile(6, 3)
  %2 = AIE.tile(6, 4)
  %3 = AIE.tile(7, 0)
  %4 = AIE.tile(7, 2)
  %5 = AIE.tile(7, 3)
  %6 = AIE.tile(7, 4)
  %7 = AIE.buffer(%4) {address = 4096 : i32, sym_name = "buf72_0"} : memref<1024xi32>
  %8 = AIE.buffer(%4) {address = 8192 : i32, sym_name = "buf72_1"} : memref<1024xi32>
  %9 = AIE.buffer(%4) {address = 12288 : i32, sym_name = "buf72_2"} : memref<1024xi32>
  %10 = AIE.buffer(%4) {address = 16384 : i32, sym_name = "buf72_3"} : memref<1024xi32>
  %11 = AIE.buffer(%1) {address = 4096 : i32, sym_name = "buf63_0"} : memref<1024xi32>
  %12 = AIE.buffer(%1) {address = 8192 : i32, sym_name = "buf63_1"} : memref<1024xi32>
  %13 = AIE.buffer(%1) {address = 12288 : i32, sym_name = "buf63_2"} : memref<1024xi32>
  %14 = AIE.buffer(%1) {address = 16384 : i32, sym_name = "buf63_3"} : memref<1024xi32>
  %15 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf64_0"} : memref<1024xi32>
  %16 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "buf64_1"} : memref<1024xi32>
  %17 = AIE.buffer(%2) {address = 12288 : i32, sym_name = "buf64_2"} : memref<1024xi32>
  %18 = AIE.buffer(%5) {address = 4096 : i32, sym_name = "buf73_0"} : memref<1024xi32>
  %19 = AIE.buffer(%5) {address = 8192 : i32, sym_name = "buf73_1"} : memref<1024xi32>
  %20 = AIE.buffer(%5) {address = 12288 : i32, sym_name = "buf73_2"} : memref<1024xi32>
  %21 = AIE.buffer(%5) {address = 16384 : i32, sym_name = "buf73_3"} : memref<1024xi32>
  %22 = AIE.buffer(%6) {address = 4096 : i32, sym_name = "buf74_0"} : memref<1024xi32>
  %23 = AIE.buffer(%6) {address = 8192 : i32, sym_name = "buf74_1"} : memref<1024xi32>
  %24 = AIE.buffer(%6) {address = 12288 : i32, sym_name = "buf74_2"} : memref<1024xi32>
  %25 = AIE.switchbox(%4) {
    AIE.connect<DMA : 0, North : 0>
    AIE.connect<DMA : 1, North : 1>
    AIE.connect<DMA : 0, West : 0>
    AIE.connect<DMA : 1, West : 1>
  }
  %26 = AIE.mem(%4) {
    %52 = AIE.lock(%4, 4)
    %53 = AIE.lock(%4, 5)
    %54 = AIE.lock(%4, 6)
    %55 = AIE.lock(%4, 7)
    %56 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %57 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%52, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%7 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%52, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%53, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%8 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%53, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%54, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%9 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%54, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%55, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%10 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%55, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  %27 = AIE.switchbox(%0) {
    AIE.connect<East : 0, North : 0>
    AIE.connect<East : 1, North : 1>
  }
  %28 = AIE.switchbox(%1) {
    %52 = AIE.amsel<0> (0)
    %53 = AIE.amsel<1> (0)
    %54 = AIE.amsel<2> (0)
    %55 = AIE.amsel<3> (0)
    %56 = AIE.masterset(DMA : 0, %52)
    %57 = AIE.masterset(North : 0, %53)
    %58 = AIE.masterset(DMA : 1, %54)
    %59 = AIE.masterset(North : 1, %55)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %52)
      AIE.rule(31, 1, %53)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %54)
      AIE.rule(31, 3, %55)
    }
  }
  %29 = AIE.switchbox(%2) {
    %52 = AIE.amsel<0> (0)
    %53 = AIE.amsel<1> (0)
    %54 = AIE.masterset(DMA : 0, %52)
    %55 = AIE.masterset(DMA : 1, %53)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %52)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %53)
    }
  }
  %30 = AIE.lock(%1, 0)
  %31 = AIE.lock(%1, 1)
  %32 = AIE.mem(%1) {
    %52 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %53 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%30, Acquire, 0)
    AIE.dmaBd(<%11 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%31, Acquire, 0)
    AIE.dmaBd(<%12 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %33 = AIE.lock(%2, 0)
  %34 = AIE.lock(%2, 1)
  %35 = AIE.mem(%2) {
    %52 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %53 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%33, Acquire, 0)
    AIE.dmaBd(<%15 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%34, Acquire, 0)
    AIE.dmaBd(<%16 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%34, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %36 = AIE.lock(%1, 3)
  %37 = AIE.core(%1) {
    AIE.useLock(%30, Acquire, 1)
    AIE.useLock(%31, Acquire, 1)
    AIE.useLock(%36, Acquire, 0)
    call @extern_kernel(%11, %12, %13, %14) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%36, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %38 = AIE.lock(%2, 2)
  %39 = AIE.core(%2) {
    AIE.useLock(%36, Acquire, 1)
    AIE.useLock(%33, Acquire, 1)
    AIE.useLock(%34, Acquire, 1)
    AIE.useLock(%38, Acquire, 0)
    call @extern_kernel(%15, %16, %14, %17) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%38, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %40 = AIE.switchbox(%5) {
    %52 = AIE.amsel<0> (0)
    %53 = AIE.amsel<1> (0)
    %54 = AIE.amsel<2> (0)
    %55 = AIE.amsel<3> (0)
    %56 = AIE.masterset(DMA : 0, %52)
    %57 = AIE.masterset(North : 0, %53)
    %58 = AIE.masterset(DMA : 1, %54)
    %59 = AIE.masterset(North : 1, %55)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %52)
      AIE.rule(31, 1, %53)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %54)
      AIE.rule(31, 3, %55)
    }
  }
  %41 = AIE.switchbox(%6) {
    %52 = AIE.amsel<0> (0)
    %53 = AIE.amsel<1> (0)
    %54 = AIE.masterset(DMA : 0, %52)
    %55 = AIE.masterset(DMA : 1, %53)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %52)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %53)
    }
  }
  %42 = AIE.lock(%5, 0)
  %43 = AIE.lock(%5, 1)
  %44 = AIE.mem(%5) {
    %52 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %53 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%42, Acquire, 0)
    AIE.dmaBd(<%18 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%42, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%43, Acquire, 0)
    AIE.dmaBd(<%19 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %45 = AIE.lock(%6, 0)
  %46 = AIE.lock(%6, 1)
  %47 = AIE.mem(%6) {
    %52 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %53 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%45, Acquire, 0)
    AIE.dmaBd(<%22 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%46, Acquire, 0)
    AIE.dmaBd(<%23 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %48 = AIE.lock(%5, 2)
  %49 = AIE.core(%5) {
    AIE.useLock(%42, Acquire, 1)
    AIE.useLock(%43, Acquire, 1)
    AIE.useLock(%48, Acquire, 0)
    call @extern_kernel(%18, %19, %20, %21) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%48, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %50 = AIE.lock(%6, 2)
  %51 = AIE.core(%6) {
    AIE.useLock(%48, Acquire, 1)
    AIE.useLock(%45, Acquire, 1)
    AIE.useLock(%46, Acquire, 1)
    AIE.useLock(%50, Acquire, 0)
    call @extern_kernel(%22, %23, %21, %24) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%50, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
}

