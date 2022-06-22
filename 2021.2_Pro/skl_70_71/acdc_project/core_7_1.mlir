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
  memref.global "public" @acc : memref<1024xi32>
  memref.global "public" @c : memref<1024xi32>
  memref.global "public" @a : memref<1024xi32>
  memref.global "public" @b : memref<1024xi32>
  func @core71() {
    %0 = memref.get_global @a : memref<1024xi32>
    memref.assume_alignment %0, 32 : memref<1024xi32>
    %1 = memref.get_global @b : memref<1024xi32>
    memref.assume_alignment %1, 32 : memref<1024xi32>
    %2 = memref.get_global @acc : memref<1024xi32>
    memref.assume_alignment %2, 32 : memref<1024xi32>
    %3 = memref.get_global @c : memref<1024xi32>
    memref.assume_alignment %3, 32 : memref<1024xi32>
    %c32 = arith.constant 32 : index
    %c48 = arith.constant 48 : index
    %c49 = arith.constant 49 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %4 = arith.index_cast %c48 : index to i32
    %c1_i32 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%4, %c1_i32) : (i32, i32) -> ()
    %5 = arith.index_cast %c49 : index to i32
    %c1_i32_0 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%5, %c1_i32_0) : (i32, i32) -> ()
    %6 = arith.index_cast %c32 : index to i32
    %c0_i32 = arith.constant 0 : i32
    call @llvm.aie.lock.acquire.reg(%6, %c0_i32) : (i32, i32) -> ()
    call @extern_kernel(%0, %1, %2, %3) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    %7 = arith.index_cast %c32 : index to i32
    %c1_i32_1 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%7, %c1_i32_1) : (i32, i32) -> ()
    return
  }
  func @_main() {
    call @core71() : () -> ()
    return
  }
}

