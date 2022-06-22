module @test_single_kernel {
  %0 = AIE.tile(1, 3)
  %1 = AIE.tile(1, 4)
  %2 = AIE.buffer(%0) {address = 4096 : i32, sym_name = "a"} : memref<1024xi32>
  %3 = AIE.buffer(%0) {address = 8192 : i32, sym_name = "b"} : memref<1024xi32>
  %4 = AIE.buffer(%0) {address = 12288 : i32, sym_name = "acc"} : memref<1024xi32>
  %5 = AIE.buffer(%0) {address = 16384 : i32, sym_name = "c"} : memref<1024xi32>
  %6 = AIE.lock(%0, 0)
  %7 = AIE.lock(%1, 0)
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %8 = AIE.core(%0) {
    AIE.useLock(%6, Acquire, 1)
    AIE.useLock(%7, Acquire, 0)
    call @extern_kernel(%2, %3, %4, %5) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%6, Release, 0)
    AIE.useLock(%7, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %9 = AIE.tile(0, 0)
  %10 = AIE.tile(0, 1)
  %11 = AIE.tile(0, 2)
  %12 = AIE.tile(0, 3)
  %13 = AIE.tile(0, 4)
  %14 = AIE.tile(1, 0)
  %15 = AIE.tile(1, 1)
  %16 = AIE.tile(1, 2)
  %17 = AIE.switchbox(%9) {
  }
  %18 = AIE.switchbox(%10) {
  }
  %19 = AIE.switchbox(%11) {
  }
  %20 = AIE.switchbox(%12) {
  }
  %21 = AIE.switchbox(%13) {
  }
  %22 = AIE.switchbox(%14) {
  }
  %23 = AIE.switchbox(%15) {
  }
  %24 = AIE.switchbox(%16) {
  }
  %25 = AIE.switchbox(%0) {
  }
  %26 = AIE.switchbox(%1) {
  }
  %27 = AIE.plio(0)
  %28 = AIE.plio(1)
  AIE.wire(%10 : Core, %18 : Core)
  AIE.wire(%10 : DMA, %18 : DMA)
  AIE.wire(%17 : North, %18 : South)
  AIE.wire(%11 : Core, %19 : Core)
  AIE.wire(%11 : DMA, %19 : DMA)
  AIE.wire(%18 : North, %19 : South)
  AIE.wire(%12 : Core, %20 : Core)
  AIE.wire(%12 : DMA, %20 : DMA)
  AIE.wire(%19 : North, %20 : South)
  AIE.wire(%13 : Core, %21 : Core)
  AIE.wire(%13 : DMA, %21 : DMA)
  AIE.wire(%20 : North, %21 : South)
  AIE.wire(%17 : East, %22 : West)
  AIE.wire(%28 : North, %22 : South)
  AIE.wire(%18 : East, %23 : West)
  AIE.wire(%15 : Core, %23 : Core)
  AIE.wire(%15 : DMA, %23 : DMA)
  AIE.wire(%22 : North, %23 : South)
  AIE.wire(%19 : East, %24 : West)
  AIE.wire(%16 : Core, %24 : Core)
  AIE.wire(%16 : DMA, %24 : DMA)
  AIE.wire(%23 : North, %24 : South)
  AIE.wire(%20 : East, %25 : West)
  AIE.wire(%0 : Core, %25 : Core)
  AIE.wire(%0 : DMA, %25 : DMA)
  AIE.wire(%24 : North, %25 : South)
  AIE.wire(%21 : East, %26 : West)
  AIE.wire(%1 : Core, %26 : Core)
  AIE.wire(%1 : DMA, %26 : DMA)
  AIE.wire(%25 : North, %26 : South)
}

