module @test_single_kernel {
  %0 = AIE.tile(7, 0)
  %1 = AIE.tile(7, 1)
  %2 = AIE.tile(7, 2)
  %3 = AIE.external_buffer 2203318239232 : memref<1024xi32>
  %4 = AIE.external_buffer 2203318247424 : memref<1024xi32>
  %5 = AIE.shimDMA(%0) {
    %72 = AIE.lock(%0, 1)
    %73 = AIE.lock(%0, 2)
    %74 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %75 = AIE.dmaStart(MM2S1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%72, Acquire, 1)
    AIE.dmaBd(<%3 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%72, Release, 0)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%73, Acquire, 1)
    AIE.dmaBd(<%4 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%73, Release, 0)
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
    %72 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %73 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
  %18 = AIE.tile(1, 0)
  %19 = AIE.tile(1, 1)
  %20 = AIE.tile(1, 2)
  %21 = AIE.tile(2, 0)
  %22 = AIE.tile(2, 1)
  %23 = AIE.tile(2, 2)
  %24 = AIE.tile(3, 0)
  %25 = AIE.tile(3, 1)
  %26 = AIE.tile(3, 2)
  %27 = AIE.tile(4, 0)
  %28 = AIE.tile(4, 1)
  %29 = AIE.tile(4, 2)
  %30 = AIE.tile(5, 0)
  %31 = AIE.tile(5, 1)
  %32 = AIE.tile(5, 2)
  %33 = AIE.tile(6, 0)
  %34 = AIE.tile(6, 1)
  %35 = AIE.tile(6, 2)
  %36 = AIE.switchbox(%15) {
  }
  %37 = AIE.switchbox(%16) {
  }
  %38 = AIE.switchbox(%17) {
  }
  %39 = AIE.switchbox(%18) {
  }
  %40 = AIE.switchbox(%19) {
  }
  %41 = AIE.switchbox(%20) {
  }
  %42 = AIE.switchbox(%21) {
  }
  %43 = AIE.switchbox(%22) {
  }
  %44 = AIE.switchbox(%23) {
  }
  %45 = AIE.switchbox(%24) {
  }
  %46 = AIE.switchbox(%25) {
  }
  %47 = AIE.switchbox(%26) {
  }
  %48 = AIE.switchbox(%27) {
  }
  %49 = AIE.switchbox(%28) {
  }
  %50 = AIE.switchbox(%29) {
  }
  %51 = AIE.switchbox(%30) {
  }
  %52 = AIE.switchbox(%31) {
  }
  %53 = AIE.switchbox(%32) {
  }
  %54 = AIE.switchbox(%33) {
  }
  %55 = AIE.switchbox(%34) {
  }
  %56 = AIE.switchbox(%35) {
  }
  %57 = AIE.switchbox(%0) {
    AIE.connect<South : 3, North : 0>
    AIE.connect<South : 7, North : 1>
  }
  %58 = AIE.switchbox(%1) {
    AIE.connect<South : 0, DMA : 0>
    AIE.connect<South : 1, DMA : 1>
  }
  %59 = AIE.switchbox(%2) {
  }
  %60 = AIE.plio(0)
  %61 = AIE.plio(1)
  %62 = AIE.plio(2)
  %63 = AIE.plio(3)
  %64 = AIE.plio(4)
  %65 = AIE.plio(5)
  %66 = AIE.plio(6)
  %67 = AIE.plio(7)
  AIE.wire(%16 : Core, %37 : Core)
  AIE.wire(%16 : DMA, %37 : DMA)
  AIE.wire(%36 : North, %37 : South)
  AIE.wire(%17 : Core, %38 : Core)
  AIE.wire(%17 : DMA, %38 : DMA)
  AIE.wire(%37 : North, %38 : South)
  AIE.wire(%36 : East, %39 : West)
  AIE.wire(%61 : North, %39 : South)
  AIE.wire(%37 : East, %40 : West)
  AIE.wire(%19 : Core, %40 : Core)
  AIE.wire(%19 : DMA, %40 : DMA)
  AIE.wire(%39 : North, %40 : South)
  AIE.wire(%38 : East, %41 : West)
  AIE.wire(%20 : Core, %41 : Core)
  AIE.wire(%20 : DMA, %41 : DMA)
  AIE.wire(%40 : North, %41 : South)
  AIE.wire(%39 : East, %42 : West)
  %68 = AIE.shimmux(%21) {
  }
  AIE.wire(%68 : North, %42 : South)
  AIE.wire(%62 : North, %68 : South)
  AIE.wire(%21 : DMA, %68 : DMA)
  AIE.wire(%40 : East, %43 : West)
  AIE.wire(%22 : Core, %43 : Core)
  AIE.wire(%22 : DMA, %43 : DMA)
  AIE.wire(%42 : North, %43 : South)
  AIE.wire(%41 : East, %44 : West)
  AIE.wire(%23 : Core, %44 : Core)
  AIE.wire(%23 : DMA, %44 : DMA)
  AIE.wire(%43 : North, %44 : South)
  AIE.wire(%42 : East, %45 : West)
  %69 = AIE.shimmux(%24) {
  }
  AIE.wire(%69 : North, %45 : South)
  AIE.wire(%63 : North, %69 : South)
  AIE.wire(%24 : DMA, %69 : DMA)
  AIE.wire(%43 : East, %46 : West)
  AIE.wire(%25 : Core, %46 : Core)
  AIE.wire(%25 : DMA, %46 : DMA)
  AIE.wire(%45 : North, %46 : South)
  AIE.wire(%44 : East, %47 : West)
  AIE.wire(%26 : Core, %47 : Core)
  AIE.wire(%26 : DMA, %47 : DMA)
  AIE.wire(%46 : North, %47 : South)
  AIE.wire(%45 : East, %48 : West)
  AIE.wire(%64 : North, %48 : South)
  AIE.wire(%46 : East, %49 : West)
  AIE.wire(%28 : Core, %49 : Core)
  AIE.wire(%28 : DMA, %49 : DMA)
  AIE.wire(%48 : North, %49 : South)
  AIE.wire(%47 : East, %50 : West)
  AIE.wire(%29 : Core, %50 : Core)
  AIE.wire(%29 : DMA, %50 : DMA)
  AIE.wire(%49 : North, %50 : South)
  AIE.wire(%48 : East, %51 : West)
  AIE.wire(%65 : North, %51 : South)
  AIE.wire(%49 : East, %52 : West)
  AIE.wire(%31 : Core, %52 : Core)
  AIE.wire(%31 : DMA, %52 : DMA)
  AIE.wire(%51 : North, %52 : South)
  AIE.wire(%50 : East, %53 : West)
  AIE.wire(%32 : Core, %53 : Core)
  AIE.wire(%32 : DMA, %53 : DMA)
  AIE.wire(%52 : North, %53 : South)
  AIE.wire(%51 : East, %54 : West)
  %70 = AIE.shimmux(%33) {
  }
  AIE.wire(%70 : North, %54 : South)
  AIE.wire(%66 : North, %70 : South)
  AIE.wire(%33 : DMA, %70 : DMA)
  AIE.wire(%52 : East, %55 : West)
  AIE.wire(%34 : Core, %55 : Core)
  AIE.wire(%34 : DMA, %55 : DMA)
  AIE.wire(%54 : North, %55 : South)
  AIE.wire(%53 : East, %56 : West)
  AIE.wire(%35 : Core, %56 : Core)
  AIE.wire(%35 : DMA, %56 : DMA)
  AIE.wire(%55 : North, %56 : South)
  AIE.wire(%54 : East, %57 : West)
  %71 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  AIE.wire(%71 : North, %57 : South)
  AIE.wire(%67 : North, %71 : South)
  AIE.wire(%0 : DMA, %71 : DMA)
  AIE.wire(%55 : East, %58 : West)
  AIE.wire(%1 : Core, %58 : Core)
  AIE.wire(%1 : DMA, %58 : DMA)
  AIE.wire(%57 : North, %58 : South)
  AIE.wire(%56 : East, %59 : West)
  AIE.wire(%2 : Core, %59 : Core)
  AIE.wire(%2 : DMA, %59 : DMA)
  AIE.wire(%58 : North, %59 : South)
}

