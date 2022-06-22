; ModuleID = 'acdc_project/core_1_3.ll'
source_filename = "LLVMDialectModule"
target triple = "aie"

@a = external global [256 x i32]
@b = external global [256 x i32]

; Function Attrs: nounwind
declare void @llvm.aie.lock.acquire.reg(i32, i32) #0

; Function Attrs: nounwind
declare void @llvm.aie.lock.release.reg(i32, i32) #0

declare void @func(i32*, i32*) local_unnamed_addr

define void @core13() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([256 x i32]* @a to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([256 x i32]* @b to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 53, i32 0)
  tail call void @func(i32* getelementptr inbounds ([256 x i32], [256 x i32]* @a, i64 0, i64 0), i32* getelementptr inbounds ([256 x i32], [256 x i32]* @b, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 53, i32 1)
  ret void
}

define void @_main() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([256 x i32]* @a to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([256 x i32]* @b to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 53, i32 0)
  tail call void @func(i32* getelementptr inbounds ([256 x i32], [256 x i32]* @a, i64 0, i64 0), i32* getelementptr inbounds ([256 x i32], [256 x i32]* @b, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 53, i32 1)
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nounwind }
attributes #1 = { inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
