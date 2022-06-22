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
    %102 = AIE.lock(%1, 4)
    %103 = AIE.lock(%1, 5)
    %104 = AIE.lock(%1, 6)
    %105 = AIE.lock(%1, 7)
    %106 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %107 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%102, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%4 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%102, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%103, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%5 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%103, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%104, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%6 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%104, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%105, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%7 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%105, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %17 = AIE.switchbox(%2) {
    %102 = AIE.amsel<0> (0)
    %103 = AIE.amsel<1> (0)
    %104 = AIE.amsel<2> (0)
    %105 = AIE.amsel<3> (0)
    %106 = AIE.masterset(DMA : 0, %102)
    %107 = AIE.masterset(North : 0, %103)
    %108 = AIE.masterset(DMA : 1, %104)
    %109 = AIE.masterset(North : 1, %105)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %102)
      AIE.rule(31, 1, %103)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %104)
      AIE.rule(31, 3, %105)
    }
  }
  %18 = AIE.switchbox(%3) {
    %102 = AIE.amsel<0> (0)
    %103 = AIE.amsel<1> (0)
    %104 = AIE.masterset(DMA : 0, %102)
    %105 = AIE.masterset(DMA : 1, %103)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %102)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %103)
    }
  }
  %19 = AIE.lock(%2, 0)
  %20 = AIE.lock(%2, 1)
  %21 = AIE.mem(%2) {
    %102 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %103 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %102 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %103 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
  %29 = AIE.tile(0, 0)
  %30 = AIE.tile(0, 1)
  %31 = AIE.tile(0, 2)
  %32 = AIE.tile(0, 3)
  %33 = AIE.tile(0, 4)
  %34 = AIE.tile(1, 0)
  %35 = AIE.tile(1, 1)
  %36 = AIE.tile(1, 2)
  %37 = AIE.tile(1, 3)
  %38 = AIE.tile(1, 4)
  %39 = AIE.tile(2, 0)
  %40 = AIE.tile(2, 1)
  %41 = AIE.tile(2, 2)
  %42 = AIE.tile(2, 3)
  %43 = AIE.tile(2, 4)
  %44 = AIE.tile(3, 0)
  %45 = AIE.tile(3, 1)
  %46 = AIE.tile(3, 2)
  %47 = AIE.tile(3, 3)
  %48 = AIE.tile(3, 4)
  %49 = AIE.tile(4, 0)
  %50 = AIE.tile(4, 1)
  %51 = AIE.tile(4, 2)
  %52 = AIE.tile(4, 3)
  %53 = AIE.tile(4, 4)
  %54 = AIE.tile(5, 0)
  %55 = AIE.tile(5, 1)
  %56 = AIE.tile(5, 2)
  %57 = AIE.tile(5, 3)
  %58 = AIE.tile(5, 4)
  %59 = AIE.tile(6, 1)
  %60 = AIE.switchbox(%29) {
  }
  %61 = AIE.switchbox(%30) {
  }
  %62 = AIE.switchbox(%31) {
  }
  %63 = AIE.switchbox(%32) {
  }
  %64 = AIE.switchbox(%33) {
  }
  %65 = AIE.switchbox(%34) {
  }
  %66 = AIE.switchbox(%35) {
  }
  %67 = AIE.switchbox(%36) {
  }
  %68 = AIE.switchbox(%37) {
  }
  %69 = AIE.switchbox(%38) {
  }
  %70 = AIE.switchbox(%39) {
  }
  %71 = AIE.switchbox(%40) {
  }
  %72 = AIE.switchbox(%41) {
  }
  %73 = AIE.switchbox(%42) {
  }
  %74 = AIE.switchbox(%43) {
  }
  %75 = AIE.switchbox(%44) {
  }
  %76 = AIE.switchbox(%45) {
  }
  %77 = AIE.switchbox(%46) {
  }
  %78 = AIE.switchbox(%47) {
  }
  %79 = AIE.switchbox(%48) {
  }
  %80 = AIE.switchbox(%49) {
  }
  %81 = AIE.switchbox(%50) {
  }
  %82 = AIE.switchbox(%51) {
  }
  %83 = AIE.switchbox(%52) {
  }
  %84 = AIE.switchbox(%53) {
  }
  %85 = AIE.switchbox(%54) {
  }
  %86 = AIE.switchbox(%55) {
  }
  %87 = AIE.switchbox(%56) {
  }
  %88 = AIE.switchbox(%57) {
  }
  %89 = AIE.switchbox(%58) {
  }
  %90 = AIE.switchbox(%0) {
  }
  %91 = AIE.switchbox(%59) {
  }
  %92 = AIE.plio(0)
  %93 = AIE.plio(1)
  %94 = AIE.plio(2)
  %95 = AIE.plio(3)
  %96 = AIE.plio(4)
  %97 = AIE.plio(5)
  %98 = AIE.plio(6)
  AIE.wire(%30 : Core, %61 : Core)
  AIE.wire(%30 : DMA, %61 : DMA)
  AIE.wire(%60 : North, %61 : South)
  AIE.wire(%31 : Core, %62 : Core)
  AIE.wire(%31 : DMA, %62 : DMA)
  AIE.wire(%61 : North, %62 : South)
  AIE.wire(%32 : Core, %63 : Core)
  AIE.wire(%32 : DMA, %63 : DMA)
  AIE.wire(%62 : North, %63 : South)
  AIE.wire(%33 : Core, %64 : Core)
  AIE.wire(%33 : DMA, %64 : DMA)
  AIE.wire(%63 : North, %64 : South)
  AIE.wire(%60 : East, %65 : West)
  AIE.wire(%93 : North, %65 : South)
  AIE.wire(%61 : East, %66 : West)
  AIE.wire(%35 : Core, %66 : Core)
  AIE.wire(%35 : DMA, %66 : DMA)
  AIE.wire(%65 : North, %66 : South)
  AIE.wire(%62 : East, %67 : West)
  AIE.wire(%36 : Core, %67 : Core)
  AIE.wire(%36 : DMA, %67 : DMA)
  AIE.wire(%66 : North, %67 : South)
  AIE.wire(%63 : East, %68 : West)
  AIE.wire(%37 : Core, %68 : Core)
  AIE.wire(%37 : DMA, %68 : DMA)
  AIE.wire(%67 : North, %68 : South)
  AIE.wire(%64 : East, %69 : West)
  AIE.wire(%38 : Core, %69 : Core)
  AIE.wire(%38 : DMA, %69 : DMA)
  AIE.wire(%68 : North, %69 : South)
  AIE.wire(%65 : East, %70 : West)
  %99 = AIE.shimmux(%39) {
  }
  AIE.wire(%99 : North, %70 : South)
  AIE.wire(%94 : North, %99 : South)
  AIE.wire(%39 : DMA, %99 : DMA)
  AIE.wire(%66 : East, %71 : West)
  AIE.wire(%40 : Core, %71 : Core)
  AIE.wire(%40 : DMA, %71 : DMA)
  AIE.wire(%70 : North, %71 : South)
  AIE.wire(%67 : East, %72 : West)
  AIE.wire(%41 : Core, %72 : Core)
  AIE.wire(%41 : DMA, %72 : DMA)
  AIE.wire(%71 : North, %72 : South)
  AIE.wire(%68 : East, %73 : West)
  AIE.wire(%42 : Core, %73 : Core)
  AIE.wire(%42 : DMA, %73 : DMA)
  AIE.wire(%72 : North, %73 : South)
  AIE.wire(%69 : East, %74 : West)
  AIE.wire(%43 : Core, %74 : Core)
  AIE.wire(%43 : DMA, %74 : DMA)
  AIE.wire(%73 : North, %74 : South)
  AIE.wire(%70 : East, %75 : West)
  %100 = AIE.shimmux(%44) {
  }
  AIE.wire(%100 : North, %75 : South)
  AIE.wire(%95 : North, %100 : South)
  AIE.wire(%44 : DMA, %100 : DMA)
  AIE.wire(%71 : East, %76 : West)
  AIE.wire(%45 : Core, %76 : Core)
  AIE.wire(%45 : DMA, %76 : DMA)
  AIE.wire(%75 : North, %76 : South)
  AIE.wire(%72 : East, %77 : West)
  AIE.wire(%46 : Core, %77 : Core)
  AIE.wire(%46 : DMA, %77 : DMA)
  AIE.wire(%76 : North, %77 : South)
  AIE.wire(%73 : East, %78 : West)
  AIE.wire(%47 : Core, %78 : Core)
  AIE.wire(%47 : DMA, %78 : DMA)
  AIE.wire(%77 : North, %78 : South)
  AIE.wire(%74 : East, %79 : West)
  AIE.wire(%48 : Core, %79 : Core)
  AIE.wire(%48 : DMA, %79 : DMA)
  AIE.wire(%78 : North, %79 : South)
  AIE.wire(%75 : East, %80 : West)
  AIE.wire(%96 : North, %80 : South)
  AIE.wire(%76 : East, %81 : West)
  AIE.wire(%50 : Core, %81 : Core)
  AIE.wire(%50 : DMA, %81 : DMA)
  AIE.wire(%80 : North, %81 : South)
  AIE.wire(%77 : East, %82 : West)
  AIE.wire(%51 : Core, %82 : Core)
  AIE.wire(%51 : DMA, %82 : DMA)
  AIE.wire(%81 : North, %82 : South)
  AIE.wire(%78 : East, %83 : West)
  AIE.wire(%52 : Core, %83 : Core)
  AIE.wire(%52 : DMA, %83 : DMA)
  AIE.wire(%82 : North, %83 : South)
  AIE.wire(%79 : East, %84 : West)
  AIE.wire(%53 : Core, %84 : Core)
  AIE.wire(%53 : DMA, %84 : DMA)
  AIE.wire(%83 : North, %84 : South)
  AIE.wire(%80 : East, %85 : West)
  AIE.wire(%97 : North, %85 : South)
  AIE.wire(%81 : East, %86 : West)
  AIE.wire(%55 : Core, %86 : Core)
  AIE.wire(%55 : DMA, %86 : DMA)
  AIE.wire(%85 : North, %86 : South)
  AIE.wire(%82 : East, %87 : West)
  AIE.wire(%56 : Core, %87 : Core)
  AIE.wire(%56 : DMA, %87 : DMA)
  AIE.wire(%86 : North, %87 : South)
  AIE.wire(%83 : East, %88 : West)
  AIE.wire(%57 : Core, %88 : Core)
  AIE.wire(%57 : DMA, %88 : DMA)
  AIE.wire(%87 : North, %88 : South)
  AIE.wire(%84 : East, %89 : West)
  AIE.wire(%58 : Core, %89 : Core)
  AIE.wire(%58 : DMA, %89 : DMA)
  AIE.wire(%88 : North, %89 : South)
  AIE.wire(%85 : East, %90 : West)
  %101 = AIE.shimmux(%0) {
  }
  AIE.wire(%101 : North, %90 : South)
  AIE.wire(%98 : North, %101 : South)
  AIE.wire(%0 : DMA, %101 : DMA)
  AIE.wire(%86 : East, %91 : West)
  AIE.wire(%59 : Core, %91 : Core)
  AIE.wire(%59 : DMA, %91 : DMA)
  AIE.wire(%90 : North, %91 : South)
  AIE.wire(%87 : East, %15 : West)
  AIE.wire(%1 : Core, %15 : Core)
  AIE.wire(%1 : DMA, %15 : DMA)
  AIE.wire(%91 : North, %15 : South)
  AIE.wire(%88 : East, %17 : West)
  AIE.wire(%2 : Core, %17 : Core)
  AIE.wire(%2 : DMA, %17 : DMA)
  AIE.wire(%15 : North, %17 : South)
  AIE.wire(%89 : East, %18 : West)
  AIE.wire(%3 : Core, %18 : Core)
  AIE.wire(%3 : DMA, %18 : DMA)
  AIE.wire(%17 : North, %18 : South)
}

