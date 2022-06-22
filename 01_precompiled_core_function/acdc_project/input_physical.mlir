module @test_chesss_01_precompiled_core_function {
  %0 = AIE.tile(1, 3)
  %1 = AIE.buffer(%0) {address = 4096 : i32, sym_name = "a"} : memref<256xi32>
  %2 = AIE.buffer(%0) {address = 5120 : i32, sym_name = "b"} : memref<256xi32>
  %3 = AIE.lock(%0, 3)
  %4 = AIE.lock(%0, 5)
  func private @func(memref<256xi32>, memref<256xi32>)
  %5 = AIE.core(%0) {
    AIE.useLock(%3, Acquire, 1)
    AIE.useLock(%4, Acquire, 0)
    call @func(%1, %2) : (memref<256xi32>, memref<256xi32>) -> ()
    AIE.useLock(%3, Release, 0)
    AIE.useLock(%4, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %6 = AIE.tile(0, 0)
  %7 = AIE.tile(0, 1)
  %8 = AIE.tile(0, 2)
  %9 = AIE.tile(0, 3)
  %10 = AIE.tile(1, 0)
  %11 = AIE.tile(1, 1)
  %12 = AIE.tile(1, 2)
  %13 = AIE.switchbox(%6) {
  }
  %14 = AIE.switchbox(%7) {
  }
  %15 = AIE.switchbox(%8) {
  }
  %16 = AIE.switchbox(%9) {
  }
  %17 = AIE.switchbox(%10) {
  }
  %18 = AIE.switchbox(%11) {
  }
  %19 = AIE.switchbox(%12) {
  }
  %20 = AIE.switchbox(%0) {
  }
  %21 = AIE.plio(0)
  %22 = AIE.plio(1)
  AIE.wire(%7 : Core, %14 : Core)
  AIE.wire(%7 : DMA, %14 : DMA)
  AIE.wire(%13 : North, %14 : South)
  AIE.wire(%8 : Core, %15 : Core)
  AIE.wire(%8 : DMA, %15 : DMA)
  AIE.wire(%14 : North, %15 : South)
  AIE.wire(%9 : Core, %16 : Core)
  AIE.wire(%9 : DMA, %16 : DMA)
  AIE.wire(%15 : North, %16 : South)
  AIE.wire(%13 : East, %17 : West)
  AIE.wire(%22 : North, %17 : South)
  AIE.wire(%14 : East, %18 : West)
  AIE.wire(%11 : Core, %18 : Core)
  AIE.wire(%11 : DMA, %18 : DMA)
  AIE.wire(%17 : North, %18 : South)
  AIE.wire(%15 : East, %19 : West)
  AIE.wire(%12 : Core, %19 : Core)
  AIE.wire(%12 : DMA, %19 : DMA)
  AIE.wire(%18 : North, %19 : South)
  AIE.wire(%16 : East, %20 : West)
  AIE.wire(%0 : Core, %20 : Core)
  AIE.wire(%0 : DMA, %20 : DMA)
  AIE.wire(%19 : North, %20 : South)
}

