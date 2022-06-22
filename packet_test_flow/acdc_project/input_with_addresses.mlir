module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.switchbox(%0) {
  }
  %2 = AIE.tile(7, 2)
  %3 = AIE.switchbox(%2) {
    %16 = AIE.amsel<0> (0)
    %17 = AIE.masterset(North : 0, %16)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 13, %16)
    }
  }
  %4 = AIE.tile(7, 3)
  %5 = AIE.switchbox(%4) {
    %16 = AIE.amsel<0> (0)
    %17 = AIE.masterset(North : 0, %16)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 13, %16)
    }
  }
  %6 = AIE.tile(7, 4)
  %7 = AIE.switchbox(%6) {
    %16 = AIE.amsel<0> (0)
    %17 = AIE.masterset(DMA : 0, %16)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 13, %16)
    }
  }
  %8 = AIE.external_buffer 2203318239232 : memref<256xi32>
  %9 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf72_0"} : memref<256xi32>
  %10 = AIE.buffer(%6) {address = 4096 : i32, sym_name = "buf74_0"} : memref<256xi32>
  AIE.flow(%0, DMA : 0, %2, DMA : 0)
  %11 = AIE.shimDMA(%0) {
    %16 = AIE.lock(%0, 1)
    %17 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%16, Acquire, 1)
    AIE.dmaBd(<%8 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%16, Release, 0)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  %12 = AIE.lock(%2, 1)
  %13 = AIE.mem(%2) {
    %16 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %17 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%12, Acquire, 0)
    AIE.dmaBd(<%9 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%12, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%12, Acquire, 1)
    AIE.dmaBdPacket(1, 13)
    AIE.dmaBd(<%9 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%12, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %14 = AIE.lock(%6, 1)
  %15 = AIE.mem(%6) {
    %16 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%14, Acquire, 0)
    AIE.dmaBdPacket(1, 13)
    AIE.dmaBd(<%10 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%14, Release, 1)
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    AIE.end
  }
}

