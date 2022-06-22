; ModuleID = 'acdc_project/core_7_2.ll'
source_filename = "LLVMDialectModule"
target triple = "aie"

@acc = external global [1024 x i32]
@c = external global [1024 x i32]
@a = external global [1024 x i32]
@b = external global [1024 x i32]

; Function Attrs: nounwind
declare void @llvm.aie.lock.acquire.reg(i32, i32) #0

; Function Attrs: nounwind
declare void @llvm.aie.lock.release.reg(i32, i32) #0

declare void @extern_kernel(i32*, i32*, i32*, i32*) local_unnamed_addr

define void @core72() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @a to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @b to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @acc to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @c to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 16, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 17, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 32, i32 0)
  tail call void @extern_kernel(i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @a, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @b, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @acc, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @c, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 32, i32 1)
  ret void
}

define void @_main() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @a to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @b to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @acc to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([1024 x i32]* @c to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 16, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 17, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 32, i32 0)
  tail call void @extern_kernel(i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @a, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @b, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @acc, i64 0, i64 0), i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @c, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 32, i32 1)
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nounwind }
attributes #1 = { inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
