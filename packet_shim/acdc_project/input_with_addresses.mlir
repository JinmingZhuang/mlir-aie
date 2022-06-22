module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.tile(7, 1)
  %2 = AIE.tile(7, 2)
  %3 = AIE.tile(7, 3)
  %4 = AIE.tile(7, 4)
  %5 = AIE.external_buffer 2203318239232 : memref<257xi32>
  %6 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf72_0"} : memref<256xi32>
  %7 = AIE.buffer(%4) {address = 4096 : i32, sym_name = "buf74_0"} : memref<256xi32>
  %8 = AIE.switchbox(%1) {
    AIE.connect<South : 3, North : 3>
  }
  %9 = AIE.switchbox(%0) {
    AIE.connect<South : 3, North : 3>
  }
  %10 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
  }
  %11 = AIE.switchbox(%2) {
    AIE.connect<DMA : 0, North : 3>
    %19 = AIE.amsel<1> (0)
    %20 = AIE.masterset(DMA : 0, %19)
    AIE.packetrules(South : 3) {
      AIE.rule(31, 12, %19)
    }
  }
  %12 = AIE.switchbox(%3) {
    AIE.connect<South : 3, North : 3>
  }
  %13 = AIE.switchbox(%4) {
    %19 = AIE.amsel<1> (0)
    %20 = AIE.masterset(DMA : 0, %19)
    AIE.packetrules(South : 3) {
      AIE.rule(31, 13, %19)
    }
  }
  %14 = AIE.shimDMA(%0) {
    %19 = AIE.lock(%0, 1)
    %20 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%19, Acquire, 1)
    AIE.dmaBd(<%5 : memref<257xi32>, 0, 257>, 0)
    AIE.useLock(%19, Release, 0)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  %15 = AIE.lock(%2, 1)
  %16 = AIE.mem(%2) {
    %19 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %20 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%15, Acquire, 0)
    AIE.dmaBd(<%6 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%15, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%15, Acquire, 1)
    AIE.dmaBdPacket(1, 13)
    AIE.dmaBd(<%6 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%15, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %17 = AIE.lock(%4, 1)
  %18 = AIE.mem(%4) {
    %19 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%17, Acquire, 0)
    AIE.dmaBdPacket(1, 13)
    AIE.dmaBd(<%7 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%17, Release, 1)
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    AIE.end
  }
}

