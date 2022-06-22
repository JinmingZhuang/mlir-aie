module @test_single_kernel attributes {llvm.data_layout = "", llvm.target_triple = "aie"} {
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
  llvm.func @extern_kernel(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {sym_visibility = "private"}
  llvm.mlir.global external @acc() : !llvm.array<256 x i32>
  llvm.mlir.global external @c() : !llvm.array<256 x i32>
  llvm.mlir.global external @a() : !llvm.array<256 x i32>
  llvm.mlir.global external @b() : !llvm.array<256 x i32>
  llvm.func @core72() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(35 : i32) : i32
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.constant(34 : i32) : i32
    %4 = llvm.mlir.constant(19 : i32) : i32
    %5 = llvm.mlir.constant(18 : i32) : i32
    %6 = llvm.mlir.addressof @a : !llvm.ptr<array<256 x i32>>
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.getelementptr %6[%7, %7] : (!llvm.ptr<array<256 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %9 = llvm.mlir.constant(31 : index) : i64
    %10 = llvm.ptrtoint %8 : !llvm.ptr<i32> to i64
    %11 = llvm.and %10, %9  : i64
    %12 = llvm.icmp "eq" %11, %7 : i64
    "llvm.intr.assume"(%12) : (i1) -> ()
    %13 = llvm.mlir.addressof @b : !llvm.ptr<array<256 x i32>>
    %14 = llvm.getelementptr %13[%7, %7] : (!llvm.ptr<array<256 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %15 = llvm.ptrtoint %14 : !llvm.ptr<i32> to i64
    %16 = llvm.and %15, %9  : i64
    %17 = llvm.icmp "eq" %16, %7 : i64
    "llvm.intr.assume"(%17) : (i1) -> ()
    %18 = llvm.mlir.addressof @acc : !llvm.ptr<array<256 x i32>>
    %19 = llvm.getelementptr %18[%7, %7] : (!llvm.ptr<array<256 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %20 = llvm.ptrtoint %19 : !llvm.ptr<i32> to i64
    %21 = llvm.and %20, %9  : i64
    %22 = llvm.icmp "eq" %21, %7 : i64
    "llvm.intr.assume"(%22) : (i1) -> ()
    %23 = llvm.mlir.addressof @c : !llvm.ptr<array<256 x i32>>
    %24 = llvm.getelementptr %23[%7, %7] : (!llvm.ptr<array<256 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %25 = llvm.ptrtoint %24 : !llvm.ptr<i32> to i64
    %26 = llvm.and %25, %9  : i64
    %27 = llvm.icmp "eq" %26, %7 : i64
    "llvm.intr.assume"(%27) : (i1) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%5, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%4, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%3, %0) : (i32, i32) -> ()
    llvm.call @extern_kernel(%8, %14, %19, %24) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    llvm.call @llvm.aie.lock.release.reg(%5, %2) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%4, %2) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%3, %2) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%1, %0) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @_main() {
    llvm.call @core72() : () -> ()
    llvm.return
  }
}

