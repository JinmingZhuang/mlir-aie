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
  ^bb1(%19: index):  // 2 preds: ^bb0, ^bb8
    %20 = arith.cmpi slt, %19, %c4 : index
    cf.cond_br %20, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    AIE.useLock(%8, Acquire, 1)
    AIE.useLock(%10, Acquire, 0)
    cf.br ^bb3(%c0_0, %c0_i32 : index, i32)
  ^bb3(%21: index, %22: i32):  // 2 preds: ^bb2, ^bb4
    %23 = arith.cmpi slt, %21, %c64 : index
    cf.cond_br %23, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %24 = memref.load %4[%21] : memref<64xi32>
    %25 = arith.addi %24, %c1_i32 : i32
    memref.store %25, %6[%21] : memref<64xi32>
    %26 = arith.addi %21, %c1_1 : index
    cf.br ^bb3(%26, %24 : index, i32)
  ^bb5:  // pred: ^bb3
    AIE.useLock(%8, Release, 0)
    AIE.useLock(%10, Release, 1)
    AIE.useLock(%9, Acquire, 1)
    AIE.useLock(%11, Acquire, 0)
    cf.br ^bb6(%c0_0, %c0_i32 : index, i32)
  ^bb6(%27: index, %28: i32):  // 2 preds: ^bb5, ^bb7
    %29 = arith.cmpi slt, %27, %c64 : index
    cf.cond_br %29, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %30 = memref.load %5[%27] : memref<64xi32>
    %31 = arith.addi %30, %c1_i32 : i32
    memref.store %31, %7[%27] : memref<64xi32>
    %32 = arith.addi %27, %c1_1 : index
    cf.br ^bb6(%32, %30 : index, i32)
  ^bb8:  // pred: ^bb6
    AIE.useLock(%9, Release, 0)
    AIE.useLock(%11, Release, 1)
    %33 = arith.addi %19, %c1 : index
    cf.br ^bb1(%33 : index)
  ^bb9:  // pred: ^bb1
    AIE.end
  }
  %13 = AIE.mem(%0) {
    %19 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %20 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
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
  AIE.flow(%2, South : 3, %0, DMA : 0)
  AIE.flow(%0, DMA : 1, %2, South : 2)
  %16 = AIE.switchbox(%3) {
    AIE.connect<South : 3, North : 3>
    AIE.connect<North : 2, South : 2>
  }
  %17 = AIE.shimmux(%3) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<North : 2, DMA : 0>
  }
  %18 = AIE.shimDMA(%3) {
    %19 = AIE.lock(%3, 1)
    %20 = AIE.lock(%3, 2)
    %21 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %22 = AIE.dmaStart(S2MM0, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%19, Acquire, 1)
    AIE.dmaBd(<%14 : memref<512xi32>, 0, 512>, 0)
    AIE.useLock(%19, Release, 0)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%20, Acquire, 1)
    AIE.dmaBd(<%15 : memref<512xi32>, 0, 512>, 0)
    AIE.useLock(%20, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
}

