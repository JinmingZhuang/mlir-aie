module @test_single_kernel {
  %0 = AIE.tile(6, 0)
  %1 = AIE.tile(7, 3)
  %2 = AIE.tile(7, 0)
  %3 = AIE.tile(7, 2)
  %4 = AIE.external_buffer 2203318239232 : memref<256xi32>
  %5 = AIE.external_buffer 2203318243328 : memref<256xi32>
  %6 = AIE.external_buffer 2203318247424 : memref<256xi32>
  %7 = AIE.external_buffer 2203318251520 : memref<256xi32>
  %8 = AIE.shimDMA(%2) {
    %93 = AIE.lock(%2, 1)
    %94 = AIE.lock(%2, 2)
    %95 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %96 = AIE.dmaStart(MM2S1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%93, Acquire, 1)
    AIE.dmaBd(<%4 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%93, Release, 0)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%94, Acquire, 1)
    AIE.dmaBd(<%5 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%94, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %9 = AIE.shimDMA(%0) {
    %93 = AIE.lock(%0, 1)
    %94 = AIE.lock(%0, 2)
    %95 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %96 = AIE.dmaStart(S2MM0, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%93, Acquire, 1)
    AIE.dmaBd(<%6 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%93, Release, 0)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%94, Acquire, 0)
    AIE.dmaBd(<%7 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%94, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %10 = AIE.buffer(%3) {address = 4096 : i32, sym_name = "a"} : memref<256xi32>
  %11 = AIE.buffer(%3) {address = 5120 : i32, sym_name = "b"} : memref<256xi32>
  %12 = AIE.buffer(%1) {address = 4096 : i32, sym_name = "acc"} : memref<256xi32>
  %13 = AIE.buffer(%1) {address = 5120 : i32, sym_name = "c"} : memref<256xi32>
  %14 = AIE.lock(%3, 2)
  %15 = AIE.lock(%3, 3)
  %16 = AIE.lock(%1, 2)
  %17 = AIE.lock(%1, 3)
  %18 = AIE.mem(%3) {
    %93 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %94 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%14, Acquire, 0)
    AIE.dmaBd(<%10 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%14, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%15, Acquire, 0)
    AIE.dmaBd(<%11 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%15, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %19 = AIE.mem(%1) {
    %93 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %94 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%16, Acquire, 0)
    AIE.dmaBd(<%12 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%16, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%17, Acquire, 1)
    AIE.dmaBd(<%13 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%17, Release, 0)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<256xi32>, memref<256xi32>, memref<256xi32>, memref<256xi32>)
  %20 = AIE.core(%3) {
    AIE.useLock(%14, Acquire, 1)
    AIE.useLock(%15, Acquire, 1)
    AIE.useLock(%16, Acquire, 1)
    call @extern_kernel(%10, %11, %12, %13) : (memref<256xi32>, memref<256xi32>, memref<256xi32>, memref<256xi32>) -> ()
    AIE.useLock(%14, Release, 0)
    AIE.useLock(%15, Release, 0)
    AIE.useLock(%16, Release, 0)
    AIE.useLock(%17, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %21 = AIE.tile(0, 0)
  %22 = AIE.tile(0, 1)
  %23 = AIE.tile(0, 2)
  %24 = AIE.tile(0, 3)
  %25 = AIE.tile(1, 0)
  %26 = AIE.tile(1, 1)
  %27 = AIE.tile(1, 2)
  %28 = AIE.tile(1, 3)
  %29 = AIE.tile(2, 0)
  %30 = AIE.tile(2, 1)
  %31 = AIE.tile(2, 2)
  %32 = AIE.tile(2, 3)
  %33 = AIE.tile(3, 0)
  %34 = AIE.tile(3, 1)
  %35 = AIE.tile(3, 2)
  %36 = AIE.tile(3, 3)
  %37 = AIE.tile(4, 0)
  %38 = AIE.tile(4, 1)
  %39 = AIE.tile(4, 2)
  %40 = AIE.tile(4, 3)
  %41 = AIE.tile(5, 0)
  %42 = AIE.tile(5, 1)
  %43 = AIE.tile(5, 2)
  %44 = AIE.tile(5, 3)
  %45 = AIE.tile(6, 1)
  %46 = AIE.tile(6, 2)
  %47 = AIE.tile(6, 3)
  %48 = AIE.tile(7, 1)
  %49 = AIE.switchbox(%21) {
  }
  %50 = AIE.switchbox(%22) {
  }
  %51 = AIE.switchbox(%23) {
  }
  %52 = AIE.switchbox(%24) {
  }
  %53 = AIE.switchbox(%25) {
  }
  %54 = AIE.switchbox(%26) {
  }
  %55 = AIE.switchbox(%27) {
  }
  %56 = AIE.switchbox(%28) {
  }
  %57 = AIE.switchbox(%29) {
  }
  %58 = AIE.switchbox(%30) {
  }
  %59 = AIE.switchbox(%31) {
  }
  %60 = AIE.switchbox(%32) {
  }
  %61 = AIE.switchbox(%33) {
  }
  %62 = AIE.switchbox(%34) {
  }
  %63 = AIE.switchbox(%35) {
  }
  %64 = AIE.switchbox(%36) {
  }
  %65 = AIE.switchbox(%37) {
  }
  %66 = AIE.switchbox(%38) {
  }
  %67 = AIE.switchbox(%39) {
  }
  %68 = AIE.switchbox(%40) {
  }
  %69 = AIE.switchbox(%41) {
  }
  %70 = AIE.switchbox(%42) {
  }
  %71 = AIE.switchbox(%43) {
  }
  %72 = AIE.switchbox(%44) {
  }
  %73 = AIE.switchbox(%0) {
    AIE.connect<South : 3, North : 0>
    AIE.connect<East : 0, South : 2>
  }
  %74 = AIE.switchbox(%45) {
    AIE.connect<South : 0, North : 0>
  }
  %75 = AIE.switchbox(%46) {
    AIE.connect<South : 0, North : 0>
  }
  %76 = AIE.switchbox(%47) {
    AIE.connect<South : 0, East : 0>
  }
  %77 = AIE.switchbox(%2) {
    AIE.connect<North : 0, West : 0>
    AIE.connect<South : 3, North : 0>
    AIE.connect<South : 7, North : 1>
  }
  %78 = AIE.switchbox(%48) {
    AIE.connect<North : 0, South : 0>
    AIE.connect<South : 0, North : 0>
    AIE.connect<South : 1, North : 1>
  }
  %79 = AIE.switchbox(%3) {
    AIE.connect<North : 0, South : 0>
    AIE.connect<South : 0, DMA : 0>
    AIE.connect<South : 1, DMA : 1>
  }
  %80 = AIE.switchbox(%1) {
    AIE.connect<West : 0, DMA : 0>
    AIE.connect<DMA : 0, South : 0>
  }
  %81 = AIE.plio(0)
  %82 = AIE.plio(1)
  %83 = AIE.plio(2)
  %84 = AIE.plio(3)
  %85 = AIE.plio(4)
  %86 = AIE.plio(5)
  %87 = AIE.plio(6)
  %88 = AIE.plio(7)
  AIE.wire(%22 : Core, %50 : Core)
  AIE.wire(%22 : DMA, %50 : DMA)
  AIE.wire(%49 : North, %50 : South)
  AIE.wire(%23 : Core, %51 : Core)
  AIE.wire(%23 : DMA, %51 : DMA)
  AIE.wire(%50 : North, %51 : South)
  AIE.wire(%24 : Core, %52 : Core)
  AIE.wire(%24 : DMA, %52 : DMA)
  AIE.wire(%51 : North, %52 : South)
  AIE.wire(%49 : East, %53 : West)
  AIE.wire(%82 : North, %53 : South)
  AIE.wire(%50 : East, %54 : West)
  AIE.wire(%26 : Core, %54 : Core)
  AIE.wire(%26 : DMA, %54 : DMA)
  AIE.wire(%53 : North, %54 : South)
  AIE.wire(%51 : East, %55 : West)
  AIE.wire(%27 : Core, %55 : Core)
  AIE.wire(%27 : DMA, %55 : DMA)
  AIE.wire(%54 : North, %55 : South)
  AIE.wire(%52 : East, %56 : West)
  AIE.wire(%28 : Core, %56 : Core)
  AIE.wire(%28 : DMA, %56 : DMA)
  AIE.wire(%55 : North, %56 : South)
  AIE.wire(%53 : East, %57 : West)
  %89 = AIE.shimmux(%29) {
  }
  AIE.wire(%89 : North, %57 : South)
  AIE.wire(%83 : North, %89 : South)
  AIE.wire(%29 : DMA, %89 : DMA)
  AIE.wire(%54 : East, %58 : West)
  AIE.wire(%30 : Core, %58 : Core)
  AIE.wire(%30 : DMA, %58 : DMA)
  AIE.wire(%57 : North, %58 : South)
  AIE.wire(%55 : East, %59 : West)
  AIE.wire(%31 : Core, %59 : Core)
  AIE.wire(%31 : DMA, %59 : DMA)
  AIE.wire(%58 : North, %59 : South)
  AIE.wire(%56 : East, %60 : West)
  AIE.wire(%32 : Core, %60 : Core)
  AIE.wire(%32 : DMA, %60 : DMA)
  AIE.wire(%59 : North, %60 : South)
  AIE.wire(%57 : East, %61 : West)
  %90 = AIE.shimmux(%33) {
  }
  AIE.wire(%90 : North, %61 : South)
  AIE.wire(%84 : North, %90 : South)
  AIE.wire(%33 : DMA, %90 : DMA)
  AIE.wire(%58 : East, %62 : West)
  AIE.wire(%34 : Core, %62 : Core)
  AIE.wire(%34 : DMA, %62 : DMA)
  AIE.wire(%61 : North, %62 : South)
  AIE.wire(%59 : East, %63 : West)
  AIE.wire(%35 : Core, %63 : Core)
  AIE.wire(%35 : DMA, %63 : DMA)
  AIE.wire(%62 : North, %63 : South)
  AIE.wire(%60 : East, %64 : West)
  AIE.wire(%36 : Core, %64 : Core)
  AIE.wire(%36 : DMA, %64 : DMA)
  AIE.wire(%63 : North, %64 : South)
  AIE.wire(%61 : East, %65 : West)
  AIE.wire(%85 : North, %65 : South)
  AIE.wire(%62 : East, %66 : West)
  AIE.wire(%38 : Core, %66 : Core)
  AIE.wire(%38 : DMA, %66 : DMA)
  AIE.wire(%65 : North, %66 : South)
  AIE.wire(%63 : East, %67 : West)
  AIE.wire(%39 : Core, %67 : Core)
  AIE.wire(%39 : DMA, %67 : DMA)
  AIE.wire(%66 : North, %67 : South)
  AIE.wire(%64 : East, %68 : West)
  AIE.wire(%40 : Core, %68 : Core)
  AIE.wire(%40 : DMA, %68 : DMA)
  AIE.wire(%67 : North, %68 : South)
  AIE.wire(%65 : East, %69 : West)
  AIE.wire(%86 : North, %69 : South)
  AIE.wire(%66 : East, %70 : West)
  AIE.wire(%42 : Core, %70 : Core)
  AIE.wire(%42 : DMA, %70 : DMA)
  AIE.wire(%69 : North, %70 : South)
  AIE.wire(%67 : East, %71 : West)
  AIE.wire(%43 : Core, %71 : Core)
  AIE.wire(%43 : DMA, %71 : DMA)
  AIE.wire(%70 : North, %71 : South)
  AIE.wire(%68 : East, %72 : West)
  AIE.wire(%44 : Core, %72 : Core)
  AIE.wire(%44 : DMA, %72 : DMA)
  AIE.wire(%71 : North, %72 : South)
  AIE.wire(%69 : East, %73 : West)
  %91 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<North : 2, DMA : 0>
  }
  AIE.wire(%91 : North, %73 : South)
  AIE.wire(%87 : North, %91 : South)
  AIE.wire(%0 : DMA, %91 : DMA)
  AIE.wire(%70 : East, %74 : West)
  AIE.wire(%45 : Core, %74 : Core)
  AIE.wire(%45 : DMA, %74 : DMA)
  AIE.wire(%73 : North, %74 : South)
  AIE.wire(%71 : East, %75 : West)
  AIE.wire(%46 : Core, %75 : Core)
  AIE.wire(%46 : DMA, %75 : DMA)
  AIE.wire(%74 : North, %75 : South)
  AIE.wire(%72 : East, %76 : West)
  AIE.wire(%47 : Core, %76 : Core)
  AIE.wire(%47 : DMA, %76 : DMA)
  AIE.wire(%75 : North, %76 : South)
  AIE.wire(%73 : East, %77 : West)
  %92 = AIE.shimmux(%2) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  AIE.wire(%92 : North, %77 : South)
  AIE.wire(%88 : North, %92 : South)
  AIE.wire(%2 : DMA, %92 : DMA)
  AIE.wire(%74 : East, %78 : West)
  AIE.wire(%48 : Core, %78 : Core)
  AIE.wire(%48 : DMA, %78 : DMA)
  AIE.wire(%77 : North, %78 : South)
  AIE.wire(%75 : East, %79 : West)
  AIE.wire(%3 : Core, %79 : Core)
  AIE.wire(%3 : DMA, %79 : DMA)
  AIE.wire(%78 : North, %79 : South)
  AIE.wire(%76 : East, %80 : West)
  AIE.wire(%1 : Core, %80 : Core)
  AIE.wire(%1 : DMA, %80 : DMA)
  AIE.wire(%79 : North, %80 : South)
}

