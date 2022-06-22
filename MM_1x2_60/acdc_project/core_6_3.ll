; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf62_0 = external global [1024 x i32]
@buf62_1 = external global [1024 x i32]
@buf62_2 = external global [1024 x i32]
@buf62_3 = external global [1024 x i32]
@buf64_0 = external global [1024 x i32]
@buf64_1 = external global [1024 x i32]
@buf64_2 = external global [1024 x i32]
@buf63_0 = external global [1024 x i32]
@buf63_1 = external global [1024 x i32]
@buf63_2 = external global [1024 x i32]
@buf63_3 = external global [1024 x i32]

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

define void @core63() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_0 to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_1 to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_2 to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_3 to i64), i64 31), i64 0)), !dbg !11
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf64_0 to i64), i64 31), i64 0)), !dbg !12
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf64_1 to i64), i64 31), i64 0)), !dbg !13
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf64_2 to i64), i64 31), i64 0)), !dbg !14
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf62_0 to i64), i64 31), i64 0)), !dbg !15
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf62_1 to i64), i64 31), i64 0)), !dbg !16
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf62_2 to i64), i64 31), i64 0)), !dbg !17
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf62_3 to i64), i64 31), i64 0)), !dbg !18
  call void @llvm.aie.lock.acquire.reg(i32 48, i32 1), !dbg !19
  call void @llvm.aie.lock.acquire.reg(i32 49, i32 1), !dbg !20
  call void @llvm.aie.lock.acquire.reg(i32 50, i32 0), !dbg !21
  call void @extern_kernel(i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_0, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_1, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_2, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_3, i64 0, i64 0)), !dbg !22
  call void @llvm.aie.lock.release.reg(i32 50, i32 1), !dbg !23
  ret void, !dbg !24
}

define void @_main() !dbg !25 {
  call void @core63(), !dbg !26
  ret void, !dbg !28
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core63", linkageName: "core63", scope: null, file: !4, line: 25, type: !5, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_6_3.opt.mlir", directory: "/wrk/xcohdnobkup3/jinmingz/mlir-aie/test/unit_tests/chess_compiler_tests/MM_1x2_60")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 38, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 44, column: 5, scope: !8)
!10 = !DILocation(line: 50, column: 5, scope: !8)
!11 = !DILocation(line: 56, column: 5, scope: !8)
!12 = !DILocation(line: 62, column: 5, scope: !8)
!13 = !DILocation(line: 68, column: 5, scope: !8)
!14 = !DILocation(line: 74, column: 5, scope: !8)
!15 = !DILocation(line: 80, column: 5, scope: !8)
!16 = !DILocation(line: 86, column: 5, scope: !8)
!17 = !DILocation(line: 92, column: 5, scope: !8)
!18 = !DILocation(line: 98, column: 5, scope: !8)
!19 = !DILocation(line: 99, column: 5, scope: !8)
!20 = !DILocation(line: 100, column: 5, scope: !8)
!21 = !DILocation(line: 101, column: 5, scope: !8)
!22 = !DILocation(line: 102, column: 5, scope: !8)
!23 = !DILocation(line: 103, column: 5, scope: !8)
!24 = !DILocation(line: 104, column: 5, scope: !8)
!25 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 106, type: !5, scopeLine: 106, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!26 = !DILocation(line: 107, column: 5, scope: !27)
!27 = !DILexicalBlockFile(scope: !25, file: !4, discriminator: 0)
!28 = !DILocation(line: 108, column: 5, scope: !27)
