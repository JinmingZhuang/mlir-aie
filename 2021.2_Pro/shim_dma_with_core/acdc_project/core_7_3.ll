; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@a_ping = external global [64 x i32]
@a_pong = external global [64 x i32]
@b_ping = external global [64 x i32]
@b_pong = external global [64 x i32]

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

define void @core73() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([64 x i32]* @a_ping to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([64 x i32]* @a_pong to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([64 x i32]* @b_ping to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([64 x i32]* @b_pong to i64), i64 31), i64 0)), !dbg !11
  br label %1, !dbg !12

1:                                                ; preds = %24, %0
  %2 = phi i64 [ %25, %24 ], [ 0, %0 ]
  %3 = icmp slt i64 %2, 4, !dbg !13
  br i1 %3, label %4, label %26, !dbg !14

4:                                                ; preds = %1
  call void @llvm.aie.lock.acquire.reg(i32 51, i32 1), !dbg !15
  call void @llvm.aie.lock.acquire.reg(i32 53, i32 0), !dbg !16
  br label %5, !dbg !17

5:                                                ; preds = %8, %4
  %6 = phi i64 [ %13, %8 ], [ 0, %4 ]
  %7 = icmp slt i64 %6, 64, !dbg !18
  br i1 %7, label %8, label %14, !dbg !19

8:                                                ; preds = %5
  %9 = getelementptr i32, i32* getelementptr inbounds ([64 x i32], [64 x i32]* @a_ping, i64 0, i64 0), i64 %6, !dbg !20
  %10 = load i32, i32* %9, align 4, !dbg !21
  %11 = add i32 %10, 1, !dbg !22
  %12 = getelementptr i32, i32* getelementptr inbounds ([64 x i32], [64 x i32]* @b_ping, i64 0, i64 0), i64 %6, !dbg !23
  store i32 %11, i32* %12, align 4, !dbg !24
  %13 = add i64 %6, 1, !dbg !25
  br label %5, !dbg !26

14:                                               ; preds = %5
  call void @llvm.aie.lock.release.reg(i32 51, i32 0), !dbg !27
  call void @llvm.aie.lock.release.reg(i32 53, i32 1), !dbg !28
  call void @llvm.aie.lock.acquire.reg(i32 52, i32 1), !dbg !29
  call void @llvm.aie.lock.acquire.reg(i32 54, i32 0), !dbg !30
  br label %15, !dbg !31

15:                                               ; preds = %18, %14
  %16 = phi i64 [ %23, %18 ], [ 0, %14 ]
  %17 = icmp slt i64 %16, 64, !dbg !32
  br i1 %17, label %18, label %24, !dbg !33

18:                                               ; preds = %15
  %19 = getelementptr i32, i32* getelementptr inbounds ([64 x i32], [64 x i32]* @a_pong, i64 0, i64 0), i64 %16, !dbg !34
  %20 = load i32, i32* %19, align 4, !dbg !35
  %21 = add i32 %20, 1, !dbg !36
  %22 = getelementptr i32, i32* getelementptr inbounds ([64 x i32], [64 x i32]* @b_pong, i64 0, i64 0), i64 %16, !dbg !37
  store i32 %21, i32* %22, align 4, !dbg !38
  %23 = add i64 %16, 1, !dbg !39
  br label %15, !dbg !40

24:                                               ; preds = %15
  call void @llvm.aie.lock.release.reg(i32 52, i32 0), !dbg !41
  call void @llvm.aie.lock.release.reg(i32 54, i32 1), !dbg !42
  %25 = add i64 %2, 1, !dbg !43
  br label %1, !dbg !44

26:                                               ; preds = %1
  ret void, !dbg !45
}

define void @_main() !dbg !46 {
  call void @core73(), !dbg !47
  ret void, !dbg !49
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core73", linkageName: "core73", scope: null, file: !4, line: 17, type: !5, scopeLine: 17, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_7_3.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/mlir-aie/test/unit_tests/chess_compiler_tests/2021.2_Pro/shim_dma_with_core")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 34, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 40, column: 5, scope: !8)
!10 = !DILocation(line: 46, column: 5, scope: !8)
!11 = !DILocation(line: 52, column: 5, scope: !8)
!12 = !DILocation(line: 53, column: 5, scope: !8)
!13 = !DILocation(line: 55, column: 11, scope: !8)
!14 = !DILocation(line: 56, column: 5, scope: !8)
!15 = !DILocation(line: 58, column: 5, scope: !8)
!16 = !DILocation(line: 59, column: 5, scope: !8)
!17 = !DILocation(line: 60, column: 5, scope: !8)
!18 = !DILocation(line: 62, column: 11, scope: !8)
!19 = !DILocation(line: 63, column: 5, scope: !8)
!20 = !DILocation(line: 65, column: 11, scope: !8)
!21 = !DILocation(line: 66, column: 11, scope: !8)
!22 = !DILocation(line: 67, column: 11, scope: !8)
!23 = !DILocation(line: 68, column: 11, scope: !8)
!24 = !DILocation(line: 69, column: 5, scope: !8)
!25 = !DILocation(line: 70, column: 11, scope: !8)
!26 = !DILocation(line: 71, column: 5, scope: !8)
!27 = !DILocation(line: 73, column: 5, scope: !8)
!28 = !DILocation(line: 74, column: 5, scope: !8)
!29 = !DILocation(line: 75, column: 5, scope: !8)
!30 = !DILocation(line: 76, column: 5, scope: !8)
!31 = !DILocation(line: 77, column: 5, scope: !8)
!32 = !DILocation(line: 79, column: 11, scope: !8)
!33 = !DILocation(line: 80, column: 5, scope: !8)
!34 = !DILocation(line: 82, column: 11, scope: !8)
!35 = !DILocation(line: 83, column: 11, scope: !8)
!36 = !DILocation(line: 84, column: 11, scope: !8)
!37 = !DILocation(line: 85, column: 11, scope: !8)
!38 = !DILocation(line: 86, column: 5, scope: !8)
!39 = !DILocation(line: 87, column: 11, scope: !8)
!40 = !DILocation(line: 88, column: 5, scope: !8)
!41 = !DILocation(line: 90, column: 5, scope: !8)
!42 = !DILocation(line: 91, column: 5, scope: !8)
!43 = !DILocation(line: 92, column: 11, scope: !8)
!44 = !DILocation(line: 93, column: 5, scope: !8)
!45 = !DILocation(line: 95, column: 5, scope: !8)
!46 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 97, type: !5, scopeLine: 97, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!47 = !DILocation(line: 98, column: 5, scope: !48)
!48 = !DILexicalBlockFile(scope: !46, file: !4, discriminator: 0)
!49 = !DILocation(line: 99, column: 5, scope: !48)
