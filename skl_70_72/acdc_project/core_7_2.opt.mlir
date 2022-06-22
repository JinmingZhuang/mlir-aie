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
  llvm.mlir.global external @acc() : !llvm.array<1024 x i32>
  llvm.mlir.global external @c() : !llvm.array<1024 x i32>
  llvm.mlir.global external @a() : !llvm.array<1024 x i32>
  llvm.mlir.global external @b() : !llvm.array<1024 x i32>
  llvm.func @core72() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(32 : i32) : i32
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.constant(17 : i32) : i32
    %4 = llvm.mlir.constant(16 : i32) : i32
    %5 = llvm.mlir.addressof @a : !llvm.ptr<array<1024 x i32>>
    %6 = llvm.mlir.constant(0 : index) : i64
    %7 = llvm.getelementptr %5[%6, %6] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %8 = llvm.mlir.constant(31 : index) : i64
    %9 = llvm.ptrtoint %7 : !llvm.ptr<i32> to i64
    %10 = llvm.and %9, %8  : i64
    %11 = llvm.icmp "eq" %10, %6 : i64
    "llvm.intr.assume"(%11) : (i1) -> ()
    %12 = llvm.mlir.addressof @b : !llvm.ptr<array<1024 x i32>>
    %13 = llvm.getelementptr %12[%6, %6] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %14 = llvm.ptrtoint %13 : !llvm.ptr<i32> to i64
    %15 = llvm.and %14, %8  : i64
    %16 = llvm.icmp "eq" %15, %6 : i64
    "llvm.intr.assume"(%16) : (i1) -> ()
    %17 = llvm.mlir.addressof @acc : !llvm.ptr<array<1024 x i32>>
    %18 = llvm.getelementptr %17[%6, %6] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %19 = llvm.ptrtoint %18 : !llvm.ptr<i32> to i64
    %20 = llvm.and %19, %8  : i64
    %21 = llvm.icmp "eq" %20, %6 : i64
    "llvm.intr.assume"(%21) : (i1) -> ()
    %22 = llvm.mlir.addressof @c : !llvm.ptr<array<1024 x i32>>
    %23 = llvm.getelementptr %22[%6, %6] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %24 = llvm.ptrtoint %23 : !llvm.ptr<i32> to i64
    %25 = llvm.and %24, %8  : i64
    %26 = llvm.icmp "eq" %25, %6 : i64
    "llvm.intr.assume"(%26) : (i1) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%4, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%3, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%1, %2) : (i32, i32) -> ()
    llvm.call @extern_kernel(%7, %13, %18, %23) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    llvm.call @llvm.aie.lock.release.reg(%1, %0) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @_main() {
    llvm.call @core72() : () -> ()
    llvm.return
  }
}

