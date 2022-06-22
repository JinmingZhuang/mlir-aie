; ModuleID = 'acdc_project/core_6_3.ll'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf64_0 = external global [1024 x i32]
@buf64_1 = external global [1024 x i32]
@buf64_2 = external global [1024 x i32]
@buf63_0 = external global [1024 x i32]
@buf63_1 = external global [1024 x i32]
@buf63_2 = external global [1024 x i32]
@buf63_3 = external global [1024 x i32]

; Function Attrs: nounwind
declare void @llvm.aie.lock.acquire.reg(i32, i32) #0

; Function Attrs: nounwind
declare void @llvm.aie.lock.release.reg(i32, i32) #0

declare void @extern_kernel(i32*, i32*, i32*, i32*) local_unnamed_addr

define void @core63() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_0 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_1 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_2 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_3 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf64_0 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf64_1 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf64_2 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 48, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 49, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 0)
  tail call void @extern_kernel(i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_0, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_1, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_2, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_3, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 1)
  ret void
}

define void @_main() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_0 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_1 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_2 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf63_3 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf64_0 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf64_1 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf64_2 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 48, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 49, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 0)
  tail call void @extern_kernel(i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_0, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_1, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_2, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf63_3, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 1)
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nounwind }
attributes #1 = { inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
