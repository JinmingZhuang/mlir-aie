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
  %9 = AIE.switchbox(%1) {
    AIE.connect<South : 3, North : 3>
  }
  %10 = AIE.switchbox(%0) {
    AIE.connect<South : 3, North : 3>
  }
  %11 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
  }
  %12 = AIE.switchbox(%2) {
    %20 = AIE.amsel<1> (0)
    %21 = AIE.amsel<1> (1)
    %22 = AIE.masterset(DMA : 0, %20)
    %23 = AIE.masterset(North : 3, %21)
    AIE.packetrules(South : 3) {
      AIE.rule(31, 12, %20)
      AIE.rule(31, 13, %21)
    }
  }
  %13 = AIE.switchbox(%3) {
    AIE.connect<South : 3, North : 3>
  }
  %14 = AIE.switchbox(%4) {
    %20 = AIE.amsel<1> (0)
    %21 = AIE.masterset(DMA : 0, %20)
    AIE.packetrules(South : 3) {
      AIE.rule(31, 13, %20)
    }
  }
  %15 = AIE.shimDMA(%0) {
    %20 = AIE.lock(%0, 1)
    %21 = AIE.lock(%0, 2)
    %22 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%20, Acquire, 1)
    AIE.dmaBd(<%5 : memref<257xi32>, 0, 257>, 0)
    AIE.useLock(%20, Release, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%21, Acquire, 1)
    AIE.dmaBd(<%6 : memref<257xi32>, 0, 257>, 0)
    AIE.useLock(%21, Release, 0)
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb0, ^bb2
    AIE.end
  }
  %16 = AIE.lock(%2, 1)
  %17 = AIE.mem(%2) {
    %20 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%16, Acquire, 0)
    AIE.dmaBd(<%7 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%16, Release, 1)
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    AIE.end
  }
  %18 = AIE.lock(%4, 1)
  %19 = AIE.mem(%4) {
    %20 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%18, Acquire, 0)
    AIE.dmaBd(<%8 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%18, Release, 1)
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    AIE.end
  }
}

