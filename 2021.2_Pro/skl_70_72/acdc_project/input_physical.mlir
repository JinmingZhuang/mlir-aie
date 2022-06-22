module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.tile(7, 2)
  %2 = AIE.tile(7, 3)
  %3 = AIE.external_buffer 2203318239232 : memref<1024xi32>
  %4 = AIE.external_buffer 2203318247424 : memref<1024xi32>
  %5 = AIE.shimDMA(%0) {
    %88 = AIE.lock(%0, 1)
    %89 = AIE.lock(%0, 2)
    %90 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %91 = AIE.dmaStart(MM2S1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%88, Acquire, 1)
    AIE.dmaBd(<%3 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%88, Release, 0)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%89, Acquire, 1)
    AIE.dmaBd(<%4 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%89, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %6 = AIE.buffer(%1) {address = 4096 : i32, sym_name = "a"} : memref<1024xi32>
  %7 = AIE.buffer(%1) {address = 8192 : i32, sym_name = "b"} : memref<1024xi32>
  %8 = AIE.buffer(%2) {address = 4096 : i32, sym_name = "acc"} : memref<1024xi32>
  %9 = AIE.buffer(%2) {address = 8192 : i32, sym_name = "c"} : memref<1024xi32>
  %10 = AIE.lock(%1, 0)
  %11 = AIE.lock(%1, 1)
  %12 = AIE.lock(%2, 0)
  %13 = AIE.mem(%1) {
    %88 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %89 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%10, Acquire, 0)
    AIE.dmaBd(<%6 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%10, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%11, Acquire, 0)
    AIE.dmaBd(<%7 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%11, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %14 = AIE.core(%1) {
    AIE.useLock(%10, Acquire, 1)
    AIE.useLock(%11, Acquire, 1)
    AIE.useLock(%12, Acquire, 0)
    call @extern_kernel(%6, %7, %8, %9) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%12, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %15 = AIE.tile(0, 0)
  %16 = AIE.tile(0, 1)
  %17 = AIE.tile(0, 2)
  %18 = AIE.tile(0, 3)
  %19 = AIE.tile(1, 0)
  %20 = AIE.tile(1, 1)
  %21 = AIE.tile(1, 2)
  %22 = AIE.tile(1, 3)
  %23 = AIE.tile(2, 0)
  %24 = AIE.tile(2, 1)
  %25 = AIE.tile(2, 2)
  %26 = AIE.tile(2, 3)
  %27 = AIE.tile(3, 0)
  %28 = AIE.tile(3, 1)
  %29 = AIE.tile(3, 2)
  %30 = AIE.tile(3, 3)
  %31 = AIE.tile(4, 0)
  %32 = AIE.tile(4, 1)
  %33 = AIE.tile(4, 2)
  %34 = AIE.tile(4, 3)
  %35 = AIE.tile(5, 0)
  %36 = AIE.tile(5, 1)
  %37 = AIE.tile(5, 2)
  %38 = AIE.tile(5, 3)
  %39 = AIE.tile(6, 0)
  %40 = AIE.tile(6, 1)
  %41 = AIE.tile(6, 2)
  %42 = AIE.tile(6, 3)
  %43 = AIE.tile(7, 1)
  %44 = AIE.switchbox(%15) {
  }
  %45 = AIE.switchbox(%16) {
  }
  %46 = AIE.switchbox(%17) {
  }
  %47 = AIE.switchbox(%18) {
  }
  %48 = AIE.switchbox(%19) {
  }
  %49 = AIE.switchbox(%20) {
  }
  %50 = AIE.switchbox(%21) {
  }
  %51 = AIE.switchbox(%22) {
  }
  %52 = AIE.switchbox(%23) {
  }
  %53 = AIE.switchbox(%24) {
  }
  %54 = AIE.switchbox(%25) {
  }
  %55 = AIE.switchbox(%26) {
  }
  %56 = AIE.switchbox(%27) {
  }
  %57 = AIE.switchbox(%28) {
  }
  %58 = AIE.switchbox(%29) {
  }
  %59 = AIE.switchbox(%30) {
  }
  %60 = AIE.switchbox(%31) {
  }
  %61 = AIE.switchbox(%32) {
  }
  %62 = AIE.switchbox(%33) {
  }
  %63 = AIE.switchbox(%34) {
  }
  %64 = AIE.switchbox(%35) {
  }
  %65 = AIE.switchbox(%36) {
  }
  %66 = AIE.switchbox(%37) {
  }
  %67 = AIE.switchbox(%38) {
  }
  %68 = AIE.switchbox(%39) {
  }
  %69 = AIE.switchbox(%40) {
  }
  %70 = AIE.switchbox(%41) {
  }
  %71 = AIE.switchbox(%42) {
  }
  %72 = AIE.switchbox(%0) {
    AIE.connect<South : 3, North : 0>
    AIE.connect<South : 7, North : 1>
  }
  %73 = AIE.switchbox(%43) {
    AIE.connect<South : 0, North : 0>
    AIE.connect<South : 1, North : 1>
  }
  %74 = AIE.switchbox(%1) {
    AIE.connect<South : 0, DMA : 0>
    AIE.connect<South : 1, DMA : 1>
  }
  %75 = AIE.switchbox(%2) {
  }
  %76 = AIE.plio(0)
  %77 = AIE.plio(1)
  %78 = AIE.plio(2)
  %79 = AIE.plio(3)
  %80 = AIE.plio(4)
  %81 = AIE.plio(5)
  %82 = AIE.plio(6)
  %83 = AIE.plio(7)
  AIE.wire(%16 : Core, %45 : Core)
  AIE.wire(%16 : DMA, %45 : DMA)
  AIE.wire(%44 : North, %45 : South)
  AIE.wire(%17 : Core, %46 : Core)
  AIE.wire(%17 : DMA, %46 : DMA)
  AIE.wire(%45 : North, %46 : South)
  AIE.wire(%18 : Core, %47 : Core)
  AIE.wire(%18 : DMA, %47 : DMA)
  AIE.wire(%46 : North, %47 : South)
  AIE.wire(%44 : East, %48 : West)
  AIE.wire(%77 : North, %48 : South)
  AIE.wire(%45 : East, %49 : West)
  AIE.wire(%20 : Core, %49 : Core)
  AIE.wire(%20 : DMA, %49 : DMA)
  AIE.wire(%48 : North, %49 : South)
  AIE.wire(%46 : East, %50 : West)
  AIE.wire(%21 : Core, %50 : Core)
  AIE.wire(%21 : DMA, %50 : DMA)
  AIE.wire(%49 : North, %50 : South)
  AIE.wire(%47 : East, %51 : West)
  AIE.wire(%22 : Core, %51 : Core)
  AIE.wire(%22 : DMA, %51 : DMA)
  AIE.wire(%50 : North, %51 : South)
  AIE.wire(%48 : East, %52 : West)
  %84 = AIE.shimmux(%23) {
  }
  AIE.wire(%84 : North, %52 : South)
  AIE.wire(%78 : North, %84 : South)
  AIE.wire(%23 : DMA, %84 : DMA)
  AIE.wire(%49 : East, %53 : West)
  AIE.wire(%24 : Core, %53 : Core)
  AIE.wire(%24 : DMA, %53 : DMA)
  AIE.wire(%52 : North, %53 : South)
  AIE.wire(%50 : East, %54 : West)
  AIE.wire(%25 : Core, %54 : Core)
  AIE.wire(%25 : DMA, %54 : DMA)
  AIE.wire(%53 : North, %54 : South)
  AIE.wire(%51 : East, %55 : West)
  AIE.wire(%26 : Core, %55 : Core)
  AIE.wire(%26 : DMA, %55 : DMA)
  AIE.wire(%54 : North, %55 : South)
  AIE.wire(%52 : East, %56 : West)
  %85 = AIE.shimmux(%27) {
  }
  AIE.wire(%85 : North, %56 : South)
  AIE.wire(%79 : North, %85 : South)
  AIE.wire(%27 : DMA, %85 : DMA)
  AIE.wire(%53 : East, %57 : West)
  AIE.wire(%28 : Core, %57 : Core)
  AIE.wire(%28 : DMA, %57 : DMA)
  AIE.wire(%56 : North, %57 : South)
  AIE.wire(%54 : East, %58 : West)
  AIE.wire(%29 : Core, %58 : Core)
  AIE.wire(%29 : DMA, %58 : DMA)
  AIE.wire(%57 : North, %58 : South)
  AIE.wire(%55 : East, %59 : West)
  AIE.wire(%30 : Core, %59 : Core)
  AIE.wire(%30 : DMA, %59 : DMA)
  AIE.wire(%58 : North, %59 : South)
  AIE.wire(%56 : East, %60 : West)
  AIE.wire(%80 : North, %60 : South)
  AIE.wire(%57 : East, %61 : West)
  AIE.wire(%32 : Core, %61 : Core)
  AIE.wire(%32 : DMA, %61 : DMA)
  AIE.wire(%60 : North, %61 : South)
  AIE.wire(%58 : East, %62 : West)
  AIE.wire(%33 : Core, %62 : Core)
  AIE.wire(%33 : DMA, %62 : DMA)
  AIE.wire(%61 : North, %62 : South)
  AIE.wire(%59 : East, %63 : West)
  AIE.wire(%34 : Core, %63 : Core)
  AIE.wire(%34 : DMA, %63 : DMA)
  AIE.wire(%62 : North, %63 : South)
  AIE.wire(%60 : East, %64 : West)
  AIE.wire(%81 : North, %64 : South)
  AIE.wire(%61 : East, %65 : West)
  AIE.wire(%36 : Core, %65 : Core)
  AIE.wire(%36 : DMA, %65 : DMA)
  AIE.wire(%64 : North, %65 : South)
  AIE.wire(%62 : East, %66 : West)
  AIE.wire(%37 : Core, %66 : Core)
  AIE.wire(%37 : DMA, %66 : DMA)
  AIE.wire(%65 : North, %66 : South)
  AIE.wire(%63 : East, %67 : West)
  AIE.wire(%38 : Core, %67 : Core)
  AIE.wire(%38 : DMA, %67 : DMA)
  AIE.wire(%66 : North, %67 : South)
  AIE.wire(%64 : East, %68 : West)
  %86 = AIE.shimmux(%39) {
  }
  AIE.wire(%86 : North, %68 : South)
  AIE.wire(%82 : North, %86 : South)
  AIE.wire(%39 : DMA, %86 : DMA)
  AIE.wire(%65 : East, %69 : West)
  AIE.wire(%40 : Core, %69 : Core)
  AIE.wire(%40 : DMA, %69 : DMA)
  AIE.wire(%68 : North, %69 : South)
  AIE.wire(%66 : East, %70 : West)
  AIE.wire(%41 : Core, %70 : Core)
  AIE.wire(%41 : DMA, %70 : DMA)
  AIE.wire(%69 : North, %70 : South)
  AIE.wire(%67 : East, %71 : West)
  AIE.wire(%42 : Core, %71 : Core)
  AIE.wire(%42 : DMA, %71 : DMA)
  AIE.wire(%70 : North, %71 : South)
  AIE.wire(%68 : East, %72 : West)
  %87 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  AIE.wire(%87 : North, %72 : South)
  AIE.wire(%83 : North, %87 : South)
  AIE.wire(%0 : DMA, %87 : DMA)
  AIE.wire(%69 : East, %73 : West)
  AIE.wire(%43 : Core, %73 : Core)
  AIE.wire(%43 : DMA, %73 : DMA)
  AIE.wire(%72 : North, %73 : South)
  AIE.wire(%70 : East, %74 : West)
  AIE.wire(%1 : Core, %74 : Core)
  AIE.wire(%1 : DMA, %74 : DMA)
  AIE.wire(%73 : North, %74 : South)
  AIE.wire(%71 : East, %75 : West)
  AIE.wire(%2 : Core, %75 : Core)
  AIE.wire(%2 : DMA, %75 : DMA)
  AIE.wire(%74 : North, %75 : South)
}

