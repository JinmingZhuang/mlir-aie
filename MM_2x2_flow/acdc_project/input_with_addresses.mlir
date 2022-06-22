module @test_single_kernel {
  %0 = AIE.tile(6, 2)
  %1 = AIE.switchbox(%0) {
    %53 = AIE.amsel<0> (0)
    %54 = AIE.masterset(North : 0, %53)
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %53)
    }
  }
  %2 = AIE.tile(6, 3)
  %3 = AIE.switchbox(%2) {
    %53 = AIE.amsel<0> (0)
    %54 = AIE.amsel<0> (1)
    %55 = AIE.amsel<0> (2)
    %56 = AIE.masterset(DMA : 0, %55)
    %57 = AIE.masterset(DMA : 1, %54)
    %58 = AIE.masterset(North : 0, %53)
    AIE.packetrules(South : 0) {
      AIE.rule(29, 1, %53)
      AIE.rule(31, 2, %54)
      AIE.rule(31, 0, %55)
    }
  }
  %4 = AIE.tile(6, 4)
  %5 = AIE.switchbox(%4) {
    %53 = AIE.amsel<0> (0)
    %54 = AIE.amsel<0> (1)
    %55 = AIE.masterset(DMA : 0, %54)
    %56 = AIE.masterset(DMA : 1, %53)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %53)
      AIE.rule(31, 1, %54)
    }
  }
  %6 = AIE.tile(7, 0)
  %7 = AIE.switchbox(%6) {
  }
  %8 = AIE.tile(7, 2)
  %9 = AIE.switchbox(%8) {
    %53 = AIE.amsel<0> (0)
    %54 = AIE.masterset(West : 0, %53)
    %55 = AIE.masterset(North : 0, %53)
    AIE.packetrules(DMA : 1) {
      AIE.rule(30, 2, %53)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(30, 0, %53)
    }
  }
  %10 = AIE.tile(7, 3)
  %11 = AIE.switchbox(%10) {
    %53 = AIE.amsel<0> (0)
    %54 = AIE.amsel<0> (1)
    %55 = AIE.amsel<0> (2)
    %56 = AIE.masterset(DMA : 0, %54)
    %57 = AIE.masterset(DMA : 1, %55)
    %58 = AIE.masterset(North : 0, %53)
    AIE.packetrules(South : 0) {
      AIE.rule(29, 1, %53)
      AIE.rule(31, 2, %55)
      AIE.rule(31, 0, %54)
    }
  }
  %12 = AIE.tile(7, 4)
  %13 = AIE.switchbox(%12) {
    %53 = AIE.amsel<0> (0)
    %54 = AIE.amsel<0> (1)
    %55 = AIE.masterset(DMA : 0, %54)
    %56 = AIE.masterset(DMA : 1, %53)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %53)
      AIE.rule(31, 1, %54)
    }
  }
  %14 = AIE.buffer(%8) {address = 4096 : i32, sym_name = "buf72_0"} : memref<1024xi32>
  %15 = AIE.buffer(%8) {address = 8192 : i32, sym_name = "buf72_1"} : memref<1024xi32>
  %16 = AIE.buffer(%8) {address = 12288 : i32, sym_name = "buf72_2"} : memref<1024xi32>
  %17 = AIE.buffer(%8) {address = 16384 : i32, sym_name = "buf72_3"} : memref<1024xi32>
  %18 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf63_0"} : memref<1024xi32>
  %19 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "buf63_1"} : memref<1024xi32>
  %20 = AIE.buffer(%2) {address = 12288 : i32, sym_name = "buf63_2"} : memref<1024xi32>
  %21 = AIE.buffer(%2) {address = 16384 : i32, sym_name = "buf63_3"} : memref<1024xi32>
  %22 = AIE.buffer(%4) {address = 4096 : i32, sym_name = "buf64_0"} : memref<1024xi32>
  %23 = AIE.buffer(%4) {address = 8192 : i32, sym_name = "buf64_1"} : memref<1024xi32>
  %24 = AIE.buffer(%4) {address = 12288 : i32, sym_name = "buf64_2"} : memref<1024xi32>
  %25 = AIE.buffer(%10) {address = 4096 : i32, sym_name = "buf73_0"} : memref<1024xi32>
  %26 = AIE.buffer(%10) {address = 8192 : i32, sym_name = "buf73_1"} : memref<1024xi32>
  %27 = AIE.buffer(%10) {address = 12288 : i32, sym_name = "buf73_2"} : memref<1024xi32>
  %28 = AIE.buffer(%10) {address = 16384 : i32, sym_name = "buf73_3"} : memref<1024xi32>
  %29 = AIE.buffer(%12) {address = 4096 : i32, sym_name = "buf74_0"} : memref<1024xi32>
  %30 = AIE.buffer(%12) {address = 8192 : i32, sym_name = "buf74_1"} : memref<1024xi32>
  %31 = AIE.buffer(%12) {address = 12288 : i32, sym_name = "buf74_2"} : memref<1024xi32>
  %32 = AIE.mem(%8) {
    %53 = AIE.lock(%8, 4)
    %54 = AIE.lock(%8, 5)
    %55 = AIE.lock(%8, 6)
    %56 = AIE.lock(%8, 7)
    %57 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %58 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%53, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%14 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%53, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%54, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%15 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%54, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%55, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%16 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%55, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%56, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%17 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%56, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  %33 = AIE.lock(%2, 0)
  %34 = AIE.lock(%2, 1)
  %35 = AIE.mem(%2) {
    %53 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %54 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%33, Acquire, 0)
    AIE.dmaBd(<%18 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%34, Acquire, 0)
    AIE.dmaBd(<%19 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%34, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %36 = AIE.lock(%4, 0)
  %37 = AIE.lock(%4, 1)
  %38 = AIE.mem(%4) {
    %53 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %54 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%36, Acquire, 0)
    AIE.dmaBd(<%22 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%36, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%37, Acquire, 0)
    AIE.dmaBd(<%23 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%37, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %39 = AIE.lock(%2, 3)
  %40 = AIE.core(%2) {
    AIE.useLock(%33, Acquire, 1)
    AIE.useLock(%34, Acquire, 1)
    AIE.useLock(%39, Acquire, 0)
    call @extern_kernel(%18, %19, %20, %21) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%39, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %41 = AIE.lock(%4, 2)
  %42 = AIE.core(%4) {
    AIE.useLock(%39, Acquire, 1)
    AIE.useLock(%36, Acquire, 1)
    AIE.useLock(%37, Acquire, 1)
    AIE.useLock(%41, Acquire, 0)
    call @extern_kernel(%22, %23, %21, %24) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%41, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %43 = AIE.lock(%10, 0)
  %44 = AIE.lock(%10, 1)
  %45 = AIE.mem(%10) {
    %53 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %54 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%43, Acquire, 0)
    AIE.dmaBd(<%25 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%44, Acquire, 0)
    AIE.dmaBd(<%26 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %46 = AIE.lock(%12, 0)
  %47 = AIE.lock(%12, 1)
  %48 = AIE.mem(%12) {
    %53 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %54 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%46, Acquire, 0)
    AIE.dmaBd(<%29 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%47, Acquire, 0)
    AIE.dmaBd(<%30 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %49 = AIE.lock(%10, 2)
  %50 = AIE.core(%10) {
    AIE.useLock(%43, Acquire, 1)
    AIE.useLock(%44, Acquire, 1)
    AIE.useLock(%49, Acquire, 0)
    call @extern_kernel(%25, %26, %27, %28) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%49, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %51 = AIE.lock(%12, 2)
  %52 = AIE.core(%12) {
    AIE.useLock(%49, Acquire, 1)
    AIE.useLock(%46, Acquire, 1)
    AIE.useLock(%47, Acquire, 1)
    AIE.useLock(%51, Acquire, 0)
    call @extern_kernel(%29, %30, %28, %31) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%51, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
}

