module @test_single_kernel attributes {llvm.target_triple = "aie"} {
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
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  memref.global "public" @buf63_0 : memref<1024xi32>
  memref.global "public" @buf63_1 : memref<1024xi32>
  memref.global "public" @buf63_2 : memref<1024xi32>
  memref.global "public" @buf63_3 : memref<1024xi32>
  memref.global "public" @buf64_0 : memref<1024xi32>
  memref.global "public" @buf64_1 : memref<1024xi32>
  memref.global "public" @buf64_2 : memref<1024xi32>
  func @core63() {
    %0 = memref.get_global @buf64_0 : memref<1024xi32>
    memref.assume_alignment %0, 32 : memref<1024xi32>
    %1 = memref.get_global @buf64_1 : memref<1024xi32>
    memref.assume_alignment %1, 32 : memref<1024xi32>
    %2 = memref.get_global @buf64_2 : memref<1024xi32>
    memref.assume_alignment %2, 32 : memref<1024xi32>
    %3 = memref.get_global @buf63_0 : memref<1024xi32>
    memref.assume_alignment %3, 32 : memref<1024xi32>
    %4 = memref.get_global @buf63_1 : memref<1024xi32>
    memref.assume_alignment %4, 32 : memref<1024xi32>
    %5 = memref.get_global @buf63_2 : memref<1024xi32>
    memref.assume_alignment %5, 32 : memref<1024xi32>
    %6 = memref.get_global @buf63_3 : memref<1024xi32>
    memref.assume_alignment %6, 32 : memref<1024xi32>
    %c32 = arith.constant 32 : index
    %c33 = arith.constant 33 : index
    %c34 = arith.constant 34 : index
    %c48 = arith.constant 48 : index
    %c49 = arith.constant 49 : index
    %c51 = arith.constant 51 : index
    %7 = arith.index_cast %c48 : index to i32
    %c1_i32 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%7, %c1_i32) : (i32, i32) -> ()
    %8 = arith.index_cast %c49 : index to i32
    %c1_i32_0 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%8, %c1_i32_0) : (i32, i32) -> ()
    %9 = arith.index_cast %c51 : index to i32
    %c0_i32 = arith.constant 0 : i32
    call @llvm.aie.lock.acquire.reg(%9, %c0_i32) : (i32, i32) -> ()
    call @extern_kernel(%3, %4, %5, %6) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    %10 = arith.index_cast %c51 : index to i32
    %c1_i32_1 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%10, %c1_i32_1) : (i32, i32) -> ()
    return
  }
  func @_main() {
    call @core63() : () -> ()
    return
  }
}

