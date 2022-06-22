module @test_single_kernel {
  %0 = AIE.tile(6, 2)
  %1 = AIE.tile(6, 3)
  %2 = AIE.tile(6, 4)
  %3 = AIE.tile(7, 0)
  %4 = AIE.tile(7, 2)
  %5 = AIE.tile(7, 3)
  %6 = AIE.tile(7, 4)
  %7 = AIE.buffer(%4) {address = 4096 : i32, sym_name = "buf72_0"} : memref<1024xi32>
  %8 = AIE.buffer(%4) {address = 8192 : i32, sym_name = "buf72_1"} : memref<1024xi32>
  %9 = AIE.buffer(%4) {address = 12288 : i32, sym_name = "buf72_2"} : memref<1024xi32>
  %10 = AIE.buffer(%4) {address = 16384 : i32, sym_name = "buf72_3"} : memref<1024xi32>
  %11 = AIE.buffer(%1) {address = 4096 : i32, sym_name = "buf63_0"} : memref<1024xi32>
  %12 = AIE.buffer(%1) {address = 8192 : i32, sym_name = "buf63_1"} : memref<1024xi32>
  %13 = AIE.buffer(%1) {address = 12288 : i32, sym_name = "buf63_2"} : memref<1024xi32>
  %14 = AIE.buffer(%1) {address = 16384 : i32, sym_name = "buf63_3"} : memref<1024xi32>
  %15 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf64_0"} : memref<1024xi32>
  %16 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "buf64_1"} : memref<1024xi32>
  %17 = AIE.buffer(%2) {address = 12288 : i32, sym_name = "buf64_2"} : memref<1024xi32>
  %18 = AIE.buffer(%5) {address = 4096 : i32, sym_name = "buf73_0"} : memref<1024xi32>
  %19 = AIE.buffer(%5) {address = 8192 : i32, sym_name = "buf73_1"} : memref<1024xi32>
  %20 = AIE.buffer(%5) {address = 12288 : i32, sym_name = "buf73_2"} : memref<1024xi32>
  %21 = AIE.buffer(%5) {address = 16384 : i32, sym_name = "buf73_3"} : memref<1024xi32>
  %22 = AIE.buffer(%6) {address = 4096 : i32, sym_name = "buf74_0"} : memref<1024xi32>
  %23 = AIE.buffer(%6) {address = 8192 : i32, sym_name = "buf74_1"} : memref<1024xi32>
  %24 = AIE.buffer(%6) {address = 12288 : i32, sym_name = "buf74_2"} : memref<1024xi32>
  %25 = AIE.switchbox(%4) {
    AIE.connect<DMA : 0, North : 0>
    AIE.connect<DMA : 1, North : 1>
    AIE.connect<DMA : 0, West : 0>
    AIE.connect<DMA : 1, West : 1>
  }
  %26 = AIE.mem(%4) {
    %131 = AIE.lock(%4, 4)
    %132 = AIE.lock(%4, 5)
    %133 = AIE.lock(%4, 6)
    %134 = AIE.lock(%4, 7)
    %135 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %136 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%131, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%7 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%131, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%132, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%8 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%132, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%133, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%9 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%133, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%134, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%10 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%134, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  %27 = AIE.switchbox(%0) {
    AIE.connect<East : 0, North : 0>
    AIE.connect<East : 1, North : 1>
  }
  %28 = AIE.switchbox(%1) {
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
  %29 = AIE.switchbox(%2) {
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
  %30 = AIE.lock(%1, 0)
  %31 = AIE.lock(%1, 1)
  %32 = AIE.mem(%1) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%30, Acquire, 0)
    AIE.dmaBd(<%11 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%31, Acquire, 0)
    AIE.dmaBd(<%12 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %33 = AIE.lock(%2, 0)
  %34 = AIE.lock(%2, 1)
  %35 = AIE.mem(%2) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%33, Acquire, 0)
    AIE.dmaBd(<%15 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%34, Acquire, 0)
    AIE.dmaBd(<%16 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%34, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %36 = AIE.lock(%1, 3)
  %37 = AIE.core(%1) {
    AIE.useLock(%30, Acquire, 1)
    AIE.useLock(%31, Acquire, 1)
    AIE.useLock(%36, Acquire, 0)
    call @extern_kernel(%11, %12, %13, %14) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%36, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %38 = AIE.lock(%2, 2)
  %39 = AIE.core(%2) {
    AIE.useLock(%36, Acquire, 1)
    AIE.useLock(%33, Acquire, 1)
    AIE.useLock(%34, Acquire, 1)
    AIE.useLock(%38, Acquire, 0)
    call @extern_kernel(%15, %16, %14, %17) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%38, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %40 = AIE.switchbox(%5) {
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
  %41 = AIE.switchbox(%6) {
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
  %42 = AIE.lock(%5, 0)
  %43 = AIE.lock(%5, 1)
  %44 = AIE.mem(%5) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%42, Acquire, 0)
    AIE.dmaBd(<%18 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%42, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%43, Acquire, 0)
    AIE.dmaBd(<%19 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %45 = AIE.lock(%6, 0)
  %46 = AIE.lock(%6, 1)
  %47 = AIE.mem(%6) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%45, Acquire, 0)
    AIE.dmaBd(<%22 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%46, Acquire, 0)
    AIE.dmaBd(<%23 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %48 = AIE.lock(%5, 2)
  %49 = AIE.core(%5) {
    AIE.useLock(%42, Acquire, 1)
    AIE.useLock(%43, Acquire, 1)
    AIE.useLock(%48, Acquire, 0)
    call @extern_kernel(%18, %19, %20, %21) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%48, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %50 = AIE.lock(%6, 2)
  %51 = AIE.core(%6) {
    AIE.useLock(%48, Acquire, 1)
    AIE.useLock(%45, Acquire, 1)
    AIE.useLock(%46, Acquire, 1)
    AIE.useLock(%50, Acquire, 0)
    call @extern_kernel(%22, %23, %21, %24) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%50, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %52 = AIE.tile(0, 0)
  %53 = AIE.tile(0, 1)
  %54 = AIE.tile(0, 2)
  %55 = AIE.tile(0, 3)
  %56 = AIE.tile(0, 4)
  %57 = AIE.tile(1, 0)
  %58 = AIE.tile(1, 1)
  %59 = AIE.tile(1, 2)
  %60 = AIE.tile(1, 3)
  %61 = AIE.tile(1, 4)
  %62 = AIE.tile(2, 0)
  %63 = AIE.tile(2, 1)
  %64 = AIE.tile(2, 2)
  %65 = AIE.tile(2, 3)
  %66 = AIE.tile(2, 4)
  %67 = AIE.tile(3, 0)
  %68 = AIE.tile(3, 1)
  %69 = AIE.tile(3, 2)
  %70 = AIE.tile(3, 3)
  %71 = AIE.tile(3, 4)
  %72 = AIE.tile(4, 0)
  %73 = AIE.tile(4, 1)
  %74 = AIE.tile(4, 2)
  %75 = AIE.tile(4, 3)
  %76 = AIE.tile(4, 4)
  %77 = AIE.tile(5, 0)
  %78 = AIE.tile(5, 1)
  %79 = AIE.tile(5, 2)
  %80 = AIE.tile(5, 3)
  %81 = AIE.tile(5, 4)
  %82 = AIE.tile(6, 0)
  %83 = AIE.tile(6, 1)
  %84 = AIE.tile(7, 1)
  %85 = AIE.switchbox(%52) {
  }
  %86 = AIE.switchbox(%53) {
  }
  %87 = AIE.switchbox(%54) {
  }
  %88 = AIE.switchbox(%55) {
  }
  %89 = AIE.switchbox(%56) {
  }
  %90 = AIE.switchbox(%57) {
  }
  %91 = AIE.switchbox(%58) {
  }
  %92 = AIE.switchbox(%59) {
  }
  %93 = AIE.switchbox(%60) {
  }
  %94 = AIE.switchbox(%61) {
  }
  %95 = AIE.switchbox(%62) {
  }
  %96 = AIE.switchbox(%63) {
  }
  %97 = AIE.switchbox(%64) {
  }
  %98 = AIE.switchbox(%65) {
  }
  %99 = AIE.switchbox(%66) {
  }
  %100 = AIE.switchbox(%67) {
  }
  %101 = AIE.switchbox(%68) {
  }
  %102 = AIE.switchbox(%69) {
  }
  %103 = AIE.switchbox(%70) {
  }
  %104 = AIE.switchbox(%71) {
  }
  %105 = AIE.switchbox(%72) {
  }
  %106 = AIE.switchbox(%73) {
  }
  %107 = AIE.switchbox(%74) {
  }
  %108 = AIE.switchbox(%75) {
  }
  %109 = AIE.switchbox(%76) {
  }
  %110 = AIE.switchbox(%77) {
  }
  %111 = AIE.switchbox(%78) {
  }
  %112 = AIE.switchbox(%79) {
  }
  %113 = AIE.switchbox(%80) {
  }
  %114 = AIE.switchbox(%81) {
  }
  %115 = AIE.switchbox(%82) {
  }
  %116 = AIE.switchbox(%83) {
  }
  %117 = AIE.switchbox(%3) {
  }
  %118 = AIE.switchbox(%84) {
  }
  %119 = AIE.plio(0)
  %120 = AIE.plio(1)
  %121 = AIE.plio(2)
  %122 = AIE.plio(3)
  %123 = AIE.plio(4)
  %124 = AIE.plio(5)
  %125 = AIE.plio(6)
  %126 = AIE.plio(7)
  AIE.wire(%53 : Core, %86 : Core)
  AIE.wire(%53 : DMA, %86 : DMA)
  AIE.wire(%85 : North, %86 : South)
  AIE.wire(%54 : Core, %87 : Core)
  AIE.wire(%54 : DMA, %87 : DMA)
  AIE.wire(%86 : North, %87 : South)
  AIE.wire(%55 : Core, %88 : Core)
  AIE.wire(%55 : DMA, %88 : DMA)
  AIE.wire(%87 : North, %88 : South)
  AIE.wire(%56 : Core, %89 : Core)
  AIE.wire(%56 : DMA, %89 : DMA)
  AIE.wire(%88 : North, %89 : South)
  AIE.wire(%85 : East, %90 : West)
  AIE.wire(%120 : North, %90 : South)
  AIE.wire(%86 : East, %91 : West)
  AIE.wire(%58 : Core, %91 : Core)
  AIE.wire(%58 : DMA, %91 : DMA)
  AIE.wire(%90 : North, %91 : South)
  AIE.wire(%87 : East, %92 : West)
  AIE.wire(%59 : Core, %92 : Core)
  AIE.wire(%59 : DMA, %92 : DMA)
  AIE.wire(%91 : North, %92 : South)
  AIE.wire(%88 : East, %93 : West)
  AIE.wire(%60 : Core, %93 : Core)
  AIE.wire(%60 : DMA, %93 : DMA)
  AIE.wire(%92 : North, %93 : South)
  AIE.wire(%89 : East, %94 : West)
  AIE.wire(%61 : Core, %94 : Core)
  AIE.wire(%61 : DMA, %94 : DMA)
  AIE.wire(%93 : North, %94 : South)
  AIE.wire(%90 : East, %95 : West)
  %127 = AIE.shimmux(%62) {
  }
  AIE.wire(%127 : North, %95 : South)
  AIE.wire(%121 : North, %127 : South)
  AIE.wire(%62 : DMA, %127 : DMA)
  AIE.wire(%91 : East, %96 : West)
  AIE.wire(%63 : Core, %96 : Core)
  AIE.wire(%63 : DMA, %96 : DMA)
  AIE.wire(%95 : North, %96 : South)
  AIE.wire(%92 : East, %97 : West)
  AIE.wire(%64 : Core, %97 : Core)
  AIE.wire(%64 : DMA, %97 : DMA)
  AIE.wire(%96 : North, %97 : South)
  AIE.wire(%93 : East, %98 : West)
  AIE.wire(%65 : Core, %98 : Core)
  AIE.wire(%65 : DMA, %98 : DMA)
  AIE.wire(%97 : North, %98 : South)
  AIE.wire(%94 : East, %99 : West)
  AIE.wire(%66 : Core, %99 : Core)
  AIE.wire(%66 : DMA, %99 : DMA)
  AIE.wire(%98 : North, %99 : South)
  AIE.wire(%95 : East, %100 : West)
  %128 = AIE.shimmux(%67) {
  }
  AIE.wire(%128 : North, %100 : South)
  AIE.wire(%122 : North, %128 : South)
  AIE.wire(%67 : DMA, %128 : DMA)
  AIE.wire(%96 : East, %101 : West)
  AIE.wire(%68 : Core, %101 : Core)
  AIE.wire(%68 : DMA, %101 : DMA)
  AIE.wire(%100 : North, %101 : South)
  AIE.wire(%97 : East, %102 : West)
  AIE.wire(%69 : Core, %102 : Core)
  AIE.wire(%69 : DMA, %102 : DMA)
  AIE.wire(%101 : North, %102 : South)
  AIE.wire(%98 : East, %103 : West)
  AIE.wire(%70 : Core, %103 : Core)
  AIE.wire(%70 : DMA, %103 : DMA)
  AIE.wire(%102 : North, %103 : South)
  AIE.wire(%99 : East, %104 : West)
  AIE.wire(%71 : Core, %104 : Core)
  AIE.wire(%71 : DMA, %104 : DMA)
  AIE.wire(%103 : North, %104 : South)
  AIE.wire(%100 : East, %105 : West)
  AIE.wire(%123 : North, %105 : South)
  AIE.wire(%101 : East, %106 : West)
  AIE.wire(%73 : Core, %106 : Core)
  AIE.wire(%73 : DMA, %106 : DMA)
  AIE.wire(%105 : North, %106 : South)
  AIE.wire(%102 : East, %107 : West)
  AIE.wire(%74 : Core, %107 : Core)
  AIE.wire(%74 : DMA, %107 : DMA)
  AIE.wire(%106 : North, %107 : South)
  AIE.wire(%103 : East, %108 : West)
  AIE.wire(%75 : Core, %108 : Core)
  AIE.wire(%75 : DMA, %108 : DMA)
  AIE.wire(%107 : North, %108 : South)
  AIE.wire(%104 : East, %109 : West)
  AIE.wire(%76 : Core, %109 : Core)
  AIE.wire(%76 : DMA, %109 : DMA)
  AIE.wire(%108 : North, %109 : South)
  AIE.wire(%105 : East, %110 : West)
  AIE.wire(%124 : North, %110 : South)
  AIE.wire(%106 : East, %111 : West)
  AIE.wire(%78 : Core, %111 : Core)
  AIE.wire(%78 : DMA, %111 : DMA)
  AIE.wire(%110 : North, %111 : South)
  AIE.wire(%107 : East, %112 : West)
  AIE.wire(%79 : Core, %112 : Core)
  AIE.wire(%79 : DMA, %112 : DMA)
  AIE.wire(%111 : North, %112 : South)
  AIE.wire(%108 : East, %113 : West)
  AIE.wire(%80 : Core, %113 : Core)
  AIE.wire(%80 : DMA, %113 : DMA)
  AIE.wire(%112 : North, %113 : South)
  AIE.wire(%109 : East, %114 : West)
  AIE.wire(%81 : Core, %114 : Core)
  AIE.wire(%81 : DMA, %114 : DMA)
  AIE.wire(%113 : North, %114 : South)
  AIE.wire(%110 : East, %115 : West)
  %129 = AIE.shimmux(%82) {
  }
  AIE.wire(%129 : North, %115 : South)
  AIE.wire(%125 : North, %129 : South)
  AIE.wire(%82 : DMA, %129 : DMA)
  AIE.wire(%111 : East, %116 : West)
  AIE.wire(%83 : Core, %116 : Core)
  AIE.wire(%83 : DMA, %116 : DMA)
  AIE.wire(%115 : North, %116 : South)
  AIE.wire(%112 : East, %27 : West)
  AIE.wire(%0 : Core, %27 : Core)
  AIE.wire(%0 : DMA, %27 : DMA)
  AIE.wire(%116 : North, %27 : South)
  AIE.wire(%113 : East, %28 : West)
  AIE.wire(%1 : Core, %28 : Core)
  AIE.wire(%1 : DMA, %28 : DMA)
  AIE.wire(%27 : North, %28 : South)
  AIE.wire(%114 : East, %29 : West)
  AIE.wire(%2 : Core, %29 : Core)
  AIE.wire(%2 : DMA, %29 : DMA)
  AIE.wire(%28 : North, %29 : South)
  AIE.wire(%115 : East, %117 : West)
  %130 = AIE.shimmux(%3) {
  }
  AIE.wire(%130 : North, %117 : South)
  AIE.wire(%126 : North, %130 : South)
  AIE.wire(%3 : DMA, %130 : DMA)
  AIE.wire(%116 : East, %118 : West)
  AIE.wire(%84 : Core, %118 : Core)
  AIE.wire(%84 : DMA, %118 : DMA)
  AIE.wire(%117 : North, %118 : South)
  AIE.wire(%27 : East, %25 : West)
  AIE.wire(%4 : Core, %25 : Core)
  AIE.wire(%4 : DMA, %25 : DMA)
  AIE.wire(%118 : North, %25 : South)
  AIE.wire(%28 : East, %40 : West)
  AIE.wire(%5 : Core, %40 : Core)
  AIE.wire(%5 : DMA, %40 : DMA)
  AIE.wire(%25 : North, %40 : South)
  AIE.wire(%29 : East, %41 : West)
  AIE.wire(%6 : Core, %41 : Core)
  AIE.wire(%6 : DMA, %41 : DMA)
  AIE.wire(%40 : North, %41 : South)
}

