module @test_chesss_01_precompiled_core_function attributes {llvm.data_layout = "", llvm.target_triple = "aie"} {
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
  llvm.func @func(!llvm.ptr<i32>, !llvm.ptr<i32>) attributes {sym_visibility = "private"}
  llvm.mlir.global external @a() : !llvm.array<256 x i32>
  llvm.mlir.global external @b() : !llvm.array<256 x i32>
  llvm.func @core13() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(53 : i32) : i32
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.constant(51 : i32) : i32
    %4 = llvm.mlir.addressof @a : !llvm.ptr<array<256 x i32>>
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = llvm.getelementptr %4[%5, %5] : (!llvm.ptr<array<256 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %7 = llvm.mlir.constant(31 : index) : i64
    %8 = llvm.ptrtoint %6 : !llvm.ptr<i32> to i64
    %9 = llvm.and %8, %7  : i64
    %10 = llvm.icmp "eq" %9, %5 : i64
    "llvm.intr.assume"(%10) : (i1) -> ()
    %11 = llvm.mlir.addressof @b : !llvm.ptr<array<256 x i32>>
    %12 = llvm.getelementptr %11[%5, %5] : (!llvm.ptr<array<256 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %13 = llvm.ptrtoint %12 : !llvm.ptr<i32> to i64
    %14 = llvm.and %13, %7  : i64
    %15 = llvm.icmp "eq" %14, %5 : i64
    "llvm.intr.assume"(%15) : (i1) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%3, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%1, %2) : (i32, i32) -> ()
    llvm.call @func(%6, %12) : (!llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    llvm.call @llvm.aie.lock.release.reg(%3, %2) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%1, %0) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @_main() {
    llvm.call @core13() : () -> ()
    llvm.return
  }
}

