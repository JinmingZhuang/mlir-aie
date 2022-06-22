module @test_chesss_01_precompiled_core_function attributes {llvm.target_triple = "aie"} {
  func private @debug_i32(i32)
  func private @llvm.aie.put.ms(i32, i32)
  func private @llvm.aie.put.wms(i32, i128)
  func private @llvm.aie.put.fms(i32, f32)
  func private @llvm.aie.get.ss(i32) -> i32
  func private @llvm.aie.get.wss(i32) -> i128
  func private @llvm.aie.get.fss(i32) -> f32
  func private @llvm.aie.put.mcd(i384)
  func private @llvm.aie.get.scd() -> i384
  func private @llvm.aie.lock.acquire.reg(i32, i32)
  func private @llvm.aie.lock.release.reg(i32, i32)
  func private @func(memref<256xi32>, memref<256xi32>)
  memref.global "public" @a : memref<256xi32>
  memref.global "public" @b : memref<256xi32>
  func @core13() {
    %0 = memref.get_global @a : memref<256xi32>
    memref.assume_alignment %0, 32 : memref<256xi32>
    %1 = memref.get_global @b : memref<256xi32>
    memref.assume_alignment %1, 32 : memref<256xi32>
    %c51 = arith.constant 51 : index
    %c53 = arith.constant 53 : index
    %2 = arith.index_cast %c51 : index to i32
    %c1_i32 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%2, %c1_i32) : (i32, i32) -> ()
    %3 = arith.index_cast %c53 : index to i32
    %c0_i32 = arith.constant 0 : i32
    call @llvm.aie.lock.acquire.reg(%3, %c0_i32) : (i32, i32) -> ()
    call @func(%0, %1) : (memref<256xi32>, memref<256xi32>) -> ()
    %4 = arith.index_cast %c51 : index to i32
    %c0_i32_0 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%4, %c0_i32_0) : (i32, i32) -> ()
    %5 = arith.index_cast %c53 : index to i32
    %c1_i32_1 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%5, %c1_i32_1) : (i32, i32) -> ()
    return
  }
  func @_main() {
    call @core13() : () -> ()
    return
  }
}

