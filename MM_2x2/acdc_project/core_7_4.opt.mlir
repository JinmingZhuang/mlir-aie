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
  llvm.mlir.global external @buf73_0() : !llvm.array<1024 x i32>
  llvm.mlir.global external @buf73_1() : !llvm.array<1024 x i32>
  llvm.mlir.global external @buf73_2() : !llvm.array<1024 x i32>
  llvm.mlir.global external @buf73_3() : !llvm.array<1024 x i32>
  llvm.mlir.global external @buf74_0() : !llvm.array<1024 x i32>
  llvm.mlir.global external @buf74_1() : !llvm.array<1024 x i32>
  llvm.mlir.global external @buf74_2() : !llvm.array<1024 x i32>
  llvm.func @core74() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(18 : i32) : i32
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.constant(17 : i32) : i32
    %4 = llvm.mlir.constant(16 : i32) : i32
    %5 = llvm.mlir.constant(2 : i32) : i32
    %6 = llvm.mlir.addressof @buf74_0 : !llvm.ptr<array<1024 x i32>>
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.getelementptr %6[%7, %7] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %9 = llvm.mlir.constant(31 : index) : i64
    %10 = llvm.ptrtoint %8 : !llvm.ptr<i32> to i64
    %11 = llvm.and %10, %9  : i64
    %12 = llvm.icmp "eq" %11, %7 : i64
    "llvm.intr.assume"(%12) : (i1) -> ()
    %13 = llvm.mlir.addressof @buf74_1 : !llvm.ptr<array<1024 x i32>>
    %14 = llvm.getelementptr %13[%7, %7] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %15 = llvm.ptrtoint %14 : !llvm.ptr<i32> to i64
    %16 = llvm.and %15, %9  : i64
    %17 = llvm.icmp "eq" %16, %7 : i64
    "llvm.intr.assume"(%17) : (i1) -> ()
    %18 = llvm.mlir.addressof @buf74_2 : !llvm.ptr<array<1024 x i32>>
    %19 = llvm.getelementptr %18[%7, %7] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %20 = llvm.ptrtoint %19 : !llvm.ptr<i32> to i64
    %21 = llvm.and %20, %9  : i64
    %22 = llvm.icmp "eq" %21, %7 : i64
    "llvm.intr.assume"(%22) : (i1) -> ()
    %23 = llvm.mlir.addressof @buf73_0 : !llvm.ptr<array<1024 x i32>>
    %24 = llvm.getelementptr %23[%7, %7] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %25 = llvm.ptrtoint %24 : !llvm.ptr<i32> to i64
    %26 = llvm.and %25, %9  : i64
    %27 = llvm.icmp "eq" %26, %7 : i64
    "llvm.intr.assume"(%27) : (i1) -> ()
    %28 = llvm.mlir.addressof @buf73_1 : !llvm.ptr<array<1024 x i32>>
    %29 = llvm.getelementptr %28[%7, %7] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %30 = llvm.ptrtoint %29 : !llvm.ptr<i32> to i64
    %31 = llvm.and %30, %9  : i64
    %32 = llvm.icmp "eq" %31, %7 : i64
    "llvm.intr.assume"(%32) : (i1) -> ()
    %33 = llvm.mlir.addressof @buf73_2 : !llvm.ptr<array<1024 x i32>>
    %34 = llvm.getelementptr %33[%7, %7] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %35 = llvm.ptrtoint %34 : !llvm.ptr<i32> to i64
    %36 = llvm.and %35, %9  : i64
    %37 = llvm.icmp "eq" %36, %7 : i64
    "llvm.intr.assume"(%37) : (i1) -> ()
    %38 = llvm.mlir.addressof @buf73_3 : !llvm.ptr<array<1024 x i32>>
    %39 = llvm.getelementptr %38[%7, %7] : (!llvm.ptr<array<1024 x i32>>, i64, i64) -> !llvm.ptr<i32>
    %40 = llvm.ptrtoint %39 : !llvm.ptr<i32> to i64
    %41 = llvm.and %40, %9  : i64
    %42 = llvm.icmp "eq" %41, %7 : i64
    "llvm.intr.assume"(%42) : (i1) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%5, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%4, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%3, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%1, %2) : (i32, i32) -> ()
    llvm.call @extern_kernel(%8, %14, %39, %19) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    llvm.call @llvm.aie.lock.release.reg(%1, %0) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @_main() {
    llvm.call @core74() : () -> ()
    llvm.return
  }
}

