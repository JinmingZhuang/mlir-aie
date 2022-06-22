module @test_single_kernel {
  %0 = AIE.tile(6, 2)
  %1 = AIE.switchbox(%0) {
    %131 = AIE.amsel<0> (0)
    %132 = AIE.masterset(North : 0, %131)
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %131)
    }
  }
  %2 = AIE.tile(6, 3)
  %3 = AIE.switchbox(%2) {
    %131 = AIE.amsel<0> (0)
    %132 = AIE.amsel<0> (1)
    %133 = AIE.amsel<0> (2)
    %134 = AIE.masterset(DMA : 0, %133)
    %135 = AIE.masterset(DMA : 1, %132)
    %136 = AIE.masterset(North : 0, %131)
    AIE.packetrules(South : 0) {
      AIE.rule(29, 1, %131)
      AIE.rule(31, 2, %132)
      AIE.rule(31, 0, %133)
    }
  }
  %4 = AIE.tile(6, 4)
  %5 = AIE.switchbox(%4) {
    %131 = AIE.amsel<0> (0)
    %132 = AIE.amsel<0> (1)
    %133 = AIE.masterset(DMA : 0, %132)
    %134 = AIE.masterset(DMA : 1, %131)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %131)
      AIE.rule(31, 1, %132)
    }
  }
  %6 = AIE.tile(7, 0)
  %7 = AIE.switchbox(%6) {
  }
  %8 = AIE.tile(7, 2)
  %9 = AIE.switchbox(%8) {
    %131 = AIE.amsel<0> (0)
    %132 = AIE.masterset(West : 0, %131)
    %133 = AIE.masterset(North : 0, %131)
    AIE.packetrules(DMA : 1) {
      AIE.rule(30, 2, %131)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(30, 0, %131)
    }
  }
  %10 = AIE.tile(7, 3)
  %11 = AIE.switchbox(%10) {
    %131 = AIE.amsel<0> (0)
    %132 = AIE.amsel<0> (1)
    %133 = AIE.amsel<0> (2)
    %134 = AIE.masterset(DMA : 0, %132)
    %135 = AIE.masterset(DMA : 1, %133)
    %136 = AIE.masterset(North : 0, %131)
    AIE.packetrules(South : 0) {
      AIE.rule(29, 1, %131)
      AIE.rule(31, 2, %133)
      AIE.rule(31, 0, %132)
    }
  }
  %12 = AIE.tile(7, 4)
  %13 = AIE.switchbox(%12) {
    %131 = AIE.amsel<0> (0)
    %132 = AIE.amsel<0> (1)
    %133 = AIE.masterset(DMA : 0, %132)
    %134 = AIE.masterset(DMA : 1, %131)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %131)
      AIE.rule(31, 1, %132)
    }
  }
  %14 = AIE.buffer(%8) {address = 4096 : i32, sym_name = "buf72_0"} : memref<1024xi32>
  %15 = AIE.buffer(%8) {address = 8192 : i32, sym_name = "buf72_1"} : memref<1024xi32>
  %16 = AIE.buffer(%8) {address = 12288 : i32, sym_name = "buf72_2"} : memref<1024xi32>
  %17 = AIE.buffer(%8) {address = 16384 : i32, sym_name = "buf72_3"} : memref<1024xi32>
  %18 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "buf63_0"} : memref<1024xi32>
  %19 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "buf63_1"} : memref<1024xi32>
  %20 = AIE.buffer(%2) {address = 12288 : i32, sym_name = "buf63_2"} : memref<1024xi32>
  %21 = AIE.buffer(%2) {address = 16384 : i32, sym_name = "buf63_3"} : memref<1024xi32>
  %22 = AIE.buffer(%4) {address = 4096 : i32, sym_name = "buf64_0"} : memref<1024xi32>
  %23 = AIE.buffer(%4) {address = 8192 : i32, sym_name = "buf64_1"} : memref<1024xi32>
  %24 = AIE.buffer(%4) {address = 12288 : i32, sym_name = "buf64_2"} : memref<1024xi32>
  %25 = AIE.buffer(%10) {address = 4096 : i32, sym_name = "buf73_0"} : memref<1024xi32>
  %26 = AIE.buffer(%10) {address = 8192 : i32, sym_name = "buf73_1"} : memref<1024xi32>
  %27 = AIE.buffer(%10) {address = 12288 : i32, sym_name = "buf73_2"} : memref<1024xi32>
  %28 = AIE.buffer(%10) {address = 16384 : i32, sym_name = "buf73_3"} : memref<1024xi32>
  %29 = AIE.buffer(%12) {address = 4096 : i32, sym_name = "buf74_0"} : memref<1024xi32>
  %30 = AIE.buffer(%12) {address = 8192 : i32, sym_name = "buf74_1"} : memref<1024xi32>
  %31 = AIE.buffer(%12) {address = 12288 : i32, sym_name = "buf74_2"} : memref<1024xi32>
  %32 = AIE.mem(%8) {
    %131 = AIE.lock(%8, 4)
    %132 = AIE.lock(%8, 5)
    %133 = AIE.lock(%8, 6)
    %134 = AIE.lock(%8, 7)
    %135 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %136 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%131, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%14 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%131, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%132, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%15 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%132, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%133, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%16 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%133, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%134, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%17 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%134, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
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
    AIE.dmaBd(<%18 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%34, Acquire, 0)
    AIE.dmaBd(<%19 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%34, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %36 = AIE.lock(%4, 0)
  %37 = AIE.lock(%4, 1)
  %38 = AIE.mem(%4) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%36, Acquire, 0)
    AIE.dmaBd(<%22 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%36, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%37, Acquire, 0)
    AIE.dmaBd(<%23 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%37, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %39 = AIE.lock(%2, 3)
  %40 = AIE.core(%2) {
    AIE.useLock(%33, Acquire, 1)
    AIE.useLock(%34, Acquire, 1)
    AIE.useLock(%39, Acquire, 0)
    call @extern_kernel(%18, %19, %20, %21) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%39, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %41 = AIE.lock(%4, 2)
  %42 = AIE.core(%4) {
    AIE.useLock(%39, Acquire, 1)
    AIE.useLock(%36, Acquire, 1)
    AIE.useLock(%37, Acquire, 1)
    AIE.useLock(%41, Acquire, 0)
    call @extern_kernel(%22, %23, %21, %24) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%41, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %43 = AIE.lock(%10, 0)
  %44 = AIE.lock(%10, 1)
  %45 = AIE.mem(%10) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%43, Acquire, 0)
    AIE.dmaBd(<%25 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%44, Acquire, 0)
    AIE.dmaBd(<%26 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %46 = AIE.lock(%12, 0)
  %47 = AIE.lock(%12, 1)
  %48 = AIE.mem(%12) {
    %131 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %132 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%46, Acquire, 0)
    AIE.dmaBd(<%29 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%47, Acquire, 0)
    AIE.dmaBd(<%30 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %49 = AIE.lock(%10, 2)
  %50 = AIE.core(%10) {
    AIE.useLock(%43, Acquire, 1)
    AIE.useLock(%44, Acquire, 1)
    AIE.useLock(%49, Acquire, 0)
    call @extern_kernel(%25, %26, %27, %28) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%49, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %51 = AIE.lock(%12, 2)
  %52 = AIE.core(%12) {
    AIE.useLock(%49, Acquire, 1)
    AIE.useLock(%46, Acquire, 1)
    AIE.useLock(%47, Acquire, 1)
    AIE.useLock(%51, Acquire, 0)
    call @extern_kernel(%29, %30, %28, %31) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%51, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %53 = AIE.tile(0, 0)
  %54 = AIE.tile(0, 1)
  %55 = AIE.tile(0, 2)
  %56 = AIE.tile(0, 3)
  %57 = AIE.tile(0, 4)
  %58 = AIE.tile(1, 0)
  %59 = AIE.tile(1, 1)
  %60 = AIE.tile(1, 2)
  %61 = AIE.tile(1, 3)
  %62 = AIE.tile(1, 4)
  %63 = AIE.tile(2, 0)
  %64 = AIE.tile(2, 1)
  %65 = AIE.tile(2, 2)
  %66 = AIE.tile(2, 3)
  %67 = AIE.tile(2, 4)
  %68 = AIE.tile(3, 0)
  %69 = AIE.tile(3, 1)
  %70 = AIE.tile(3, 2)
  %71 = AIE.tile(3, 3)
  %72 = AIE.tile(3, 4)
  %73 = AIE.tile(4, 0)
  %74 = AIE.tile(4, 1)
  %75 = AIE.tile(4, 2)
  %76 = AIE.tile(4, 3)
  %77 = AIE.tile(4, 4)
  %78 = AIE.tile(5, 0)
  %79 = AIE.tile(5, 1)
  %80 = AIE.tile(5, 2)
  %81 = AIE.tile(5, 3)
  %82 = AIE.tile(5, 4)
  %83 = AIE.tile(6, 0)
  %84 = AIE.tile(6, 1)
  %85 = AIE.tile(7, 1)
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
  %117 = AIE.switchbox(%84) {
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
  AIE.wire(%54 : Core, %87 : Core)
  AIE.wire(%54 : DMA, %87 : DMA)
  AIE.wire(%86 : North, %87 : South)
  AIE.wire(%55 : Core, %88 : Core)
  AIE.wire(%55 : DMA, %88 : DMA)
  AIE.wire(%87 : North, %88 : South)
  AIE.wire(%56 : Core, %89 : Core)
  AIE.wire(%56 : DMA, %89 : DMA)
  AIE.wire(%88 : North, %89 : South)
  AIE.wire(%57 : Core, %90 : Core)
  AIE.wire(%57 : DMA, %90 : DMA)
  AIE.wire(%89 : North, %90 : South)
  AIE.wire(%86 : East, %91 : West)
  AIE.wire(%120 : North, %91 : South)
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
  AIE.wire(%62 : Core, %95 : Core)
  AIE.wire(%62 : DMA, %95 : DMA)
  AIE.wire(%94 : North, %95 : South)
  AIE.wire(%91 : East, %96 : West)
  %127 = AIE.shimmux(%63) {
  }
  AIE.wire(%127 : North, %96 : South)
  AIE.wire(%121 : North, %127 : South)
  AIE.wire(%63 : DMA, %127 : DMA)
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
  AIE.wire(%67 : Core, %100 : Core)
  AIE.wire(%67 : DMA, %100 : DMA)
  AIE.wire(%99 : North, %100 : South)
  AIE.wire(%96 : East, %101 : West)
  %128 = AIE.shimmux(%68) {
  }
  AIE.wire(%128 : North, %101 : South)
  AIE.wire(%122 : North, %128 : South)
  AIE.wire(%68 : DMA, %128 : DMA)
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
  AIE.wire(%72 : Core, %105 : Core)
  AIE.wire(%72 : DMA, %105 : DMA)
  AIE.wire(%104 : North, %105 : South)
  AIE.wire(%101 : East, %106 : West)
  AIE.wire(%123 : North, %106 : South)
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
  AIE.wire(%77 : Core, %110 : Core)
  AIE.wire(%77 : DMA, %110 : DMA)
  AIE.wire(%109 : North, %110 : South)
  AIE.wire(%106 : East, %111 : West)
  AIE.wire(%124 : North, %111 : South)
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
  AIE.wire(%82 : Core, %115 : Core)
  AIE.wire(%82 : DMA, %115 : DMA)
  AIE.wire(%114 : North, %115 : South)
  AIE.wire(%111 : East, %116 : West)
  %129 = AIE.shimmux(%83) {
  }
  AIE.wire(%129 : North, %116 : South)
  AIE.wire(%125 : North, %129 : South)
  AIE.wire(%83 : DMA, %129 : DMA)
  AIE.wire(%112 : East, %117 : West)
  AIE.wire(%84 : Core, %117 : Core)
  AIE.wire(%84 : DMA, %117 : DMA)
  AIE.wire(%116 : North, %117 : South)
  AIE.wire(%113 : East, %1 : West)
  AIE.wire(%0 : Core, %1 : Core)
  AIE.wire(%0 : DMA, %1 : DMA)
  AIE.wire(%117 : North, %1 : South)
  AIE.wire(%114 : East, %3 : West)
  AIE.wire(%2 : Core, %3 : Core)
  AIE.wire(%2 : DMA, %3 : DMA)
  AIE.wire(%1 : North, %3 : South)
  AIE.wire(%115 : East, %5 : West)
  AIE.wire(%4 : Core, %5 : Core)
  AIE.wire(%4 : DMA, %5 : DMA)
  AIE.wire(%3 : North, %5 : South)
  AIE.wire(%116 : East, %7 : West)
  %130 = AIE.shimmux(%6) {
  }
  AIE.wire(%130 : North, %7 : South)
  AIE.wire(%126 : North, %130 : South)
  AIE.wire(%6 : DMA, %130 : DMA)
  AIE.wire(%117 : East, %118 : West)
  AIE.wire(%85 : Core, %118 : Core)
  AIE.wire(%85 : DMA, %118 : DMA)
  AIE.wire(%7 : North, %118 : South)
  AIE.wire(%1 : East, %9 : West)
  AIE.wire(%8 : Core, %9 : Core)
  AIE.wire(%8 : DMA, %9 : DMA)
  AIE.wire(%118 : North, %9 : South)
  AIE.wire(%3 : East, %11 : West)
  AIE.wire(%10 : Core, %11 : Core)
  AIE.wire(%10 : DMA, %11 : DMA)
  AIE.wire(%9 : North, %11 : South)
  AIE.wire(%5 : East, %13 : West)
  AIE.wire(%12 : Core, %13 : Core)
  AIE.wire(%12 : DMA, %13 : DMA)
  AIE.wire(%11 : North, %13 : South)
}

