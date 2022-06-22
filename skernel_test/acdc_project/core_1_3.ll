; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@a = external global [1024 x i32]
@b = external global [1024 x i32]
@acc = external global [1024 x i32]
@c = external global [1024 x i32]

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

define void @core13() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @a to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @b to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @acc to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @c to i64), i64 31), i64 0)), !dbg !11
  call void @llvm.aie.lock.acquire.reg(i32 48, i32 1), !dbg !12
  call void @llvm.aie.lock.acquire.reg(i32 32, i32 0), !dbg !13
  call void @extern_kernel(i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @a, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @b, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @acc, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @c, i64 0, i64 0)), !dbg !14
  call void @llvm.aie.lock.release.reg(i32 48, i32 0), !dbg !15
  call void @llvm.aie.lock.release.reg(i32 32, i32 1), !dbg !16
  ret void, !dbg !17
}

define void @_main() !dbg !18 {
  call void @core13(), !dbg !19
  ret void, !dbg !21
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core13", linkageName: "core13", scope: null, file: !4, line: 18, type: !5, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_1_3.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/mlir-aie/test/unit_tests/chess_compiler_tests/skernel_test")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 30, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 36, column: 5, scope: !8)
!10 = !DILocation(line: 42, column: 5, scope: !8)
!11 = !DILocation(line: 48, column: 5, scope: !8)
!12 = !DILocation(line: 49, column: 5, scope: !8)
!13 = !DILocation(line: 50, column: 5, scope: !8)
!14 = !DILocation(line: 51, column: 5, scope: !8)
!15 = !DILocation(line: 52, column: 5, scope: !8)
!16 = !DILocation(line: 53, column: 5, scope: !8)
!17 = !DILocation(line: 54, column: 5, scope: !8)
!18 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 56, type: !5, scopeLine: 56, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!19 = !DILocation(line: 57, column: 5, scope: !20)
!20 = !DILexicalBlockFile(scope: !18, file: !4, discriminator: 0)
!21 = !DILocation(line: 58, column: 5, scope: !20)
