module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.switchbox(%0) {
  }
  %2 = AIE.tile(7, 2)
  %3 = AIE.switchbox(%2) {
    %114 = AIE.amsel<0> (0)
    %115 = AIE.masterset(North : 0, %114)
    AIE.packetrules(DMA : 1) {
      AIE.rule(30, 2, %114)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(30, 0, %114)
    }
  }
  %4 = AIE.tile(7, 3)
  %5 = AIE.switchbox(%4) {
    %114 = AIE.amsel<0> (0)
    %115 = AIE.amsel<0> (1)
    %116 = AIE.amsel<0> (2)
    %117 = AIE.masterset(DMA : 0, %116)
    %118 = AIE.masterset(DMA : 1, %115)
    %119 = AIE.masterset(North : 0, %114)
    AIE.packetrules(South : 0) {
      AIE.rule(29, 1, %114)
      AIE.rule(31, 2, %115)
      AIE.rule(31, 0, %116)
    }
  }
  %6 = AIE.tile(7, 4)
  %7 = AIE.switchbox(%6) {
    %114 = AIE.amsel<0> (0)
    %115 = AIE.amsel<0> (1)
    %116 = AIE.masterset(DMA : 0, %115)
    %117 = AIE.masterset(DMA : 1, %114)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %114)
      AIE.rule(31, 1, %115)
    }
  }
  %8 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf72_0"} : memref<1024xi32>
  %9 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "buf72_1"} : memref<1024xi32>
  %10 = AIE.buffer(%2) {address = 12288 : i32, sym_name = "buf72_2"} : memref<1024xi32>
  %11 = AIE.buffer(%2) {address = 16384 : i32, sym_name = "buf72_3"} : memref<1024xi32>
  %12 = AIE.buffer(%4) {address = 4096 : i32, sym_name = "buf73_0"} : memref<1024xi32>
  %13 = AIE.buffer(%4) {address = 8192 : i32, sym_name = "buf73_1"} : memref<1024xi32>
  %14 = AIE.buffer(%4) {address = 12288 : i32, sym_name = "buf73_2"} : memref<1024xi32>
  %15 = AIE.buffer(%4) {address = 16384 : i32, sym_name = "buf73_3"} : memref<1024xi32>
  %16 = AIE.buffer(%6) {address = 4096 : i32, sym_name = "buf74_0"} : memref<1024xi32>
  %17 = AIE.buffer(%6) {address = 8192 : i32, sym_name = "buf74_1"} : memref<1024xi32>
  %18 = AIE.buffer(%6) {address = 12288 : i32, sym_name = "buf74_2"} : memref<1024xi32>
  %19 = AIE.mem(%2) {
    %114 = AIE.lock(%2, 4)
    %115 = AIE.lock(%2, 5)
    %116 = AIE.lock(%2, 6)
    %117 = AIE.lock(%2, 7)
    %118 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %119 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%114, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%8 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%114, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%115, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%9 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%115, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%116, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%10 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%116, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%117, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%11 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%117, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %20 = AIE.lock(%4, 0)
  %21 = AIE.lock(%4, 1)
  %22 = AIE.mem(%4) {
    %114 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %115 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%20, Acquire, 0)
    AIE.dmaBd(<%12 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%20, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%21, Acquire, 0)
    AIE.dmaBd(<%13 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%21, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %23 = AIE.lock(%6, 0)
  %24 = AIE.lock(%6, 1)
  %25 = AIE.mem(%6) {
    %114 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %115 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%23, Acquire, 0)
    AIE.dmaBd(<%16 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%23, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%24, Acquire, 0)
    AIE.dmaBd(<%17 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%24, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %26 = AIE.lock(%4, 2)
  %27 = AIE.core(%4) {
    AIE.useLock(%20, Acquire, 1)
    AIE.useLock(%21, Acquire, 1)
    AIE.useLock(%26, Acquire, 0)
    call @extern_kernel(%12, %13, %14, %15) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%26, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %28 = AIE.lock(%6, 2)
  %29 = AIE.core(%6) {
    AIE.useLock(%26, Acquire, 1)
    AIE.useLock(%23, Acquire, 1)
    AIE.useLock(%24, Acquire, 1)
    AIE.useLock(%28, Acquire, 0)
    call @extern_kernel(%16, %17, %15, %18) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%28, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %30 = AIE.tile(0, 0)
  %31 = AIE.tile(0, 1)
  %32 = AIE.tile(0, 2)
  %33 = AIE.tile(0, 3)
  %34 = AIE.tile(0, 4)
  %35 = AIE.tile(1, 0)
  %36 = AIE.tile(1, 1)
  %37 = AIE.tile(1, 2)
  %38 = AIE.tile(1, 3)
  %39 = AIE.tile(1, 4)
  %40 = AIE.tile(2, 0)
  %41 = AIE.tile(2, 1)
  %42 = AIE.tile(2, 2)
  %43 = AIE.tile(2, 3)
  %44 = AIE.tile(2, 4)
  %45 = AIE.tile(3, 0)
  %46 = AIE.tile(3, 1)
  %47 = AIE.tile(3, 2)
  %48 = AIE.tile(3, 3)
  %49 = AIE.tile(3, 4)
  %50 = AIE.tile(4, 0)
  %51 = AIE.tile(4, 1)
  %52 = AIE.tile(4, 2)
  %53 = AIE.tile(4, 3)
  %54 = AIE.tile(4, 4)
  %55 = AIE.tile(5, 0)
  %56 = AIE.tile(5, 1)
  %57 = AIE.tile(5, 2)
  %58 = AIE.tile(5, 3)
  %59 = AIE.tile(5, 4)
  %60 = AIE.tile(6, 0)
  %61 = AIE.tile(6, 1)
  %62 = AIE.tile(6, 2)
  %63 = AIE.tile(6, 3)
  %64 = AIE.tile(6, 4)
  %65 = AIE.tile(7, 1)
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
  %84 = AIE.switchbox(%48) {
  }
  %85 = AIE.switchbox(%49) {
  }
  %86 = AIE.switchbox(%50) {
  }
  %87 = AIE.switchbox(%51) {
  }
  %88 = AIE.switchbox(%52) {
  }
  %89 = AIE.switchbox(%53) {
  }
  %90 = AIE.switchbox(%54) {
  }
  %91 = AIE.switchbox(%55) {
  }
  %92 = AIE.switchbox(%56) {
  }
  %93 = AIE.switchbox(%57) {
  }
  %94 = AIE.switchbox(%58) {
  }
  %95 = AIE.switchbox(%59) {
  }
  %96 = AIE.switchbox(%60) {
  }
  %97 = AIE.switchbox(%61) {
  }
  %98 = AIE.switchbox(%62) {
  }
  %99 = AIE.switchbox(%63) {
  }
  %100 = AIE.switchbox(%64) {
  }
  %101 = AIE.switchbox(%65) {
  }
  %102 = AIE.plio(0)
  %103 = AIE.plio(1)
  %104 = AIE.plio(2)
  %105 = AIE.plio(3)
  %106 = AIE.plio(4)
  %107 = AIE.plio(5)
  %108 = AIE.plio(6)
  %109 = AIE.plio(7)
  AIE.wire(%31 : Core, %67 : Core)
  AIE.wire(%31 : DMA, %67 : DMA)
  AIE.wire(%66 : North, %67 : South)
  AIE.wire(%32 : Core, %68 : Core)
  AIE.wire(%32 : DMA, %68 : DMA)
  AIE.wire(%67 : North, %68 : South)
  AIE.wire(%33 : Core, %69 : Core)
  AIE.wire(%33 : DMA, %69 : DMA)
  AIE.wire(%68 : North, %69 : South)
  AIE.wire(%34 : Core, %70 : Core)
  AIE.wire(%34 : DMA, %70 : DMA)
  AIE.wire(%69 : North, %70 : South)
  AIE.wire(%66 : East, %71 : West)
  AIE.wire(%103 : North, %71 : South)
  AIE.wire(%67 : East, %72 : West)
  AIE.wire(%36 : Core, %72 : Core)
  AIE.wire(%36 : DMA, %72 : DMA)
  AIE.wire(%71 : North, %72 : South)
  AIE.wire(%68 : East, %73 : West)
  AIE.wire(%37 : Core, %73 : Core)
  AIE.wire(%37 : DMA, %73 : DMA)
  AIE.wire(%72 : North, %73 : South)
  AIE.wire(%69 : East, %74 : West)
  AIE.wire(%38 : Core, %74 : Core)
  AIE.wire(%38 : DMA, %74 : DMA)
  AIE.wire(%73 : North, %74 : South)
  AIE.wire(%70 : East, %75 : West)
  AIE.wire(%39 : Core, %75 : Core)
  AIE.wire(%39 : DMA, %75 : DMA)
  AIE.wire(%74 : North, %75 : South)
  AIE.wire(%71 : East, %76 : West)
  %110 = AIE.shimmux(%40) {
  }
  AIE.wire(%110 : North, %76 : South)
  AIE.wire(%104 : North, %110 : South)
  AIE.wire(%40 : DMA, %110 : DMA)
  AIE.wire(%72 : East, %77 : West)
  AIE.wire(%41 : Core, %77 : Core)
  AIE.wire(%41 : DMA, %77 : DMA)
  AIE.wire(%76 : North, %77 : South)
  AIE.wire(%73 : East, %78 : West)
  AIE.wire(%42 : Core, %78 : Core)
  AIE.wire(%42 : DMA, %78 : DMA)
  AIE.wire(%77 : North, %78 : South)
  AIE.wire(%74 : East, %79 : West)
  AIE.wire(%43 : Core, %79 : Core)
  AIE.wire(%43 : DMA, %79 : DMA)
  AIE.wire(%78 : North, %79 : South)
  AIE.wire(%75 : East, %80 : West)
  AIE.wire(%44 : Core, %80 : Core)
  AIE.wire(%44 : DMA, %80 : DMA)
  AIE.wire(%79 : North, %80 : South)
  AIE.wire(%76 : East, %81 : West)
  %111 = AIE.shimmux(%45) {
  }
  AIE.wire(%111 : North, %81 : South)
  AIE.wire(%105 : North, %111 : South)
  AIE.wire(%45 : DMA, %111 : DMA)
  AIE.wire(%77 : East, %82 : West)
  AIE.wire(%46 : Core, %82 : Core)
  AIE.wire(%46 : DMA, %82 : DMA)
  AIE.wire(%81 : North, %82 : South)
  AIE.wire(%78 : East, %83 : West)
  AIE.wire(%47 : Core, %83 : Core)
  AIE.wire(%47 : DMA, %83 : DMA)
  AIE.wire(%82 : North, %83 : South)
  AIE.wire(%79 : East, %84 : West)
  AIE.wire(%48 : Core, %84 : Core)
  AIE.wire(%48 : DMA, %84 : DMA)
  AIE.wire(%83 : North, %84 : South)
  AIE.wire(%80 : East, %85 : West)
  AIE.wire(%49 : Core, %85 : Core)
  AIE.wire(%49 : DMA, %85 : DMA)
  AIE.wire(%84 : North, %85 : South)
  AIE.wire(%81 : East, %86 : West)
  AIE.wire(%106 : North, %86 : South)
  AIE.wire(%82 : East, %87 : West)
  AIE.wire(%51 : Core, %87 : Core)
  AIE.wire(%51 : DMA, %87 : DMA)
  AIE.wire(%86 : North, %87 : South)
  AIE.wire(%83 : East, %88 : West)
  AIE.wire(%52 : Core, %88 : Core)
  AIE.wire(%52 : DMA, %88 : DMA)
  AIE.wire(%87 : North, %88 : South)
  AIE.wire(%84 : East, %89 : West)
  AIE.wire(%53 : Core, %89 : Core)
  AIE.wire(%53 : DMA, %89 : DMA)
  AIE.wire(%88 : North, %89 : South)
  AIE.wire(%85 : East, %90 : West)
  AIE.wire(%54 : Core, %90 : Core)
  AIE.wire(%54 : DMA, %90 : DMA)
  AIE.wire(%89 : North, %90 : South)
  AIE.wire(%86 : East, %91 : West)
  AIE.wire(%107 : North, %91 : South)
  AIE.wire(%87 : East, %92 : West)
  AIE.wire(%56 : Core, %92 : Core)
  AIE.wire(%56 : DMA, %92 : DMA)
  AIE.wire(%91 : North, %92 : South)
  AIE.wire(%88 : East, %93 : West)
  AIE.wire(%57 : Core, %93 : Core)
  AIE.wire(%57 : DMA, %93 : DMA)
  AIE.wire(%92 : North, %93 : South)
  AIE.wire(%89 : East, %94 : West)
  AIE.wire(%58 : Core, %94 : Core)
  AIE.wire(%58 : DMA, %94 : DMA)
  AIE.wire(%93 : North, %94 : South)
  AIE.wire(%90 : East, %95 : West)
  AIE.wire(%59 : Core, %95 : Core)
  AIE.wire(%59 : DMA, %95 : DMA)
  AIE.wire(%94 : North, %95 : South)
  AIE.wire(%91 : East, %96 : West)
  %112 = AIE.shimmux(%60) {
  }
  AIE.wire(%112 : North, %96 : South)
  AIE.wire(%108 : North, %112 : South)
  AIE.wire(%60 : DMA, %112 : DMA)
  AIE.wire(%92 : East, %97 : West)
  AIE.wire(%61 : Core, %97 : Core)
  AIE.wire(%61 : DMA, %97 : DMA)
  AIE.wire(%96 : North, %97 : South)
  AIE.wire(%93 : East, %98 : West)
  AIE.wire(%62 : Core, %98 : Core)
  AIE.wire(%62 : DMA, %98 : DMA)
  AIE.wire(%97 : North, %98 : South)
  AIE.wire(%94 : East, %99 : West)
  AIE.wire(%63 : Core, %99 : Core)
  AIE.wire(%63 : DMA, %99 : DMA)
  AIE.wire(%98 : North, %99 : South)
  AIE.wire(%95 : East, %100 : West)
  AIE.wire(%64 : Core, %100 : Core)
  AIE.wire(%64 : DMA, %100 : DMA)
  AIE.wire(%99 : North, %100 : South)
  AIE.wire(%96 : East, %1 : West)
  %113 = AIE.shimmux(%0) {
  }
  AIE.wire(%113 : North, %1 : South)
  AIE.wire(%109 : North, %113 : South)
  AIE.wire(%0 : DMA, %113 : DMA)
  AIE.wire(%97 : East, %101 : West)
  AIE.wire(%65 : Core, %101 : Core)
  AIE.wire(%65 : DMA, %101 : DMA)
  AIE.wire(%1 : North, %101 : South)
  AIE.wire(%98 : East, %3 : West)
  AIE.wire(%2 : Core, %3 : Core)
  AIE.wire(%2 : DMA, %3 : DMA)
  AIE.wire(%101 : North, %3 : South)
  AIE.wire(%99 : East, %5 : West)
  AIE.wire(%4 : Core, %5 : Core)
  AIE.wire(%4 : DMA, %5 : DMA)
  AIE.wire(%3 : North, %5 : South)
  AIE.wire(%100 : East, %7 : West)
  AIE.wire(%6 : Core, %7 : Core)
  AIE.wire(%6 : DMA, %7 : DMA)
  AIE.wire(%5 : North, %7 : South)
}

