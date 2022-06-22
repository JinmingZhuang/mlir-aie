; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf73_0 = external global [1024 x i32]
@buf73_1 = external global [1024 x i32]
@buf73_2 = external global [1024 x i32]
@buf73_3 = external global [1024 x i32]
@buf74_0 = external global [1024 x i32]
@buf74_1 = external global [1024 x i32]
@buf74_2 = external global [1024 x i32]

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @debug_i32(i32)

declare void @llvm.aie.put.ms(i32, i32)

declare void @llvm.aie.put.wms(i32, i128)

declare void @llvm.aie.put.fms(i32, float)

declare i32 @llvm.aie.get.ss(i32)

declare i128 @llvm.aie.get.wss(i32)

declare float @llvm.aie.get.fss(i32)

declare void @llvm.aie.put.mcd(i384)

declare i384 @llvm.aie.get.scd()

declare void @llvm.aie.lock.acquire.reg(i32, i32)

declare void @llvm.aie.lock.release.reg(i32, i32)

declare void @extern_kernel(i32*, i32*, i32*, i32*)

define void @core74() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf74_0 to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf74_1 to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf74_2 to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_0 to i64), i64 31), i64 0)), !dbg !11
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_1 to i64), i64 31), i64 0)), !dbg !12
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_2 to i64), i64 31), i64 0)), !dbg !13
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_3 to i64), i64 31), i64 0)), !dbg !14
  call void @llvm.aie.lock.acquire.reg(i32 2, i32 1), !dbg !15
  call void @llvm.aie.lock.acquire.reg(i32 16, i32 1), !dbg !16
  call void @llvm.aie.lock.acquire.reg(i32 17, i32 1), !dbg !17
  call void @llvm.aie.lock.acquire.reg(i32 18, i32 0), !dbg !18
  call void @extern_kernel(i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf74_0, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf74_1, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf73_3, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf74_2, i64 0, i64 0)), !dbg !19
  call void @llvm.aie.lock.release.reg(i32 18, i32 1), !dbg !20
  ret void, !dbg !21
}

define void @_main() !dbg !22 {
  call void @core74(), !dbg !23
  ret void, !dbg !25
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core74", linkageName: "core74", scope: null, file: !4, line: 21, type: !5, scopeLine: 21, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_7_4.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/mlir-aie/test/unit_tests/chess_compiler_tests/MM_1x2_flow")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 35, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 41, column: 5, scope: !8)
!10 = !DILocation(line: 47, column: 5, scope: !8)
!11 = !DILocation(line: 53, column: 5, scope: !8)
!12 = !DILocation(line: 59, column: 5, scope: !8)
!13 = !DILocation(line: 65, column: 5, scope: !8)
!14 = !DILocation(line: 71, column: 5, scope: !8)
!15 = !DILocation(line: 72, column: 5, scope: !8)
!16 = !DILocation(line: 73, column: 5, scope: !8)
!17 = !DILocation(line: 74, column: 5, scope: !8)
!18 = !DILocation(line: 75, column: 5, scope: !8)
!19 = !DILocation(line: 76, column: 5, scope: !8)
!20 = !DILocation(line: 77, column: 5, scope: !8)
!21 = !DILocation(line: 78, column: 5, scope: !8)
!22 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 80, type: !5, scopeLine: 80, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!23 = !DILocation(line: 81, column: 5, scope: !24)
!24 = !DILexicalBlockFile(scope: !22, file: !4, discriminator: 0)
!25 = !DILocation(line: 82, column: 5, scope: !24)
