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
}

