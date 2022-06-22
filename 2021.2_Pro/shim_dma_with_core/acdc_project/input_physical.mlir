module @test_chess_04_deprecated_shim_dma_precompiled_kernel {
  %0 = AIE.tile(7, 3)
  %1 = AIE.tile(7, 2)
  %2 = AIE.tile(7, 1)
  %3 = AIE.tile(7, 0)
  %4 = AIE.buffer(%0) {address = 4096 : i32, sym_name = "a_ping"} : memref<64xi32>
  %5 = AIE.buffer(%0) {address = 4352 : i32, sym_name = "a_pong"} : memref<64xi32>
  %6 = AIE.buffer(%0) {address = 4608 : i32, sym_name = "b_ping"} : memref<64xi32>
  %7 = AIE.buffer(%0) {address = 4864 : i32, sym_name = "b_pong"} : memref<64xi32>
  %8 = AIE.lock(%0, 3)
  %9 = AIE.lock(%0, 4)
  %10 = AIE.lock(%0, 5)
  %11 = AIE.lock(%0, 6)
  %12 = AIE.core(%0) {
    %c256_i32 = arith.constant 256 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c0_0 = arith.constant 0 : index
    %c1_1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    cf.br ^bb1(%c0 : index)
  ^bb1(%89: index):  // 2 preds: ^bb0, ^bb8
    %90 = arith.cmpi slt, %89, %c4 : index
    cf.cond_br %90, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    AIE.useLock(%8, Acquire, 1)
    AIE.useLock(%10, Acquire, 0)
    cf.br ^bb3(%c0_0, %c0_i32 : index, i32)
  ^bb3(%91: index, %92: i32):  // 2 preds: ^bb2, ^bb4
    %93 = arith.cmpi slt, %91, %c64 : index
    cf.cond_br %93, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %94 = memref.load %4[%91] : memref<64xi32>
    %95 = arith.addi %94, %c1_i32 : i32
    memref.store %95, %6[%91] : memref<64xi32>
    %96 = arith.addi %91, %c1_1 : index
    cf.br ^bb3(%96, %94 : index, i32)
  ^bb5:  // pred: ^bb3
    AIE.useLock(%8, Release, 0)
    AIE.useLock(%10, Release, 1)
    AIE.useLock(%9, Acquire, 1)
    AIE.useLock(%11, Acquire, 0)
    cf.br ^bb6(%c0_0, %c0_i32 : index, i32)
  ^bb6(%97: index, %98: i32):  // 2 preds: ^bb5, ^bb7
    %99 = arith.cmpi slt, %97, %c64 : index
    cf.cond_br %99, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %100 = memref.load %5[%97] : memref<64xi32>
    %101 = arith.addi %100, %c1_i32 : i32
    memref.store %101, %7[%97] : memref<64xi32>
    %102 = arith.addi %97, %c1_1 : index
    cf.br ^bb6(%102, %100 : index, i32)
  ^bb8:  // pred: ^bb6
    AIE.useLock(%9, Release, 0)
    AIE.useLock(%11, Release, 1)
    %103 = arith.addi %89, %c1 : index
    cf.br ^bb1(%103 : index)
  ^bb9:  // pred: ^bb1
    AIE.end
  }
  %13 = AIE.mem(%0) {
    %89 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %90 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%8, Acquire, 0)
    AIE.dmaBd(<%4 : memref<64xi32>, 0, 64>, 0)
    AIE.useLock(%8, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%9, Acquire, 0)
    AIE.dmaBd(<%5 : memref<64xi32>, 0, 64>, 0)
    AIE.useLock(%9, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%10, Acquire, 1)
    AIE.dmaBd(<%6 : memref<64xi32>, 0, 64>, 0)
    AIE.useLock(%10, Release, 0)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%11, Acquire, 1)
    AIE.dmaBd(<%7 : memref<64xi32>, 0, 64>, 0)
    AIE.useLock(%11, Release, 0)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  %14 = AIE.external_buffer 2203318239232 : memref<512xi32>
  %15 = AIE.external_buffer 2203318247424 : memref<512xi32>
  %16 = AIE.switchbox(%3) {
    AIE.connect<South : 3, North : 3>
    AIE.connect<North : 2, South : 2>
  }
  %17 = AIE.shimmux(%3) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<North : 2, DMA : 0>
  }
  %18 = AIE.shimDMA(%3) {
    %89 = AIE.lock(%3, 1)
    %90 = AIE.lock(%3, 2)
    %91 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %92 = AIE.dmaStart(S2MM0, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%89, Acquire, 1)
    AIE.dmaBd(<%14 : memref<512xi32>, 0, 512>, 0)
    AIE.useLock(%89, Release, 0)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%90, Acquire, 1)
    AIE.dmaBd(<%15 : memref<512xi32>, 0, 512>, 0)
    AIE.useLock(%90, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %19 = AIE.tile(0, 0)
  %20 = AIE.tile(0, 1)
  %21 = AIE.tile(0, 2)
  %22 = AIE.tile(0, 3)
  %23 = AIE.tile(1, 0)
  %24 = AIE.tile(1, 1)
  %25 = AIE.tile(1, 2)
  %26 = AIE.tile(1, 3)
  %27 = AIE.tile(2, 0)
  %28 = AIE.tile(2, 1)
  %29 = AIE.tile(2, 2)
  %30 = AIE.tile(2, 3)
  %31 = AIE.tile(3, 0)
  %32 = AIE.tile(3, 1)
  %33 = AIE.tile(3, 2)
  %34 = AIE.tile(3, 3)
  %35 = AIE.tile(4, 0)
  %36 = AIE.tile(4, 1)
  %37 = AIE.tile(4, 2)
  %38 = AIE.tile(4, 3)
  %39 = AIE.tile(5, 0)
  %40 = AIE.tile(5, 1)
  %41 = AIE.tile(5, 2)
  %42 = AIE.tile(5, 3)
  %43 = AIE.tile(6, 0)
  %44 = AIE.tile(6, 1)
  %45 = AIE.tile(6, 2)
  %46 = AIE.tile(6, 3)
  %47 = AIE.switchbox(%19) {
  }
  %48 = AIE.switchbox(%20) {
  }
  %49 = AIE.switchbox(%21) {
  }
  %50 = AIE.switchbox(%22) {
  }
  %51 = AIE.switchbox(%23) {
  }
  %52 = AIE.switchbox(%24) {
  }
  %53 = AIE.switchbox(%25) {
  }
  %54 = AIE.switchbox(%26) {
  }
  %55 = AIE.switchbox(%27) {
  }
  %56 = AIE.switchbox(%28) {
  }
  %57 = AIE.switchbox(%29) {
  }
  %58 = AIE.switchbox(%30) {
  }
  %59 = AIE.switchbox(%31) {
  }
  %60 = AIE.switchbox(%32) {
  }
  %61 = AIE.switchbox(%33) {
  }
  %62 = AIE.switchbox(%34) {
  }
  %63 = AIE.switchbox(%35) {
  }
  %64 = AIE.switchbox(%36) {
  }
  %65 = AIE.switchbox(%37) {
  }
  %66 = AIE.switchbox(%38) {
  }
  %67 = AIE.switchbox(%39) {
  }
  %68 = AIE.switchbox(%40) {
  }
  %69 = AIE.switchbox(%41) {
  }
  %70 = AIE.switchbox(%42) {
  }
  %71 = AIE.switchbox(%43) {
  }
  %72 = AIE.switchbox(%44) {
  }
  %73 = AIE.switchbox(%45) {
  }
  %74 = AIE.switchbox(%46) {
  }
  %75 = AIE.switchbox(%2) {
    AIE.connect<South : 3, North : 0>
    AIE.connect<North : 0, South : 2>
  }
  %76 = AIE.switchbox(%1) {
    AIE.connect<South : 0, North : 0>
    AIE.connect<North : 0, South : 0>
  }
  %77 = AIE.switchbox(%0) {
    AIE.connect<South : 0, DMA : 0>
    AIE.connect<DMA : 1, South : 0>
  }
  %78 = AIE.plio(0)
  %79 = AIE.plio(1)
  %80 = AIE.plio(2)
  %81 = AIE.plio(3)
  %82 = AIE.plio(4)
  %83 = AIE.plio(5)
  %84 = AIE.plio(6)
  %85 = AIE.plio(7)
  AIE.wire(%20 : Core, %48 : Core)
  AIE.wire(%20 : DMA, %48 : DMA)
  AIE.wire(%47 : North, %48 : South)
  AIE.wire(%21 : Core, %49 : Core)
  AIE.wire(%21 : DMA, %49 : DMA)
  AIE.wire(%48 : North, %49 : South)
  AIE.wire(%22 : Core, %50 : Core)
  AIE.wire(%22 : DMA, %50 : DMA)
  AIE.wire(%49 : North, %50 : South)
  AIE.wire(%47 : East, %51 : West)
  AIE.wire(%79 : North, %51 : South)
  AIE.wire(%48 : East, %52 : West)
  AIE.wire(%24 : Core, %52 : Core)
  AIE.wire(%24 : DMA, %52 : DMA)
  AIE.wire(%51 : North, %52 : South)
  AIE.wire(%49 : East, %53 : West)
  AIE.wire(%25 : Core, %53 : Core)
  AIE.wire(%25 : DMA, %53 : DMA)
  AIE.wire(%52 : North, %53 : South)
  AIE.wire(%50 : East, %54 : West)
  AIE.wire(%26 : Core, %54 : Core)
  AIE.wire(%26 : DMA, %54 : DMA)
  AIE.wire(%53 : North, %54 : South)
  AIE.wire(%51 : East, %55 : West)
  %86 = AIE.shimmux(%27) {
  }
  AIE.wire(%86 : North, %55 : South)
  AIE.wire(%80 : North, %86 : South)
  AIE.wire(%27 : DMA, %86 : DMA)
  AIE.wire(%52 : East, %56 : West)
  AIE.wire(%28 : Core, %56 : Core)
  AIE.wire(%28 : DMA, %56 : DMA)
  AIE.wire(%55 : North, %56 : South)
  AIE.wire(%53 : East, %57 : West)
  AIE.wire(%29 : Core, %57 : Core)
  AIE.wire(%29 : DMA, %57 : DMA)
  AIE.wire(%56 : North, %57 : South)
  AIE.wire(%54 : East, %58 : West)
  AIE.wire(%30 : Core, %58 : Core)
  AIE.wire(%30 : DMA, %58 : DMA)
  AIE.wire(%57 : North, %58 : South)
  AIE.wire(%55 : East, %59 : West)
  %87 = AIE.shimmux(%31) {
  }
  AIE.wire(%87 : North, %59 : South)
  AIE.wire(%81 : North, %87 : South)
  AIE.wire(%31 : DMA, %87 : DMA)
  AIE.wire(%56 : East, %60 : West)
  AIE.wire(%32 : Core, %60 : Core)
  AIE.wire(%32 : DMA, %60 : DMA)
  AIE.wire(%59 : North, %60 : South)
  AIE.wire(%57 : East, %61 : West)
  AIE.wire(%33 : Core, %61 : Core)
  AIE.wire(%33 : DMA, %61 : DMA)
  AIE.wire(%60 : North, %61 : South)
  AIE.wire(%58 : East, %62 : West)
  AIE.wire(%34 : Core, %62 : Core)
  AIE.wire(%34 : DMA, %62 : DMA)
  AIE.wire(%61 : North, %62 : South)
  AIE.wire(%59 : East, %63 : West)
  AIE.wire(%82 : North, %63 : South)
  AIE.wire(%60 : East, %64 : West)
  AIE.wire(%36 : Core, %64 : Core)
  AIE.wire(%36 : DMA, %64 : DMA)
  AIE.wire(%63 : North, %64 : South)
  AIE.wire(%61 : East, %65 : West)
  AIE.wire(%37 : Core, %65 : Core)
  AIE.wire(%37 : DMA, %65 : DMA)
  AIE.wire(%64 : North, %65 : South)
  AIE.wire(%62 : East, %66 : West)
  AIE.wire(%38 : Core, %66 : Core)
  AIE.wire(%38 : DMA, %66 : DMA)
  AIE.wire(%65 : North, %66 : South)
  AIE.wire(%63 : East, %67 : West)
  AIE.wire(%83 : North, %67 : South)
  AIE.wire(%64 : East, %68 : West)
  AIE.wire(%40 : Core, %68 : Core)
  AIE.wire(%40 : DMA, %68 : DMA)
  AIE.wire(%67 : North, %68 : South)
  AIE.wire(%65 : East, %69 : West)
  AIE.wire(%41 : Core, %69 : Core)
  AIE.wire(%41 : DMA, %69 : DMA)
  AIE.wire(%68 : North, %69 : South)
  AIE.wire(%66 : East, %70 : West)
  AIE.wire(%42 : Core, %70 : Core)
  AIE.wire(%42 : DMA, %70 : DMA)
  AIE.wire(%69 : North, %70 : South)
  AIE.wire(%67 : East, %71 : West)
  %88 = AIE.shimmux(%43) {
  }
  AIE.wire(%88 : North, %71 : South)
  AIE.wire(%84 : North, %88 : South)
  AIE.wire(%43 : DMA, %88 : DMA)
  AIE.wire(%68 : East, %72 : West)
  AIE.wire(%44 : Core, %72 : Core)
  AIE.wire(%44 : DMA, %72 : DMA)
  AIE.wire(%71 : North, %72 : South)
  AIE.wire(%69 : East, %73 : West)
  AIE.wire(%45 : Core, %73 : Core)
  AIE.wire(%45 : DMA, %73 : DMA)
  AIE.wire(%72 : North, %73 : South)
  AIE.wire(%70 : East, %74 : West)
  AIE.wire(%46 : Core, %74 : Core)
  AIE.wire(%46 : DMA, %74 : DMA)
  AIE.wire(%73 : North, %74 : South)
  AIE.wire(%71 : East, %16 : West)
  AIE.wire(%17 : North, %16 : South)
  AIE.wire(%85 : North, %17 : South)
  AIE.wire(%3 : DMA, %17 : DMA)
  AIE.wire(%72 : East, %75 : West)
  AIE.wire(%2 : Core, %75 : Core)
  AIE.wire(%2 : DMA, %75 : DMA)
  AIE.wire(%16 : North, %75 : South)
  AIE.wire(%73 : East, %76 : West)
  AIE.wire(%1 : Core, %76 : Core)
  AIE.wire(%1 : DMA, %76 : DMA)
  AIE.wire(%75 : North, %76 : South)
  AIE.wire(%74 : East, %77 : West)
  AIE.wire(%0 : Core, %77 : Core)
  AIE.wire(%0 : DMA, %77 : DMA)
  AIE.wire(%76 : North, %77 : South)
}

