module @test_chess_04_deprecated_shim_dma_precompiled_kernel attributes {llvm.target_triple = "aie"} {
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
  memref.global "public" @a_ping : memref<64xi32>
  memref.global "public" @a_pong : memref<64xi32>
  memref.global "public" @b_ping : memref<64xi32>
  memref.global "public" @b_pong : memref<64xi32>
  func @core73() {
    %0 = memref.get_global @a_ping : memref<64xi32>
    memref.assume_alignment %0, 32 : memref<64xi32>
    %1 = memref.get_global @a_pong : memref<64xi32>
    memref.assume_alignment %1, 32 : memref<64xi32>
    %2 = memref.get_global @b_ping : memref<64xi32>
    memref.assume_alignment %2, 32 : memref<64xi32>
    %3 = memref.get_global @b_pong : memref<64xi32>
    memref.assume_alignment %3, 32 : memref<64xi32>
    %c51 = arith.constant 51 : index
    %c52 = arith.constant 52 : index
    %c53 = arith.constant 53 : index
    %c54 = arith.constant 54 : index
    %c256_i32 = arith.constant 256 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c0_0 = arith.constant 0 : index
    %c1_1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    cf.br ^bb1(%c0 : index)
  ^bb1(%4: index):  // 2 preds: ^bb0, ^bb8
    %5 = arith.cmpi slt, %4, %c4 : index
    cf.cond_br %5, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    %6 = arith.index_cast %c51 : index to i32
    %c1_i32_2 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%6, %c1_i32_2) : (i32, i32) -> ()
    %7 = arith.index_cast %c53 : index to i32
    %c0_i32_3 = arith.constant 0 : i32
    call @llvm.aie.lock.acquire.reg(%7, %c0_i32_3) : (i32, i32) -> ()
    cf.br ^bb3(%c0_0, %c0_i32 : index, i32)
  ^bb3(%8: index, %9: i32):  // 2 preds: ^bb2, ^bb4
    %10 = arith.cmpi slt, %8, %c64 : index
    cf.cond_br %10, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %11 = memref.load %0[%8] : memref<64xi32>
    %12 = arith.addi %11, %c1_i32 : i32
    memref.store %12, %2[%8] : memref<64xi32>
    %13 = arith.addi %8, %c1_1 : index
    cf.br ^bb3(%13, %11 : index, i32)
  ^bb5:  // pred: ^bb3
    %14 = arith.index_cast %c51 : index to i32
    %c0_i32_4 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%14, %c0_i32_4) : (i32, i32) -> ()
    %15 = arith.index_cast %c53 : index to i32
    %c1_i32_5 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%15, %c1_i32_5) : (i32, i32) -> ()
    %16 = arith.index_cast %c52 : index to i32
    %c1_i32_6 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%16, %c1_i32_6) : (i32, i32) -> ()
    %17 = arith.index_cast %c54 : index to i32
    %c0_i32_7 = arith.constant 0 : i32
    call @llvm.aie.lock.acquire.reg(%17, %c0_i32_7) : (i32, i32) -> ()
    cf.br ^bb6(%c0_0, %c0_i32 : index, i32)
  ^bb6(%18: index, %19: i32):  // 2 preds: ^bb5, ^bb7
    %20 = arith.cmpi slt, %18, %c64 : index
    cf.cond_br %20, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %21 = memref.load %1[%18] : memref<64xi32>
    %22 = arith.addi %21, %c1_i32 : i32
    memref.store %22, %3[%18] : memref<64xi32>
    %23 = arith.addi %18, %c1_1 : index
    cf.br ^bb6(%23, %21 : index, i32)
  ^bb8:  // pred: ^bb6
    %24 = arith.index_cast %c52 : index to i32
    %c0_i32_8 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%24, %c0_i32_8) : (i32, i32) -> ()
    %25 = arith.index_cast %c54 : index to i32
    %c1_i32_9 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%25, %c1_i32_9) : (i32, i32) -> ()
    %26 = arith.addi %4, %c1 : index
    cf.br ^bb1(%26 : index)
  ^bb9:  // pred: ^bb1
    return
  }
  func @_main() {
    call @core73() : () -> ()
    return
  }
}

