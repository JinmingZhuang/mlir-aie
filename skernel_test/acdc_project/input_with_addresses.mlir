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
}

