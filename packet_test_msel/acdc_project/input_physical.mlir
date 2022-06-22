module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.tile(7, 2)
  %2 = AIE.tile(7, 3)
  %3 = AIE.tile(7, 4)
  %4 = AIE.external_buffer 2203318239232 : memref<256xi32>
  %5 = AIE.buffer(%1) {address = 4096 : i32, sym_name = "buf72_0"} : memref<256xi32>
  %6 = AIE.buffer(%3) {address = 4096 : i32, sym_name = "buf74_0"} : memref<256xi32>
  %7 = AIE.switchbox(%3) {
    %100 = AIE.amsel<1> (0)
    %101 = AIE.masterset(DMA : 0, %100)
    AIE.packetrules(South : 3) {
      AIE.rule(31, 13, %100)
    }
  }
  %8 = AIE.shimDMA(%0) {
    %100 = AIE.lock(%0, 1)
    %101 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%100, Acquire, 1)
    AIE.dmaBd(<%4 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%100, Release, 0)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  %9 = AIE.lock(%1, 1)
  %10 = AIE.mem(%1) {
    %100 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %101 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
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
    %100 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%11, Acquire, 0)
    AIE.dmaBdPacket(1, 13)
    AIE.dmaBd(<%6 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%11, Release, 1)
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    AIE.end
  }
  %13 = AIE.tile(0, 0)
  %14 = AIE.tile(0, 1)
  %15 = AIE.tile(0, 2)
  %16 = AIE.tile(0, 3)
  %17 = AIE.tile(0, 4)
  %18 = AIE.tile(1, 0)
  %19 = AIE.tile(1, 1)
  %20 = AIE.tile(1, 2)
  %21 = AIE.tile(1, 3)
  %22 = AIE.tile(1, 4)
  %23 = AIE.tile(2, 0)
  %24 = AIE.tile(2, 1)
  %25 = AIE.tile(2, 2)
  %26 = AIE.tile(2, 3)
  %27 = AIE.tile(2, 4)
  %28 = AIE.tile(3, 0)
  %29 = AIE.tile(3, 1)
  %30 = AIE.tile(3, 2)
  %31 = AIE.tile(3, 3)
  %32 = AIE.tile(3, 4)
  %33 = AIE.tile(4, 0)
  %34 = AIE.tile(4, 1)
  %35 = AIE.tile(4, 2)
  %36 = AIE.tile(4, 3)
  %37 = AIE.tile(4, 4)
  %38 = AIE.tile(5, 0)
  %39 = AIE.tile(5, 1)
  %40 = AIE.tile(5, 2)
  %41 = AIE.tile(5, 3)
  %42 = AIE.tile(5, 4)
  %43 = AIE.tile(6, 0)
  %44 = AIE.tile(6, 1)
  %45 = AIE.tile(6, 2)
  %46 = AIE.tile(6, 3)
  %47 = AIE.tile(6, 4)
  %48 = AIE.tile(7, 1)
  %49 = AIE.switchbox(%13) {
  }
  %50 = AIE.switchbox(%14) {
  }
  %51 = AIE.switchbox(%15) {
  }
  %52 = AIE.switchbox(%16) {
  }
  %53 = AIE.switchbox(%17) {
  }
  %54 = AIE.switchbox(%18) {
  }
  %55 = AIE.switchbox(%19) {
  }
  %56 = AIE.switchbox(%20) {
  }
  %57 = AIE.switchbox(%21) {
  }
  %58 = AIE.switchbox(%22) {
  }
  %59 = AIE.switchbox(%23) {
  }
  %60 = AIE.switchbox(%24) {
  }
  %61 = AIE.switchbox(%25) {
  }
  %62 = AIE.switchbox(%26) {
  }
  %63 = AIE.switchbox(%27) {
  }
  %64 = AIE.switchbox(%28) {
  }
  %65 = AIE.switchbox(%29) {
  }
  %66 = AIE.switchbox(%30) {
  }
  %67 = AIE.switchbox(%31) {
  }
  %68 = AIE.switchbox(%32) {
  }
  %69 = AIE.switchbox(%33) {
  }
  %70 = AIE.switchbox(%34) {
  }
  %71 = AIE.switchbox(%35) {
  }
  %72 = AIE.switchbox(%36) {
  }
  %73 = AIE.switchbox(%37) {
  }
  %74 = AIE.switchbox(%38) {
  }
  %75 = AIE.switchbox(%39) {
  }
  %76 = AIE.switchbox(%40) {
  }
  %77 = AIE.switchbox(%41) {
  }
  %78 = AIE.switchbox(%42) {
  }
  %79 = AIE.switchbox(%43) {
  }
  %80 = AIE.switchbox(%44) {
  }
  %81 = AIE.switchbox(%45) {
  }
  %82 = AIE.switchbox(%46) {
  }
  %83 = AIE.switchbox(%47) {
  }
  %84 = AIE.switchbox(%0) {
    AIE.connect<South : 3, North : 0>
  }
  %85 = AIE.switchbox(%48) {
    AIE.connect<South : 0, North : 0>
  }
  %86 = AIE.switchbox(%1) {
    AIE.connect<South : 0, DMA : 0>
    AIE.connect<DMA : 0, North : 0>
  }
  %87 = AIE.switchbox(%2) {
    AIE.connect<South : 0, North : 3>
  }
  %88 = AIE.plio(0)
  %89 = AIE.plio(1)
  %90 = AIE.plio(2)
  %91 = AIE.plio(3)
  %92 = AIE.plio(4)
  %93 = AIE.plio(5)
  %94 = AIE.plio(6)
  %95 = AIE.plio(7)
  AIE.wire(%14 : Core, %50 : Core)
  AIE.wire(%14 : DMA, %50 : DMA)
  AIE.wire(%49 : North, %50 : South)
  AIE.wire(%15 : Core, %51 : Core)
  AIE.wire(%15 : DMA, %51 : DMA)
  AIE.wire(%50 : North, %51 : South)
  AIE.wire(%16 : Core, %52 : Core)
  AIE.wire(%16 : DMA, %52 : DMA)
  AIE.wire(%51 : North, %52 : South)
  AIE.wire(%17 : Core, %53 : Core)
  AIE.wire(%17 : DMA, %53 : DMA)
  AIE.wire(%52 : North, %53 : South)
  AIE.wire(%49 : East, %54 : West)
  AIE.wire(%89 : North, %54 : South)
  AIE.wire(%50 : East, %55 : West)
  AIE.wire(%19 : Core, %55 : Core)
  AIE.wire(%19 : DMA, %55 : DMA)
  AIE.wire(%54 : North, %55 : South)
  AIE.wire(%51 : East, %56 : West)
  AIE.wire(%20 : Core, %56 : Core)
  AIE.wire(%20 : DMA, %56 : DMA)
  AIE.wire(%55 : North, %56 : South)
  AIE.wire(%52 : East, %57 : West)
  AIE.wire(%21 : Core, %57 : Core)
  AIE.wire(%21 : DMA, %57 : DMA)
  AIE.wire(%56 : North, %57 : South)
  AIE.wire(%53 : East, %58 : West)
  AIE.wire(%22 : Core, %58 : Core)
  AIE.wire(%22 : DMA, %58 : DMA)
  AIE.wire(%57 : North, %58 : South)
  AIE.wire(%54 : East, %59 : West)
  %96 = AIE.shimmux(%23) {
  }
  AIE.wire(%96 : North, %59 : South)
  AIE.wire(%90 : North, %96 : South)
  AIE.wire(%23 : DMA, %96 : DMA)
  AIE.wire(%55 : East, %60 : West)
  AIE.wire(%24 : Core, %60 : Core)
  AIE.wire(%24 : DMA, %60 : DMA)
  AIE.wire(%59 : North, %60 : South)
  AIE.wire(%56 : East, %61 : West)
  AIE.wire(%25 : Core, %61 : Core)
  AIE.wire(%25 : DMA, %61 : DMA)
  AIE.wire(%60 : North, %61 : South)
  AIE.wire(%57 : East, %62 : West)
  AIE.wire(%26 : Core, %62 : Core)
  AIE.wire(%26 : DMA, %62 : DMA)
  AIE.wire(%61 : North, %62 : South)
  AIE.wire(%58 : East, %63 : West)
  AIE.wire(%27 : Core, %63 : Core)
  AIE.wire(%27 : DMA, %63 : DMA)
  AIE.wire(%62 : North, %63 : South)
  AIE.wire(%59 : East, %64 : West)
  %97 = AIE.shimmux(%28) {
  }
  AIE.wire(%97 : North, %64 : South)
  AIE.wire(%91 : North, %97 : South)
  AIE.wire(%28 : DMA, %97 : DMA)
  AIE.wire(%60 : East, %65 : West)
  AIE.wire(%29 : Core, %65 : Core)
  AIE.wire(%29 : DMA, %65 : DMA)
  AIE.wire(%64 : North, %65 : South)
  AIE.wire(%61 : East, %66 : West)
  AIE.wire(%30 : Core, %66 : Core)
  AIE.wire(%30 : DMA, %66 : DMA)
  AIE.wire(%65 : North, %66 : South)
  AIE.wire(%62 : East, %67 : West)
  AIE.wire(%31 : Core, %67 : Core)
  AIE.wire(%31 : DMA, %67 : DMA)
  AIE.wire(%66 : North, %67 : South)
  AIE.wire(%63 : East, %68 : West)
  AIE.wire(%32 : Core, %68 : Core)
  AIE.wire(%32 : DMA, %68 : DMA)
  AIE.wire(%67 : North, %68 : South)
  AIE.wire(%64 : East, %69 : West)
  AIE.wire(%92 : North, %69 : South)
  AIE.wire(%65 : East, %70 : West)
  AIE.wire(%34 : Core, %70 : Core)
  AIE.wire(%34 : DMA, %70 : DMA)
  AIE.wire(%69 : North, %70 : South)
  AIE.wire(%66 : East, %71 : West)
  AIE.wire(%35 : Core, %71 : Core)
  AIE.wire(%35 : DMA, %71 : DMA)
  AIE.wire(%70 : North, %71 : South)
  AIE.wire(%67 : East, %72 : West)
  AIE.wire(%36 : Core, %72 : Core)
  AIE.wire(%36 : DMA, %72 : DMA)
  AIE.wire(%71 : North, %72 : South)
  AIE.wire(%68 : East, %73 : West)
  AIE.wire(%37 : Core, %73 : Core)
  AIE.wire(%37 : DMA, %73 : DMA)
  AIE.wire(%72 : North, %73 : South)
  AIE.wire(%69 : East, %74 : West)
  AIE.wire(%93 : North, %74 : South)
  AIE.wire(%70 : East, %75 : West)
  AIE.wire(%39 : Core, %75 : Core)
  AIE.wire(%39 : DMA, %75 : DMA)
  AIE.wire(%74 : North, %75 : South)
  AIE.wire(%71 : East, %76 : West)
  AIE.wire(%40 : Core, %76 : Core)
  AIE.wire(%40 : DMA, %76 : DMA)
  AIE.wire(%75 : North, %76 : South)
  AIE.wire(%72 : East, %77 : West)
  AIE.wire(%41 : Core, %77 : Core)
  AIE.wire(%41 : DMA, %77 : DMA)
  AIE.wire(%76 : North, %77 : South)
  AIE.wire(%73 : East, %78 : West)
  AIE.wire(%42 : Core, %78 : Core)
  AIE.wire(%42 : DMA, %78 : DMA)
  AIE.wire(%77 : North, %78 : South)
  AIE.wire(%74 : East, %79 : West)
  %98 = AIE.shimmux(%43) {
  }
  AIE.wire(%98 : North, %79 : South)
  AIE.wire(%94 : North, %98 : South)
  AIE.wire(%43 : DMA, %98 : DMA)
  AIE.wire(%75 : East, %80 : West)
  AIE.wire(%44 : Core, %80 : Core)
  AIE.wire(%44 : DMA, %80 : DMA)
  AIE.wire(%79 : North, %80 : South)
  AIE.wire(%76 : East, %81 : West)
  AIE.wire(%45 : Core, %81 : Core)
  AIE.wire(%45 : DMA, %81 : DMA)
  AIE.wire(%80 : North, %81 : South)
  AIE.wire(%77 : East, %82 : West)
  AIE.wire(%46 : Core, %82 : Core)
  AIE.wire(%46 : DMA, %82 : DMA)
  AIE.wire(%81 : North, %82 : South)
  AIE.wire(%78 : East, %83 : West)
  AIE.wire(%47 : Core, %83 : Core)
  AIE.wire(%47 : DMA, %83 : DMA)
  AIE.wire(%82 : North, %83 : South)
  AIE.wire(%79 : East, %84 : West)
  %99 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
  }
  AIE.wire(%99 : North, %84 : South)
  AIE.wire(%95 : North, %99 : South)
  AIE.wire(%0 : DMA, %99 : DMA)
  AIE.wire(%80 : East, %85 : West)
  AIE.wire(%48 : Core, %85 : Core)
  AIE.wire(%48 : DMA, %85 : DMA)
  AIE.wire(%84 : North, %85 : South)
  AIE.wire(%81 : East, %86 : West)
  AIE.wire(%1 : Core, %86 : Core)
  AIE.wire(%1 : DMA, %86 : DMA)
  AIE.wire(%85 : North, %86 : South)
  AIE.wire(%82 : East, %87 : West)
  AIE.wire(%2 : Core, %87 : Core)
  AIE.wire(%2 : DMA, %87 : DMA)
  AIE.wire(%86 : North, %87 : South)
  AIE.wire(%83 : East, %7 : West)
  AIE.wire(%3 : Core, %7 : Core)
  AIE.wire(%3 : DMA, %7 : DMA)
  AIE.wire(%87 : North, %7 : South)
}

