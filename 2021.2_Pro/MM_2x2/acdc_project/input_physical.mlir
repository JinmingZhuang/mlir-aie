module @test_single_kernel {
  %0 = AIE.tile(6, 2)
  %1 = AIE.tile(5, 2)
  %2 = AIE.tile(5, 3)
  %3 = AIE.tile(5, 4)
  %4 = AIE.tile(7, 0)
  %5 = AIE.tile(7, 2)
  %6 = AIE.tile(7, 3)
  %7 = AIE.tile(7, 4)
  %8 = AIE.buffer(%5) {address = 4096 : i32, sym_name = "buf72_0"} : memref<1024xi32>
  %9 = AIE.buffer(%5) {address = 8192 : i32, sym_name = "buf72_1"} : memref<1024xi32>
  %10 = AIE.buffer(%5) {address = 12288 : i32, sym_name = "buf72_2"} : memref<1024xi32>
  %11 = AIE.buffer(%5) {address = 16384 : i32, sym_name = "buf72_3"} : memref<1024xi32>
  %12 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf53_0"} : memref<1024xi32>
  %13 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "buf53_1"} : memref<1024xi32>
  %14 = AIE.buffer(%2) {address = 12288 : i32, sym_name = "buf53_2"} : memref<1024xi32>
  %15 = AIE.buffer(%2) {address = 16384 : i32, sym_name = "buf53_3"} : memref<1024xi32>
  %16 = AIE.buffer(%3) {address = 4096 : i32, sym_name = "buf54_0"} : memref<1024xi32>
  %17 = AIE.buffer(%3) {address = 8192 : i32, sym_name = "buf54_1"} : memref<1024xi32>
  %18 = AIE.buffer(%3) {address = 12288 : i32, sym_name = "buf54_2"} : memref<1024xi32>
  %19 = AIE.buffer(%6) {address = 4096 : i32, sym_name = "buf73_0"} : memref<1024xi32>
  %20 = AIE.buffer(%6) {address = 8192 : i32, sym_name = "buf73_1"} : memref<1024xi32>
  %21 = AIE.buffer(%6) {address = 12288 : i32, sym_name = "buf73_2"} : memref<1024xi32>
  %22 = AIE.buffer(%6) {address = 16384 : i32, sym_name = "buf73_3"} : memref<1024xi32>
  %23 = AIE.buffer(%7) {address = 4096 : i32, sym_name = "buf74_0"} : memref<1024xi32>
  %24 = AIE.buffer(%7) {address = 8192 : i32, sym_name = "buf74_1"} : memref<1024xi32>
  %25 = AIE.buffer(%7) {address = 12288 : i32, sym_name = "buf74_2"} : memref<1024xi32>
  %26 = AIE.switchbox(%5) {
    AIE.connect<DMA : 0, North : 0>
    AIE.connect<DMA : 1, North : 1>
    AIE.connect<DMA : 0, West : 0>
    AIE.connect<DMA : 1, West : 1>
  }
  %27 = AIE.mem(%5) {
    %131 = AIE.lock(%5, 4)
    %132 = AIE.lock(%5, 5)
    %133 = AIE.lock(%5, 6)
    %134 = AIE.lock(%5, 7)
    %135 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %136 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%131, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%8 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%131, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%132, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%9 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%132, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%133, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%10 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%133, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%134, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%11 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%134, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  %28 = AIE.switchbox(%0) {
    AIE.connect<East : 0, West : 0>
    AIE.connect<East : 1, West : 1>
  }
  %29 = AIE.switchbox(%1) {
    AIE.connect<East : 0, North : 0>
    AIE.connect<East : 1, North : 1>
  }
  %30 = AIE.switchbox(%2) {
    %131 = AIE.amsel<0> (0)
    %132 = AIE.amsel<1> (0)
    %133 = AIE.amsel<2> (0)
    %134 = AIE.amsel<3> (0)
    %135 = AIE.masterset(DMA : 0, %131)
    %136 = AIE.masterset(North : 0, %132)
    %137 = AIE.masterset(DMA : 1, %133)
    %138 = AIE.masterset(North : 1, %134)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %131)
      AIE.rule(31, 1, %132)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %133)
      AIE.rule(31, 3, %134)
    }
  }
  %31 = AIE.switchbox(%3) {
    %131 = AIE.amsel<0> (0)
    %132 = AIE.amsel<1> (0)
    %133 = AIE.masterset(DMA : 0, %131)
    %134 = AIE.masterset(DMA : 1, %132)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %131)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %132)
    }
  }
  %32 = AIE.lock(%2, 0)
  %33 = AIE.lock(%2, 1)
  %34 = AIE.mem(%2) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%32, Acquire, 0)
    AIE.dmaBd(<%12 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%33, Acquire, 0)
    AIE.dmaBd(<%13 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %35 = AIE.lock(%3, 0)
  %36 = AIE.lock(%3, 1)
  %37 = AIE.mem(%3) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%35, Acquire, 0)
    AIE.dmaBd(<%16 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%35, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%36, Acquire, 0)
    AIE.dmaBd(<%17 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%36, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %38 = AIE.lock(%2, 2)
  %39 = AIE.core(%2) {
    AIE.useLock(%32, Acquire, 1)
    AIE.useLock(%33, Acquire, 1)
    AIE.useLock(%38, Acquire, 0)
    call @extern_kernel(%12, %13, %14, %15) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%38, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %40 = AIE.lock(%3, 2)
  %41 = AIE.core(%3) {
    AIE.useLock(%38, Acquire, 1)
    AIE.useLock(%35, Acquire, 1)
    AIE.useLock(%36, Acquire, 1)
    AIE.useLock(%40, Acquire, 0)
    call @extern_kernel(%16, %17, %15, %18) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%40, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %42 = AIE.switchbox(%6) {
    %131 = AIE.amsel<0> (0)
    %132 = AIE.amsel<1> (0)
    %133 = AIE.amsel<2> (0)
    %134 = AIE.amsel<3> (0)
    %135 = AIE.masterset(DMA : 0, %131)
    %136 = AIE.masterset(North : 0, %132)
    %137 = AIE.masterset(DMA : 1, %133)
    %138 = AIE.masterset(North : 1, %134)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %131)
      AIE.rule(31, 1, %132)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %133)
      AIE.rule(31, 3, %134)
    }
  }
  %43 = AIE.switchbox(%7) {
    %131 = AIE.amsel<0> (0)
    %132 = AIE.amsel<1> (0)
    %133 = AIE.masterset(DMA : 0, %131)
    %134 = AIE.masterset(DMA : 1, %132)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %131)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %132)
    }
  }
  %44 = AIE.lock(%6, 0)
  %45 = AIE.lock(%6, 1)
  %46 = AIE.mem(%6) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%44, Acquire, 0)
    AIE.dmaBd(<%19 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%45, Acquire, 0)
    AIE.dmaBd(<%20 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %47 = AIE.lock(%7, 0)
  %48 = AIE.lock(%7, 1)
  %49 = AIE.mem(%7) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%47, Acquire, 0)
    AIE.dmaBd(<%23 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%48, Acquire, 0)
    AIE.dmaBd(<%24 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %50 = AIE.lock(%6, 2)
  %51 = AIE.core(%6) {
    AIE.useLock(%44, Acquire, 1)
    AIE.useLock(%45, Acquire, 1)
    AIE.useLock(%50, Acquire, 0)
    call @extern_kernel(%19, %20, %21, %22) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%50, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %52 = AIE.lock(%7, 2)
  %53 = AIE.core(%7) {
    AIE.useLock(%50, Acquire, 1)
    AIE.useLock(%47, Acquire, 1)
    AIE.useLock(%48, Acquire, 1)
    AIE.useLock(%52, Acquire, 0)
    call @extern_kernel(%23, %24, %22, %25) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%52, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %54 = AIE.tile(0, 0)
  %55 = AIE.tile(0, 1)
  %56 = AIE.tile(0, 2)
  %57 = AIE.tile(0, 3)
  %58 = AIE.tile(0, 4)
  %59 = AIE.tile(1, 0)
  %60 = AIE.tile(1, 1)
  %61 = AIE.tile(1, 2)
  %62 = AIE.tile(1, 3)
  %63 = AIE.tile(1, 4)
  %64 = AIE.tile(2, 0)
  %65 = AIE.tile(2, 1)
  %66 = AIE.tile(2, 2)
  %67 = AIE.tile(2, 3)
  %68 = AIE.tile(2, 4)
  %69 = AIE.tile(3, 0)
  %70 = AIE.tile(3, 1)
  %71 = AIE.tile(3, 2)
  %72 = AIE.tile(3, 3)
  %73 = AIE.tile(3, 4)
  %74 = AIE.tile(4, 0)
  %75 = AIE.tile(4, 1)
  %76 = AIE.tile(4, 2)
  %77 = AIE.tile(4, 3)
  %78 = AIE.tile(4, 4)
  %79 = AIE.tile(5, 0)
  %80 = AIE.tile(5, 1)
  %81 = AIE.tile(6, 0)
  %82 = AIE.tile(6, 1)
  %83 = AIE.tile(6, 3)
  %84 = AIE.tile(6, 4)
  %85 = AIE.tile(7, 1)
  %86 = AIE.switchbox(%54) {
  }
  %87 = AIE.switchbox(%55) {
  }
  %88 = AIE.switchbox(%56) {
  }
  %89 = AIE.switchbox(%57) {
  }
  %90 = AIE.switchbox(%58) {
  }
  %91 = AIE.switchbox(%59) {
  }
  %92 = AIE.switchbox(%60) {
  }
  %93 = AIE.switchbox(%61) {
  }
  %94 = AIE.switchbox(%62) {
  }
  %95 = AIE.switchbox(%63) {
  }
  %96 = AIE.switchbox(%64) {
  }
  %97 = AIE.switchbox(%65) {
  }
  %98 = AIE.switchbox(%66) {
  }
  %99 = AIE.switchbox(%67) {
  }
  %100 = AIE.switchbox(%68) {
  }
  %101 = AIE.switchbox(%69) {
  }
  %102 = AIE.switchbox(%70) {
  }
  %103 = AIE.switchbox(%71) {
  }
  %104 = AIE.switchbox(%72) {
  }
  %105 = AIE.switchbox(%73) {
  }
  %106 = AIE.switchbox(%74) {
  }
  %107 = AIE.switchbox(%75) {
  }
  %108 = AIE.switchbox(%76) {
  }
  %109 = AIE.switchbox(%77) {
  }
  %110 = AIE.switchbox(%78) {
  }
  %111 = AIE.switchbox(%79) {
  }
  %112 = AIE.switchbox(%80) {
  }
  %113 = AIE.switchbox(%81) {
  }
  %114 = AIE.switchbox(%82) {
  }
  %115 = AIE.switchbox(%83) {
  }
  %116 = AIE.switchbox(%84) {
  }
  %117 = AIE.switchbox(%4) {
  }
  %118 = AIE.switchbox(%85) {
  }
  %119 = AIE.plio(0)
  %120 = AIE.plio(1)
  %121 = AIE.plio(2)
  %122 = AIE.plio(3)
  %123 = AIE.plio(4)
  %124 = AIE.plio(5)
  %125 = AIE.plio(6)
  %126 = AIE.plio(7)
  AIE.wire(%55 : Core, %87 : Core)
  AIE.wire(%55 : DMA, %87 : DMA)
  AIE.wire(%86 : North, %87 : South)
  AIE.wire(%56 : Core, %88 : Core)
  AIE.wire(%56 : DMA, %88 : DMA)
  AIE.wire(%87 : North, %88 : South)
  AIE.wire(%57 : Core, %89 : Core)
  AIE.wire(%57 : DMA, %89 : DMA)
  AIE.wire(%88 : North, %89 : South)
  AIE.wire(%58 : Core, %90 : Core)
  AIE.wire(%58 : DMA, %90 : DMA)
  AIE.wire(%89 : North, %90 : South)
  AIE.wire(%86 : East, %91 : West)
  AIE.wire(%120 : North, %91 : South)
  AIE.wire(%87 : East, %92 : West)
  AIE.wire(%60 : Core, %92 : Core)
  AIE.wire(%60 : DMA, %92 : DMA)
  AIE.wire(%91 : North, %92 : South)
  AIE.wire(%88 : East, %93 : West)
  AIE.wire(%61 : Core, %93 : Core)
  AIE.wire(%61 : DMA, %93 : DMA)
  AIE.wire(%92 : North, %93 : South)
  AIE.wire(%89 : East, %94 : West)
  AIE.wire(%62 : Core, %94 : Core)
  AIE.wire(%62 : DMA, %94 : DMA)
  AIE.wire(%93 : North, %94 : South)
  AIE.wire(%90 : East, %95 : West)
  AIE.wire(%63 : Core, %95 : Core)
  AIE.wire(%63 : DMA, %95 : DMA)
  AIE.wire(%94 : North, %95 : South)
  AIE.wire(%91 : East, %96 : West)
  %127 = AIE.shimmux(%64) {
  }
  AIE.wire(%127 : North, %96 : South)
  AIE.wire(%121 : North, %127 : South)
  AIE.wire(%64 : DMA, %127 : DMA)
  AIE.wire(%92 : East, %97 : West)
  AIE.wire(%65 : Core, %97 : Core)
  AIE.wire(%65 : DMA, %97 : DMA)
  AIE.wire(%96 : North, %97 : South)
  AIE.wire(%93 : East, %98 : West)
  AIE.wire(%66 : Core, %98 : Core)
  AIE.wire(%66 : DMA, %98 : DMA)
  AIE.wire(%97 : North, %98 : South)
  AIE.wire(%94 : East, %99 : West)
  AIE.wire(%67 : Core, %99 : Core)
  AIE.wire(%67 : DMA, %99 : DMA)
  AIE.wire(%98 : North, %99 : South)
  AIE.wire(%95 : East, %100 : West)
  AIE.wire(%68 : Core, %100 : Core)
  AIE.wire(%68 : DMA, %100 : DMA)
  AIE.wire(%99 : North, %100 : South)
  AIE.wire(%96 : East, %101 : West)
  %128 = AIE.shimmux(%69) {
  }
  AIE.wire(%128 : North, %101 : South)
  AIE.wire(%122 : North, %128 : South)
  AIE.wire(%69 : DMA, %128 : DMA)
  AIE.wire(%97 : East, %102 : West)
  AIE.wire(%70 : Core, %102 : Core)
  AIE.wire(%70 : DMA, %102 : DMA)
  AIE.wire(%101 : North, %102 : South)
  AIE.wire(%98 : East, %103 : West)
  AIE.wire(%71 : Core, %103 : Core)
  AIE.wire(%71 : DMA, %103 : DMA)
  AIE.wire(%102 : North, %103 : South)
  AIE.wire(%99 : East, %104 : West)
  AIE.wire(%72 : Core, %104 : Core)
  AIE.wire(%72 : DMA, %104 : DMA)
  AIE.wire(%103 : North, %104 : South)
  AIE.wire(%100 : East, %105 : West)
  AIE.wire(%73 : Core, %105 : Core)
  AIE.wire(%73 : DMA, %105 : DMA)
  AIE.wire(%104 : North, %105 : South)
  AIE.wire(%101 : East, %106 : West)
  AIE.wire(%123 : North, %106 : South)
  AIE.wire(%102 : East, %107 : West)
  AIE.wire(%75 : Core, %107 : Core)
  AIE.wire(%75 : DMA, %107 : DMA)
  AIE.wire(%106 : North, %107 : South)
  AIE.wire(%103 : East, %108 : West)
  AIE.wire(%76 : Core, %108 : Core)
  AIE.wire(%76 : DMA, %108 : DMA)
  AIE.wire(%107 : North, %108 : South)
  AIE.wire(%104 : East, %109 : West)
  AIE.wire(%77 : Core, %109 : Core)
  AIE.wire(%77 : DMA, %109 : DMA)
  AIE.wire(%108 : North, %109 : South)
  AIE.wire(%105 : East, %110 : West)
  AIE.wire(%78 : Core, %110 : Core)
  AIE.wire(%78 : DMA, %110 : DMA)
  AIE.wire(%109 : North, %110 : South)
  AIE.wire(%106 : East, %111 : West)
  AIE.wire(%124 : North, %111 : South)
  AIE.wire(%107 : East, %112 : West)
  AIE.wire(%80 : Core, %112 : Core)
  AIE.wire(%80 : DMA, %112 : DMA)
  AIE.wire(%111 : North, %112 : South)
  AIE.wire(%108 : East, %29 : West)
  AIE.wire(%1 : Core, %29 : Core)
  AIE.wire(%1 : DMA, %29 : DMA)
  AIE.wire(%112 : North, %29 : South)
  AIE.wire(%109 : East, %30 : West)
  AIE.wire(%2 : Core, %30 : Core)
  AIE.wire(%2 : DMA, %30 : DMA)
  AIE.wire(%29 : North, %30 : South)
  AIE.wire(%110 : East, %31 : West)
  AIE.wire(%3 : Core, %31 : Core)
  AIE.wire(%3 : DMA, %31 : DMA)
  AIE.wire(%30 : North, %31 : South)
  AIE.wire(%111 : East, %113 : West)
  %129 = AIE.shimmux(%81) {
  }
  AIE.wire(%129 : North, %113 : South)
  AIE.wire(%125 : North, %129 : South)
  AIE.wire(%81 : DMA, %129 : DMA)
  AIE.wire(%112 : East, %114 : West)
  AIE.wire(%82 : Core, %114 : Core)
  AIE.wire(%82 : DMA, %114 : DMA)
  AIE.wire(%113 : North, %114 : South)
  AIE.wire(%29 : East, %28 : West)
  AIE.wire(%0 : Core, %28 : Core)
  AIE.wire(%0 : DMA, %28 : DMA)
  AIE.wire(%114 : North, %28 : South)
  AIE.wire(%30 : East, %115 : West)
  AIE.wire(%83 : Core, %115 : Core)
  AIE.wire(%83 : DMA, %115 : DMA)
  AIE.wire(%28 : North, %115 : South)
  AIE.wire(%31 : East, %116 : West)
  AIE.wire(%84 : Core, %116 : Core)
  AIE.wire(%84 : DMA, %116 : DMA)
  AIE.wire(%115 : North, %116 : South)
  AIE.wire(%113 : East, %117 : West)
  %130 = AIE.shimmux(%4) {
  }
  AIE.wire(%130 : North, %117 : South)
  AIE.wire(%126 : North, %130 : South)
  AIE.wire(%4 : DMA, %130 : DMA)
  AIE.wire(%114 : East, %118 : West)
  AIE.wire(%85 : Core, %118 : Core)
  AIE.wire(%85 : DMA, %118 : DMA)
  AIE.wire(%117 : North, %118 : South)
  AIE.wire(%28 : East, %26 : West)
  AIE.wire(%5 : Core, %26 : Core)
  AIE.wire(%5 : DMA, %26 : DMA)
  AIE.wire(%118 : North, %26 : South)
  AIE.wire(%115 : East, %42 : West)
  AIE.wire(%6 : Core, %42 : Core)
  AIE.wire(%6 : DMA, %42 : DMA)
  AIE.wire(%26 : North, %42 : South)
  AIE.wire(%116 : East, %43 : West)
  AIE.wire(%7 : Core, %43 : Core)
  AIE.wire(%7 : DMA, %43 : DMA)
  AIE.wire(%42 : North, %43 : South)
}

