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
    %101 = AIE.amsel<1> (0)
    %102 = AIE.amsel<1> (1)
    %103 = AIE.masterset(DMA : 0, %101)
    %104 = AIE.masterset(North : 3, %102)
    AIE.packetrules(South : 3) {
      AIE.rule(31, 12, %101)
      AIE.rule(31, 13, %102)
    }
  }
  %13 = AIE.switchbox(%3) {
    AIE.connect<South : 3, North : 3>
  }
  %14 = AIE.switchbox(%4) {
    %101 = AIE.amsel<1> (0)
    %102 = AIE.masterset(DMA : 0, %101)
    AIE.packetrules(South : 3) {
      AIE.rule(31, 13, %101)
    }
  }
  %15 = AIE.shimDMA(%0) {
    %101 = AIE.lock(%0, 1)
    %102 = AIE.lock(%0, 2)
    %103 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%101, Acquire, 1)
    AIE.dmaBd(<%5 : memref<257xi32>, 0, 257>, 0)
    AIE.useLock(%101, Release, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%102, Acquire, 1)
    AIE.dmaBd(<%6 : memref<257xi32>, 0, 257>, 0)
    AIE.useLock(%102, Release, 0)
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb0, ^bb2
    AIE.end
  }
  %16 = AIE.lock(%2, 1)
  %17 = AIE.mem(%2) {
    %101 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
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
    %101 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // pred: ^bb0
    AIE.useLock(%18, Acquire, 0)
    AIE.dmaBd(<%8 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%18, Release, 1)
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    AIE.end
  }
  %20 = AIE.tile(0, 0)
  %21 = AIE.tile(0, 1)
  %22 = AIE.tile(0, 2)
  %23 = AIE.tile(0, 3)
  %24 = AIE.tile(0, 4)
  %25 = AIE.tile(1, 0)
  %26 = AIE.tile(1, 1)
  %27 = AIE.tile(1, 2)
  %28 = AIE.tile(1, 3)
  %29 = AIE.tile(1, 4)
  %30 = AIE.tile(2, 0)
  %31 = AIE.tile(2, 1)
  %32 = AIE.tile(2, 2)
  %33 = AIE.tile(2, 3)
  %34 = AIE.tile(2, 4)
  %35 = AIE.tile(3, 0)
  %36 = AIE.tile(3, 1)
  %37 = AIE.tile(3, 2)
  %38 = AIE.tile(3, 3)
  %39 = AIE.tile(3, 4)
  %40 = AIE.tile(4, 0)
  %41 = AIE.tile(4, 1)
  %42 = AIE.tile(4, 2)
  %43 = AIE.tile(4, 3)
  %44 = AIE.tile(4, 4)
  %45 = AIE.tile(5, 0)
  %46 = AIE.tile(5, 1)
  %47 = AIE.tile(5, 2)
  %48 = AIE.tile(5, 3)
  %49 = AIE.tile(5, 4)
  %50 = AIE.tile(6, 0)
  %51 = AIE.tile(6, 1)
  %52 = AIE.tile(6, 2)
  %53 = AIE.tile(6, 3)
  %54 = AIE.tile(6, 4)
  %55 = AIE.switchbox(%20) {
  }
  %56 = AIE.switchbox(%21) {
  }
  %57 = AIE.switchbox(%22) {
  }
  %58 = AIE.switchbox(%23) {
  }
  %59 = AIE.switchbox(%24) {
  }
  %60 = AIE.switchbox(%25) {
  }
  %61 = AIE.switchbox(%26) {
  }
  %62 = AIE.switchbox(%27) {
  }
  %63 = AIE.switchbox(%28) {
  }
  %64 = AIE.switchbox(%29) {
  }
  %65 = AIE.switchbox(%30) {
  }
  %66 = AIE.switchbox(%31) {
  }
  %67 = AIE.switchbox(%32) {
  }
  %68 = AIE.switchbox(%33) {
  }
  %69 = AIE.switchbox(%34) {
  }
  %70 = AIE.switchbox(%35) {
  }
  %71 = AIE.switchbox(%36) {
  }
  %72 = AIE.switchbox(%37) {
  }
  %73 = AIE.switchbox(%38) {
  }
  %74 = AIE.switchbox(%39) {
  }
  %75 = AIE.switchbox(%40) {
  }
  %76 = AIE.switchbox(%41) {
  }
  %77 = AIE.switchbox(%42) {
  }
  %78 = AIE.switchbox(%43) {
  }
  %79 = AIE.switchbox(%44) {
  }
  %80 = AIE.switchbox(%45) {
  }
  %81 = AIE.switchbox(%46) {
  }
  %82 = AIE.switchbox(%47) {
  }
  %83 = AIE.switchbox(%48) {
  }
  %84 = AIE.switchbox(%49) {
  }
  %85 = AIE.switchbox(%50) {
  }
  %86 = AIE.switchbox(%51) {
  }
  %87 = AIE.switchbox(%52) {
  }
  %88 = AIE.switchbox(%53) {
  }
  %89 = AIE.switchbox(%54) {
  }
  %90 = AIE.plio(0)
  %91 = AIE.plio(1)
  %92 = AIE.plio(2)
  %93 = AIE.plio(3)
  %94 = AIE.plio(4)
  %95 = AIE.plio(5)
  %96 = AIE.plio(6)
  %97 = AIE.plio(7)
  AIE.wire(%21 : Core, %56 : Core)
  AIE.wire(%21 : DMA, %56 : DMA)
  AIE.wire(%55 : North, %56 : South)
  AIE.wire(%22 : Core, %57 : Core)
  AIE.wire(%22 : DMA, %57 : DMA)
  AIE.wire(%56 : North, %57 : South)
  AIE.wire(%23 : Core, %58 : Core)
  AIE.wire(%23 : DMA, %58 : DMA)
  AIE.wire(%57 : North, %58 : South)
  AIE.wire(%24 : Core, %59 : Core)
  AIE.wire(%24 : DMA, %59 : DMA)
  AIE.wire(%58 : North, %59 : South)
  AIE.wire(%55 : East, %60 : West)
  AIE.wire(%91 : North, %60 : South)
  AIE.wire(%56 : East, %61 : West)
  AIE.wire(%26 : Core, %61 : Core)
  AIE.wire(%26 : DMA, %61 : DMA)
  AIE.wire(%60 : North, %61 : South)
  AIE.wire(%57 : East, %62 : West)
  AIE.wire(%27 : Core, %62 : Core)
  AIE.wire(%27 : DMA, %62 : DMA)
  AIE.wire(%61 : North, %62 : South)
  AIE.wire(%58 : East, %63 : West)
  AIE.wire(%28 : Core, %63 : Core)
  AIE.wire(%28 : DMA, %63 : DMA)
  AIE.wire(%62 : North, %63 : South)
  AIE.wire(%59 : East, %64 : West)
  AIE.wire(%29 : Core, %64 : Core)
  AIE.wire(%29 : DMA, %64 : DMA)
  AIE.wire(%63 : North, %64 : South)
  AIE.wire(%60 : East, %65 : West)
  %98 = AIE.shimmux(%30) {
  }
  AIE.wire(%98 : North, %65 : South)
  AIE.wire(%92 : North, %98 : South)
  AIE.wire(%30 : DMA, %98 : DMA)
  AIE.wire(%61 : East, %66 : West)
  AIE.wire(%31 : Core, %66 : Core)
  AIE.wire(%31 : DMA, %66 : DMA)
  AIE.wire(%65 : North, %66 : South)
  AIE.wire(%62 : East, %67 : West)
  AIE.wire(%32 : Core, %67 : Core)
  AIE.wire(%32 : DMA, %67 : DMA)
  AIE.wire(%66 : North, %67 : South)
  AIE.wire(%63 : East, %68 : West)
  AIE.wire(%33 : Core, %68 : Core)
  AIE.wire(%33 : DMA, %68 : DMA)
  AIE.wire(%67 : North, %68 : South)
  AIE.wire(%64 : East, %69 : West)
  AIE.wire(%34 : Core, %69 : Core)
  AIE.wire(%34 : DMA, %69 : DMA)
  AIE.wire(%68 : North, %69 : South)
  AIE.wire(%65 : East, %70 : West)
  %99 = AIE.shimmux(%35) {
  }
  AIE.wire(%99 : North, %70 : South)
  AIE.wire(%93 : North, %99 : South)
  AIE.wire(%35 : DMA, %99 : DMA)
  AIE.wire(%66 : East, %71 : West)
  AIE.wire(%36 : Core, %71 : Core)
  AIE.wire(%36 : DMA, %71 : DMA)
  AIE.wire(%70 : North, %71 : South)
  AIE.wire(%67 : East, %72 : West)
  AIE.wire(%37 : Core, %72 : Core)
  AIE.wire(%37 : DMA, %72 : DMA)
  AIE.wire(%71 : North, %72 : South)
  AIE.wire(%68 : East, %73 : West)
  AIE.wire(%38 : Core, %73 : Core)
  AIE.wire(%38 : DMA, %73 : DMA)
  AIE.wire(%72 : North, %73 : South)
  AIE.wire(%69 : East, %74 : West)
  AIE.wire(%39 : Core, %74 : Core)
  AIE.wire(%39 : DMA, %74 : DMA)
  AIE.wire(%73 : North, %74 : South)
  AIE.wire(%70 : East, %75 : West)
  AIE.wire(%94 : North, %75 : South)
  AIE.wire(%71 : East, %76 : West)
  AIE.wire(%41 : Core, %76 : Core)
  AIE.wire(%41 : DMA, %76 : DMA)
  AIE.wire(%75 : North, %76 : South)
  AIE.wire(%72 : East, %77 : West)
  AIE.wire(%42 : Core, %77 : Core)
  AIE.wire(%42 : DMA, %77 : DMA)
  AIE.wire(%76 : North, %77 : South)
  AIE.wire(%73 : East, %78 : West)
  AIE.wire(%43 : Core, %78 : Core)
  AIE.wire(%43 : DMA, %78 : DMA)
  AIE.wire(%77 : North, %78 : South)
  AIE.wire(%74 : East, %79 : West)
  AIE.wire(%44 : Core, %79 : Core)
  AIE.wire(%44 : DMA, %79 : DMA)
  AIE.wire(%78 : North, %79 : South)
  AIE.wire(%75 : East, %80 : West)
  AIE.wire(%95 : North, %80 : South)
  AIE.wire(%76 : East, %81 : West)
  AIE.wire(%46 : Core, %81 : Core)
  AIE.wire(%46 : DMA, %81 : DMA)
  AIE.wire(%80 : North, %81 : South)
  AIE.wire(%77 : East, %82 : West)
  AIE.wire(%47 : Core, %82 : Core)
  AIE.wire(%47 : DMA, %82 : DMA)
  AIE.wire(%81 : North, %82 : South)
  AIE.wire(%78 : East, %83 : West)
  AIE.wire(%48 : Core, %83 : Core)
  AIE.wire(%48 : DMA, %83 : DMA)
  AIE.wire(%82 : North, %83 : South)
  AIE.wire(%79 : East, %84 : West)
  AIE.wire(%49 : Core, %84 : Core)
  AIE.wire(%49 : DMA, %84 : DMA)
  AIE.wire(%83 : North, %84 : South)
  AIE.wire(%80 : East, %85 : West)
  %100 = AIE.shimmux(%50) {
  }
  AIE.wire(%100 : North, %85 : South)
  AIE.wire(%96 : North, %100 : South)
  AIE.wire(%50 : DMA, %100 : DMA)
  AIE.wire(%81 : East, %86 : West)
  AIE.wire(%51 : Core, %86 : Core)
  AIE.wire(%51 : DMA, %86 : DMA)
  AIE.wire(%85 : North, %86 : South)
  AIE.wire(%82 : East, %87 : West)
  AIE.wire(%52 : Core, %87 : Core)
  AIE.wire(%52 : DMA, %87 : DMA)
  AIE.wire(%86 : North, %87 : South)
  AIE.wire(%83 : East, %88 : West)
  AIE.wire(%53 : Core, %88 : Core)
  AIE.wire(%53 : DMA, %88 : DMA)
  AIE.wire(%87 : North, %88 : South)
  AIE.wire(%84 : East, %89 : West)
  AIE.wire(%54 : Core, %89 : Core)
  AIE.wire(%54 : DMA, %89 : DMA)
  AIE.wire(%88 : North, %89 : South)
  AIE.wire(%85 : East, %10 : West)
  AIE.wire(%11 : North, %10 : South)
  AIE.wire(%97 : North, %11 : South)
  AIE.wire(%0 : DMA, %11 : DMA)
  AIE.wire(%86 : East, %9 : West)
  AIE.wire(%1 : Core, %9 : Core)
  AIE.wire(%1 : DMA, %9 : DMA)
  AIE.wire(%10 : North, %9 : South)
  AIE.wire(%87 : East, %12 : West)
  AIE.wire(%2 : Core, %12 : Core)
  AIE.wire(%2 : DMA, %12 : DMA)
  AIE.wire(%9 : North, %12 : South)
  AIE.wire(%88 : East, %13 : West)
  AIE.wire(%3 : Core, %13 : Core)
  AIE.wire(%3 : DMA, %13 : DMA)
  AIE.wire(%12 : North, %13 : South)
  AIE.wire(%89 : East, %14 : West)
  AIE.wire(%4 : Core, %14 : Core)
  AIE.wire(%4 : DMA, %14 : DMA)
  AIE.wire(%13 : North, %14 : South)
}

