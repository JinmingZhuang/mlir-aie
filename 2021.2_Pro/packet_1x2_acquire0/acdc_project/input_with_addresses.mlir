module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.tile(7, 1)
  %2 = AIE.tile(7, 2)
  %3 = AIE.tile(7, 3)
  %4 = AIE.tile(7, 4)
  %5 = AIE.external_buffer 2203318239232 : memref<257xi32>
  %6 = AIE.external_buffer 2203318243328 : memref<257xi32>
  %7 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf72_0"} : memref<256xi32>
  %8 = AIE.buffer(%4) {address = 4096 : i32, sym_name = "buf74_0"} : memref<256xi32>
  AIE.flow(%0, DMA : 0, %1, North : 3)
  %9 = AIE.switchbox(%2) {
    %17 = AIE.amsel<1> (0)
    %18 = AIE.amsel<2> (0)
    %19 = AIE.masterset(DMA : 0, %17)
    %20 = AIE.masterset(North : 3, %18)
    AIE.packetrules(South : 3) {
      AIE.rule(31, 12, %17)
      AIE.rule(31, 13, %18)
    }
  }
  %10 = AIE.switchbox(%3) {
    AIE.connect<South : 3, North : 3>
  }
  %11 = AIE.switchbox(%4) {
    AIE.connect<South : 3, DMA : 0>
  }
  %12 = AIE.shimDMA(%0) {
    %17 = AIE.lock(%0, 1)
    %18 = AIE.lock(%0, 2)
    %19 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%17, Acquire, 1)
    AIE.dmaBd(<%5 : memref<257xi32>, 0, 257>, 0)
    AIE.useLock(%17, Release, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%18, Acquire, 1)
    AIE.dmaBd(<%6 : memref<257xi32>, 0, 257>, 0)
    AIE.useLock(%18, Release, 0)
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb0, ^bb2
    AIE.end
  }
  %13 = AIE.lock(%2, 1)
  %14 = AIE.mem(%2) {
    %17 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%13, Acquire, 0)
    AIE.dmaBdPacket(4, 12)
    AIE.dmaBd(<%7 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%13, Release, 1)
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    AIE.end
  }
  %15 = AIE.lock(%4, 1)
  %16 = AIE.mem(%4) {
    %17 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%15, Acquire, 0)
    AIE.dmaBdPacket(5, 13)
    AIE.dmaBd(<%8 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%15, Release, 1)
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    AIE.end
  }
}

