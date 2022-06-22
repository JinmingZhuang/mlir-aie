; ModuleID = 'acdc_project/core_7_4.ll'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf73_0 = external global [1024 x i32]
@buf73_1 = external global [1024 x i32]
@buf73_2 = external global [1024 x i32]
@buf73_3 = external global [1024 x i32]
@buf74_0 = external global [1024 x i32]
@buf74_1 = external global [1024 x i32]
@buf74_2 = external global [1024 x i32]

; Function Attrs: nounwind
declare void @llvm.aie.lock.acquire.reg(i32, i32) #0

; Function Attrs: nounwind
declare void @llvm.aie.lock.release.reg(i32, i32) #0

declare void @extern_kernel(i32*, i32*, i32*, i32*) local_unnamed_addr

define void @core74() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf74_0 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf74_1 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf74_2 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_0 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_1 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_2 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_3 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 2, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 16, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 17, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 18, i32 0)
  tail call void @extern_kernel(i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf74_0, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf74_1, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf73_3, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf74_2, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 18, i32 1)
  ret void
}

define void @_main() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf74_0 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf74_1 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf74_2 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_0 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_1 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_2 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @buf73_3 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 2, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 16, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 17, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 18, i32 0)
  tail call void @extern_kernel(i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf74_0, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf74_1, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf73_3, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @buf74_2, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 18, i32 1)
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nounwind }
attributes #1 = { inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
