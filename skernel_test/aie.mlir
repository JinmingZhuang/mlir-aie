module @test_single_kernel {
  %tile13 = AIE.tile(1, 3)
  %tile14 = AIE.tile(1, 4)
  
  
  %buf13_0 = AIE.buffer(%tile13) { sym_name = "a" } : memref<1024xi32>
  %buf13_1 = AIE.buffer(%tile13) { sym_name = "b" } : memref<1024xi32>
  %buf13_2 = AIE.buffer(%tile13) { sym_name = "acc" } : memref<1024xi32>
  %buf14_0 = AIE.buffer(%tile13) { sym_name = "c" } : memref<1024xi32>

  %lock13_0 = AIE.lock(%tile13, 0)
  %tile14_0 = AIE.lock(%tile14, 0)

  func private @extern_kernel(%A: memref<1024xi32>, %B: memref<1024xi32>, %acc: memref<1024xi32>, %C: memref<1024xi32>) -> ()

  %core13 = AIE.core(%tile13) { 
    AIE.useLock(%lock13_0, "Acquire", 1) // acquire for read(e.g. input ping)
    AIE.useLock(%tile14_0, "Acquire", 0) // acquire for write
    call @extern_kernel(%buf13_0, %buf13_1, %buf13_2, %buf14_0) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%lock13_0, "Release", 0) // release for write
    AIE.useLock(%tile14_0, "Release", 1) // release for read
    AIE.end
  } { link_with="kernel.o" }

}