module @test_chess_04_deprecated_shim_dma_precompiled_kernel attributes {llvm.data_layout = "", llvm.target_triple = "aie"} {
  llvm.func @debug_i32(i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.put.ms(i32, i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.put.wms(i32, i128) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.put.fms(i32, f32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.get.ss(i32) -> i32 attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.get.wss(i32) -> i128 attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.get.fss(i32) -> f32 attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.put.mcd(i384) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.get.scd() -> i384 attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.lock.acquire.reg(i32, i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.lock.release.reg(i32, i32) attributes {sym_visibility = "private"}
  llvm.mlir.global external @a_ping() : !llvm.array<64 x i32>
  llvm.mlir.global external @a_pong() : !llvm.array<64 x i32>
  llvm.mlir.global external @b_ping() : !llvm.array<64 x i32>
  llvm.mlir.global external @b_pong() : !llvm.array<64 x i32>
  llvm.func @core73() {
    %0 = llvm.mlir.constant(54 : i32) : i32
    %1 = llvm.mlir.constant(52 : i32) : i32
    %2 = llvm.mlir.constant(53 : i32) : i32
    %3 = llvm.mlir.constant(51 : i32) : i32
    %4 = llvm.mlir.constant(64 : index) : i64
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(0 : index) : i64
    %7 = llvm.mlir.constant(1 : i32) : i32
    %8 = llvm.mlir.constant(0 : i32) : i32
    %9 = llvm.mlir.constant(4 : index) : i64
    %10 = llvm.mlir.addressof @a_ping : !llvm.ptr<array<64 x i32>>
    %11 = llvm.getelementptr %10[%6, %6] : (!llvm.ptr<array<64 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %12 = llvm.mlir.constant(31 : index) : i64
    %13 = llvm.ptrtoint %11 : !llvm.ptr<i32> to i64
    %14 = llvm.and %13, %12  : i64
    %15 = llvm.icmp "eq" %14, %6 : i64
    "llvm.intr.assume"(%15) : (i1) -> ()
    %16 = llvm.mlir.addressof @a_pong : !llvm.ptr<array<64 x i32>>
    %17 = llvm.getelementptr %16[%6, %6] : (!llvm.ptr<array<64 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %18 = llvm.ptrtoint %17 : !llvm.ptr<i32> to i64
    %19 = llvm.and %18, %12  : i64
    %20 = llvm.icmp "eq" %19, %6 : i64
    "llvm.intr.assume"(%20) : (i1) -> ()
    %21 = llvm.mlir.addressof @b_ping : !llvm.ptr<array<64 x i32>>
    %22 = llvm.getelementptr %21[%6, %6] : (!llvm.ptr<array<64 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %23 = llvm.ptrtoint %22 : !llvm.ptr<i32> to i64
    %24 = llvm.and %23, %12  : i64
    %25 = llvm.icmp "eq" %24, %6 : i64
    "llvm.intr.assume"(%25) : (i1) -> ()
    %26 = llvm.mlir.addressof @b_pong : !llvm.ptr<array<64 x i32>>
    %27 = llvm.getelementptr %26[%6, %6] : (!llvm.ptr<array<64 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %28 = llvm.ptrtoint %27 : !llvm.ptr<i32> to i64
    %29 = llvm.and %28, %12  : i64
    %30 = llvm.icmp "eq" %29, %6 : i64
    "llvm.intr.assume"(%30) : (i1) -> ()
    llvm.br ^bb1(%6 : i64)
  ^bb1(%31: i64):  // 2 preds: ^bb0, ^bb8
    %32 = llvm.icmp "slt" %31, %9 : i64
    llvm.cond_br %32, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    llvm.call @llvm.aie.lock.acquire.reg(%3, %7) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%2, %8) : (i32, i32) -> ()
    llvm.br ^bb3(%6 : i64)
  ^bb3(%33: i64):  // 2 preds: ^bb2, ^bb4
    %34 = llvm.icmp "slt" %33, %4 : i64
    llvm.cond_br %34, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %35 = llvm.getelementptr %11[%33] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %36 = llvm.load %35 : !llvm.ptr<i32>
    %37 = llvm.add %36, %7  : i32
    %38 = llvm.getelementptr %22[%33] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %37, %38 : !llvm.ptr<i32>
    %39 = llvm.add %33, %5  : i64
    llvm.br ^bb3(%39 : i64)
  ^bb5:  // pred: ^bb3
    llvm.call @llvm.aie.lock.release.reg(%3, %8) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%2, %7) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%1, %7) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%0, %8) : (i32, i32) -> ()
    llvm.br ^bb6(%6 : i64)
  ^bb6(%40: i64):  // 2 preds: ^bb5, ^bb7
    %41 = llvm.icmp "slt" %40, %4 : i64
    llvm.cond_br %41, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %42 = llvm.getelementptr %17[%40] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %43 = llvm.load %42 : !llvm.ptr<i32>
    %44 = llvm.add %43, %7  : i32
    %45 = llvm.getelementptr %27[%40] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %44, %45 : !llvm.ptr<i32>
    %46 = llvm.add %40, %5  : i64
    llvm.br ^bb6(%46 : i64)
  ^bb8:  // pred: ^bb6
    llvm.call @llvm.aie.lock.release.reg(%1, %8) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%0, %7) : (i32, i32) -> ()
    %47 = llvm.add %31, %5  : i64
    llvm.br ^bb1(%47 : i64)
  ^bb9:  // pred: ^bb1
    llvm.return
  }
  llvm.func @_main() {
    llvm.call @core73() : () -> ()
    llvm.return
  }
}

