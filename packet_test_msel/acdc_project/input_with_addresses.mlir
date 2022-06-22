module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.tile(7, 2)
  %2 = AIE.tile(7, 3)
  %3 = AIE.tile(7, 4)
  %4 = AIE.external_buffer 2203318239232 : memref<256xi32>
  %5 = AIE.buffer(%1) {address = 4096 : i32, sym_name = "buf72_0"} : memref<256xi32>
  %6 = AIE.buffer(%3) {address = 4096 : i32, sym_name = "buf74_0"} : memref<256xi32>
  AIE.flow(%0, DMA : 0, %1, DMA : 0)
  AIE.flow(%1, DMA : 0, %2, North : 3)
  %7 = AIE.switchbox(%3) {
    %13 = AIE.amsel<1> (0)
    %14 = AIE.masterset(DMA : 0, %13)
    AIE.packetrules(South : 3) {
      AIE.rule(31, 13, %13)
    }
  }
  %8 = AIE.shimDMA(%0) {
    %13 = AIE.lock(%0, 1)
    %14 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%13, Acquire, 1)
    AIE.dmaBd(<%4 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%13, Release, 0)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  %9 = AIE.lock(%1, 1)
  %10 = AIE.mem(%1) {
    %13 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %14 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%9, Acquire, 0)
    AIE.dmaBd(<%5 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%9, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(1, 13)
    AIE.dmaBd(<%5 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%9, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %11 = AIE.lock(%3, 1)
  %12 = AIE.mem(%3) {
    %13 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%11, Acquire, 0)
    AIE.dmaBdPacket(1, 13)
    AIE.dmaBd(<%6 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%11, Release, 1)
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    AIE.end
  }
}

