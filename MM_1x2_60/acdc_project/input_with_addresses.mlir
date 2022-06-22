module @test_single_kernel {
  %0 = AIE.tile(6, 0)
  %1 = AIE.tile(6, 2)
  %2 = AIE.tile(6, 3)
  %3 = AIE.tile(6, 4)
  %4 = AIE.buffer(%1) {address = 4096 : i32, sym_name = "buf62_0"} : memref<1024xi32>
  %5 = AIE.buffer(%1) {address = 8192 : i32, sym_name = "buf62_1"} : memref<1024xi32>
  %6 = AIE.buffer(%1) {address = 12288 : i32, sym_name = "buf62_2"} : memref<1024xi32>
  %7 = AIE.buffer(%1) {address = 16384 : i32, sym_name = "buf62_3"} : memref<1024xi32>
  %8 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf63_0"} : memref<1024xi32>
  %9 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "buf63_1"} : memref<1024xi32>
  %10 = AIE.buffer(%2) {address = 12288 : i32, sym_name = "buf63_2"} : memref<1024xi32>
  %11 = AIE.buffer(%2) {address = 16384 : i32, sym_name = "buf63_3"} : memref<1024xi32>
  %12 = AIE.buffer(%3) {address = 4096 : i32, sym_name = "buf64_0"} : memref<1024xi32>
  %13 = AIE.buffer(%3) {address = 8192 : i32, sym_name = "buf64_1"} : memref<1024xi32>
  %14 = AIE.buffer(%3) {address = 12288 : i32, sym_name = "buf64_2"} : memref<1024xi32>
  %15 = AIE.switchbox(%1) {
    AIE.connect<DMA : 0, North : 0>
    AIE.connect<DMA : 1, North : 1>
  }
  %16 = AIE.mem(%1) {
    %29 = AIE.lock(%1, 4)
    %30 = AIE.lock(%1, 5)
    %31 = AIE.lock(%1, 6)
    %32 = AIE.lock(%1, 7)
    %33 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %34 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%29, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%4 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%30, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%5 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%31, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%6 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%32, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%7 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %17 = AIE.switchbox(%2) {
    %29 = AIE.amsel<0> (0)
    %30 = AIE.amsel<1> (0)
    %31 = AIE.amsel<2> (0)
    %32 = AIE.amsel<3> (0)
    %33 = AIE.masterset(DMA : 0, %29)
    %34 = AIE.masterset(North : 0, %30)
    %35 = AIE.masterset(DMA : 1, %31)
    %36 = AIE.masterset(North : 1, %32)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %29)
      AIE.rule(31, 1, %30)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %31)
      AIE.rule(31, 3, %32)
    }
  }
  %18 = AIE.switchbox(%3) {
    %29 = AIE.amsel<0> (0)
    %30 = AIE.amsel<1> (0)
    %31 = AIE.masterset(DMA : 0, %29)
    %32 = AIE.masterset(DMA : 1, %30)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %29)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %30)
    }
  }
  %19 = AIE.lock(%2, 0)
  %20 = AIE.lock(%2, 1)
  %21 = AIE.mem(%2) {
    %29 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %30 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%19, Acquire, 0)
    AIE.dmaBd(<%8 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%19, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%20, Acquire, 0)
    AIE.dmaBd(<%9 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%20, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %22 = AIE.lock(%3, 0)
  %23 = AIE.lock(%3, 1)
  %24 = AIE.mem(%3) {
    %29 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %30 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%22, Acquire, 0)
    AIE.dmaBd(<%12 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%22, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%23, Acquire, 0)
    AIE.dmaBd(<%13 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%23, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %25 = AIE.lock(%2, 2)
  %26 = AIE.core(%2) {
    AIE.useLock(%19, Acquire, 1)
    AIE.useLock(%20, Acquire, 1)
    AIE.useLock(%25, Acquire, 0)
    call @extern_kernel(%8, %9, %10, %11) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%25, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %27 = AIE.lock(%3, 2)
  %28 = AIE.core(%3) {
    AIE.useLock(%25, Acquire, 1)
    AIE.useLock(%22, Acquire, 1)
    AIE.useLock(%23, Acquire, 1)
    AIE.useLock(%27, Acquire, 0)
    call @extern_kernel(%12, %13, %11, %14) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%27, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
}

