; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@a = external global [256 x i32]
@b = external global [256 x i32]

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

declare void @func(i32*, i32*)

define void @core13() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([256 x i32]* @a to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([256 x i32]* @b to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.aie.lock.acquire.reg(i32 51, i32 1), !dbg !10
  call void @llvm.aie.lock.acquire.reg(i32 53, i32 0), !dbg !11
  call void @func(i32* getelementptr inbounds ([256 x i32], [256 x i32]* @a, i64 0, i64 0), i32* getelementptr inbounds ([256 x i32], [256 x i32]* @b, i64 0, i64 0)), !dbg !12
  call void @llvm.aie.lock.release.reg(i32 51, i32 0), !dbg !13
  call void @llvm.aie.lock.release.reg(i32 53, i32 1), !dbg !14
  ret void, !dbg !15
}

define void @_main() !dbg !16 {
  call void @core13(), !dbg !17
  ret void, !dbg !19
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core13", linkageName: "core13", scope: null, file: !4, line: 16, type: !5, scopeLine: 16, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_1_3.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/mlir-aie/test/unit_tests/chess_compiler_tests/01_precompiled_core_function")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 28, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 34, column: 5, scope: !8)
!10 = !DILocation(line: 35, column: 5, scope: !8)
!11 = !DILocation(line: 36, column: 5, scope: !8)
!12 = !DILocation(line: 37, column: 5, scope: !8)
!13 = !DILocation(line: 38, column: 5, scope: !8)
!14 = !DILocation(line: 39, column: 5, scope: !8)
!15 = !DILocation(line: 40, column: 5, scope: !8)
!16 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 42, type: !5, scopeLine: 42, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!17 = !DILocation(line: 43, column: 5, scope: !18)
!18 = !DILexicalBlockFile(scope: !16, file: !4, discriminator: 0)
!19 = !DILocation(line: 44, column: 5, scope: !18)
