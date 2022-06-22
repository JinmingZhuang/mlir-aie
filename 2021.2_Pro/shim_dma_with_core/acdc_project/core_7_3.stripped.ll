; ModuleID = 'acdc_project/core_7_3.ll'
source_filename = "LLVMDialectModule"
target triple = "aie"

@a_ping = external global [64 x i32]
@a_pong = external global [64 x i32]
@b_ping = external global [64 x i32]
@b_pong = external global [64 x i32]

; Function Attrs: nounwind
declare void @llvm.aie.lock.acquire.reg(i32, i32) #0

; Function Attrs: nounwind
declare void @llvm.aie.lock.release.reg(i32, i32) #0

; Function Attrs: nounwind
define void @core73() local_unnamed_addr #0 {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([64 x i32]* @a_ping to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([64 x i32]* @a_pong to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([64 x i32]* @b_ping to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([64 x i32]* @b_pong to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 53, i32 0)
  br label %1

1:                                                ; preds = %1, %0
  %2 = phi i64 [ 0, %0 ], [ %82, %1 ]
  %3 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %2
  %4 = load i32, i32* %3, align 4
  %5 = add i32 %4, 1
  %6 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %2
  store i32 %5, i32* %6, align 4
  %7 = or i64 %2, 1
  %8 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %7
  %9 = load i32, i32* %8, align 4
  %10 = add i32 %9, 1
  %11 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %7
  store i32 %10, i32* %11, align 4
  %12 = or i64 %2, 2
  %13 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %12
  %14 = load i32, i32* %13, align 4
  %15 = add i32 %14, 1
  %16 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %12
  store i32 %15, i32* %16, align 4
  %17 = or i64 %2, 3
  %18 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = add i32 %19, 1
  %21 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %17
  store i32 %20, i32* %21, align 4
  %22 = or i64 %2, 4
  %23 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %22
  %24 = load i32, i32* %23, align 4
  %25 = add i32 %24, 1
  %26 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %22
  store i32 %25, i32* %26, align 4
  %27 = or i64 %2, 5
  %28 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %27
  %29 = load i32, i32* %28, align 4
  %30 = add i32 %29, 1
  %31 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %27
  store i32 %30, i32* %31, align 4
  %32 = or i64 %2, 6
  %33 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %32
  %34 = load i32, i32* %33, align 4
  %35 = add i32 %34, 1
  %36 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %32
  store i32 %35, i32* %36, align 4
  %37 = or i64 %2, 7
  %38 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %37
  %39 = load i32, i32* %38, align 4
  %40 = add i32 %39, 1
  %41 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %37
  store i32 %40, i32* %41, align 4
  %42 = or i64 %2, 8
  %43 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %42
  %44 = load i32, i32* %43, align 4
  %45 = add i32 %44, 1
  %46 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %42
  store i32 %45, i32* %46, align 4
  %47 = or i64 %2, 9
  %48 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = add i32 %49, 1
  %51 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %47
  store i32 %50, i32* %51, align 4
  %52 = or i64 %2, 10
  %53 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %52
  %54 = load i32, i32* %53, align 4
  %55 = add i32 %54, 1
  %56 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %52
  store i32 %55, i32* %56, align 4
  %57 = or i64 %2, 11
  %58 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %57
  %59 = load i32, i32* %58, align 4
  %60 = add i32 %59, 1
  %61 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %57
  store i32 %60, i32* %61, align 4
  %62 = or i64 %2, 12
  %63 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %62
  %64 = load i32, i32* %63, align 4
  %65 = add i32 %64, 1
  %66 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %62
  store i32 %65, i32* %66, align 4
  %67 = or i64 %2, 13
  %68 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %67
  %69 = load i32, i32* %68, align 4
  %70 = add i32 %69, 1
  %71 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %67
  store i32 %70, i32* %71, align 4
  %72 = or i64 %2, 14
  %73 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %72
  %74 = load i32, i32* %73, align 4
  %75 = add i32 %74, 1
  %76 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %72
  store i32 %75, i32* %76, align 4
  %77 = or i64 %2, 15
  %78 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %77
  %79 = load i32, i32* %78, align 4
  %80 = add i32 %79, 1
  %81 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %77
  store i32 %80, i32* %81, align 4
  %82 = add nuw nsw i64 %2, 16
  %83 = icmp ult i64 %77, 63
  br i1 %83, label %1, label %84

84:                                               ; preds = %1
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 53, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 52, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 54, i32 0)
  br label %85

85:                                               ; preds = %85, %84
  %86 = phi i64 [ 0, %84 ], [ %166, %85 ]
  %87 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %86
  %88 = load i32, i32* %87, align 4
  %89 = add i32 %88, 1
  %90 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %86
  store i32 %89, i32* %90, align 4
  %91 = or i64 %86, 1
  %92 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %91
  %93 = load i32, i32* %92, align 4
  %94 = add i32 %93, 1
  %95 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %91
  store i32 %94, i32* %95, align 4
  %96 = or i64 %86, 2
  %97 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %96
  %98 = load i32, i32* %97, align 4
  %99 = add i32 %98, 1
  %100 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %96
  store i32 %99, i32* %100, align 4
  %101 = or i64 %86, 3
  %102 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %101
  %103 = load i32, i32* %102, align 4
  %104 = add i32 %103, 1
  %105 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %101
  store i32 %104, i32* %105, align 4
  %106 = or i64 %86, 4
  %107 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %106
  %108 = load i32, i32* %107, align 4
  %109 = add i32 %108, 1
  %110 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %106
  store i32 %109, i32* %110, align 4
  %111 = or i64 %86, 5
  %112 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %111
  %113 = load i32, i32* %112, align 4
  %114 = add i32 %113, 1
  %115 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %111
  store i32 %114, i32* %115, align 4
  %116 = or i64 %86, 6
  %117 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %116
  %118 = load i32, i32* %117, align 4
  %119 = add i32 %118, 1
  %120 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %116
  store i32 %119, i32* %120, align 4
  %121 = or i64 %86, 7
  %122 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %121
  %123 = load i32, i32* %122, align 4
  %124 = add i32 %123, 1
  %125 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %121
  store i32 %124, i32* %125, align 4
  %126 = or i64 %86, 8
  %127 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %126
  %128 = load i32, i32* %127, align 4
  %129 = add i32 %128, 1
  %130 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %126
  store i32 %129, i32* %130, align 4
  %131 = or i64 %86, 9
  %132 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %131
  %133 = load i32, i32* %132, align 4
  %134 = add i32 %133, 1
  %135 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %131
  store i32 %134, i32* %135, align 4
  %136 = or i64 %86, 10
  %137 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %136
  %138 = load i32, i32* %137, align 4
  %139 = add i32 %138, 1
  %140 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %136
  store i32 %139, i32* %140, align 4
  %141 = or i64 %86, 11
  %142 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %141
  %143 = load i32, i32* %142, align 4
  %144 = add i32 %143, 1
  %145 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %141
  store i32 %144, i32* %145, align 4
  %146 = or i64 %86, 12
  %147 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %146
  %148 = load i32, i32* %147, align 4
  %149 = add i32 %148, 1
  %150 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %146
  store i32 %149, i32* %150, align 4
  %151 = or i64 %86, 13
  %152 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %151
  %153 = load i32, i32* %152, align 4
  %154 = add i32 %153, 1
  %155 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %151
  store i32 %154, i32* %155, align 4
  %156 = or i64 %86, 14
  %157 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %156
  %158 = load i32, i32* %157, align 4
  %159 = add i32 %158, 1
  %160 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %156
  store i32 %159, i32* %160, align 4
  %161 = or i64 %86, 15
  %162 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %161
  %163 = load i32, i32* %162, align 4
  %164 = add i32 %163, 1
  %165 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %161
  store i32 %164, i32* %165, align 4
  %166 = add nuw nsw i64 %86, 16
  %167 = icmp ult i64 %161, 63
  br i1 %167, label %85, label %168

168:                                              ; preds = %85
  tail call void @llvm.aie.lock.release.reg(i32 52, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 54, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 53, i32 0)
  br label %169

169:                                              ; preds = %169, %168
  %170 = phi i64 [ 0, %168 ], [ %250, %169 ]
  %171 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %170
  %172 = load i32, i32* %171, align 4
  %173 = add i32 %172, 1
  %174 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %170
  store i32 %173, i32* %174, align 4
  %175 = or i64 %170, 1
  %176 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %175
  %177 = load i32, i32* %176, align 4
  %178 = add i32 %177, 1
  %179 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %175
  store i32 %178, i32* %179, align 4
  %180 = or i64 %170, 2
  %181 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %180
  %182 = load i32, i32* %181, align 4
  %183 = add i32 %182, 1
  %184 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %180
  store i32 %183, i32* %184, align 4
  %185 = or i64 %170, 3
  %186 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %185
  %187 = load i32, i32* %186, align 4
  %188 = add i32 %187, 1
  %189 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %185
  store i32 %188, i32* %189, align 4
  %190 = or i64 %170, 4
  %191 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %190
  %192 = load i32, i32* %191, align 4
  %193 = add i32 %192, 1
  %194 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %190
  store i32 %193, i32* %194, align 4
  %195 = or i64 %170, 5
  %196 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %195
  %197 = load i32, i32* %196, align 4
  %198 = add i32 %197, 1
  %199 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %195
  store i32 %198, i32* %199, align 4
  %200 = or i64 %170, 6
  %201 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %200
  %202 = load i32, i32* %201, align 4
  %203 = add i32 %202, 1
  %204 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %200
  store i32 %203, i32* %204, align 4
  %205 = or i64 %170, 7
  %206 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %205
  %207 = load i32, i32* %206, align 4
  %208 = add i32 %207, 1
  %209 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %205
  store i32 %208, i32* %209, align 4
  %210 = or i64 %170, 8
  %211 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %210
  %212 = load i32, i32* %211, align 4
  %213 = add i32 %212, 1
  %214 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %210
  store i32 %213, i32* %214, align 4
  %215 = or i64 %170, 9
  %216 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %215
  %217 = load i32, i32* %216, align 4
  %218 = add i32 %217, 1
  %219 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %215
  store i32 %218, i32* %219, align 4
  %220 = or i64 %170, 10
  %221 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %220
  %222 = load i32, i32* %221, align 4
  %223 = add i32 %222, 1
  %224 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %220
  store i32 %223, i32* %224, align 4
  %225 = or i64 %170, 11
  %226 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %225
  %227 = load i32, i32* %226, align 4
  %228 = add i32 %227, 1
  %229 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %225
  store i32 %228, i32* %229, align 4
  %230 = or i64 %170, 12
  %231 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %230
  %232 = load i32, i32* %231, align 4
  %233 = add i32 %232, 1
  %234 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %230
  store i32 %233, i32* %234, align 4
  %235 = or i64 %170, 13
  %236 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %235
  %237 = load i32, i32* %236, align 4
  %238 = add i32 %237, 1
  %239 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %235
  store i32 %238, i32* %239, align 4
  %240 = or i64 %170, 14
  %241 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %240
  %242 = load i32, i32* %241, align 4
  %243 = add i32 %242, 1
  %244 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %240
  store i32 %243, i32* %244, align 4
  %245 = or i64 %170, 15
  %246 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %245
  %247 = load i32, i32* %246, align 4
  %248 = add i32 %247, 1
  %249 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %245
  store i32 %248, i32* %249, align 4
  %250 = add nuw nsw i64 %170, 16
  %251 = icmp ult i64 %245, 63
  br i1 %251, label %169, label %252

252:                                              ; preds = %169
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 53, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 52, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 54, i32 0)
  br label %253

253:                                              ; preds = %253, %252
  %254 = phi i64 [ 0, %252 ], [ %334, %253 ]
  %255 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %254
  %256 = load i32, i32* %255, align 4
  %257 = add i32 %256, 1
  %258 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %254
  store i32 %257, i32* %258, align 4
  %259 = or i64 %254, 1
  %260 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %259
  %261 = load i32, i32* %260, align 4
  %262 = add i32 %261, 1
  %263 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %259
  store i32 %262, i32* %263, align 4
  %264 = or i64 %254, 2
  %265 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %264
  %266 = load i32, i32* %265, align 4
  %267 = add i32 %266, 1
  %268 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %264
  store i32 %267, i32* %268, align 4
  %269 = or i64 %254, 3
  %270 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %269
  %271 = load i32, i32* %270, align 4
  %272 = add i32 %271, 1
  %273 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %269
  store i32 %272, i32* %273, align 4
  %274 = or i64 %254, 4
  %275 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %274
  %276 = load i32, i32* %275, align 4
  %277 = add i32 %276, 1
  %278 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %274
  store i32 %277, i32* %278, align 4
  %279 = or i64 %254, 5
  %280 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %279
  %281 = load i32, i32* %280, align 4
  %282 = add i32 %281, 1
  %283 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %279
  store i32 %282, i32* %283, align 4
  %284 = or i64 %254, 6
  %285 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %284
  %286 = load i32, i32* %285, align 4
  %287 = add i32 %286, 1
  %288 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %284
  store i32 %287, i32* %288, align 4
  %289 = or i64 %254, 7
  %290 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %289
  %291 = load i32, i32* %290, align 4
  %292 = add i32 %291, 1
  %293 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %289
  store i32 %292, i32* %293, align 4
  %294 = or i64 %254, 8
  %295 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %294
  %296 = load i32, i32* %295, align 4
  %297 = add i32 %296, 1
  %298 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %294
  store i32 %297, i32* %298, align 4
  %299 = or i64 %254, 9
  %300 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %299
  %301 = load i32, i32* %300, align 4
  %302 = add i32 %301, 1
  %303 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %299
  store i32 %302, i32* %303, align 4
  %304 = or i64 %254, 10
  %305 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %304
  %306 = load i32, i32* %305, align 4
  %307 = add i32 %306, 1
  %308 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %304
  store i32 %307, i32* %308, align 4
  %309 = or i64 %254, 11
  %310 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %309
  %311 = load i32, i32* %310, align 4
  %312 = add i32 %311, 1
  %313 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %309
  store i32 %312, i32* %313, align 4
  %314 = or i64 %254, 12
  %315 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %314
  %316 = load i32, i32* %315, align 4
  %317 = add i32 %316, 1
  %318 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %314
  store i32 %317, i32* %318, align 4
  %319 = or i64 %254, 13
  %320 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %319
  %321 = load i32, i32* %320, align 4
  %322 = add i32 %321, 1
  %323 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %319
  store i32 %322, i32* %323, align 4
  %324 = or i64 %254, 14
  %325 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %324
  %326 = load i32, i32* %325, align 4
  %327 = add i32 %326, 1
  %328 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %324
  store i32 %327, i32* %328, align 4
  %329 = or i64 %254, 15
  %330 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %329
  %331 = load i32, i32* %330, align 4
  %332 = add i32 %331, 1
  %333 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %329
  store i32 %332, i32* %333, align 4
  %334 = add nuw nsw i64 %254, 16
  %335 = icmp ult i64 %329, 63
  br i1 %335, label %253, label %336

336:                                              ; preds = %253
  tail call void @llvm.aie.lock.release.reg(i32 52, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 54, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 53, i32 0)
  br label %337

337:                                              ; preds = %337, %336
  %338 = phi i64 [ 0, %336 ], [ %418, %337 ]
  %339 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %338
  %340 = load i32, i32* %339, align 4
  %341 = add i32 %340, 1
  %342 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %338
  store i32 %341, i32* %342, align 4
  %343 = or i64 %338, 1
  %344 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %343
  %345 = load i32, i32* %344, align 4
  %346 = add i32 %345, 1
  %347 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %343
  store i32 %346, i32* %347, align 4
  %348 = or i64 %338, 2
  %349 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %348
  %350 = load i32, i32* %349, align 4
  %351 = add i32 %350, 1
  %352 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %348
  store i32 %351, i32* %352, align 4
  %353 = or i64 %338, 3
  %354 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %353
  %355 = load i32, i32* %354, align 4
  %356 = add i32 %355, 1
  %357 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %353
  store i32 %356, i32* %357, align 4
  %358 = or i64 %338, 4
  %359 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %358
  %360 = load i32, i32* %359, align 4
  %361 = add i32 %360, 1
  %362 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %358
  store i32 %361, i32* %362, align 4
  %363 = or i64 %338, 5
  %364 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %363
  %365 = load i32, i32* %364, align 4
  %366 = add i32 %365, 1
  %367 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %363
  store i32 %366, i32* %367, align 4
  %368 = or i64 %338, 6
  %369 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %368
  %370 = load i32, i32* %369, align 4
  %371 = add i32 %370, 1
  %372 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %368
  store i32 %371, i32* %372, align 4
  %373 = or i64 %338, 7
  %374 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %373
  %375 = load i32, i32* %374, align 4
  %376 = add i32 %375, 1
  %377 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %373
  store i32 %376, i32* %377, align 4
  %378 = or i64 %338, 8
  %379 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %378
  %380 = load i32, i32* %379, align 4
  %381 = add i32 %380, 1
  %382 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %378
  store i32 %381, i32* %382, align 4
  %383 = or i64 %338, 9
  %384 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %383
  %385 = load i32, i32* %384, align 4
  %386 = add i32 %385, 1
  %387 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %383
  store i32 %386, i32* %387, align 4
  %388 = or i64 %338, 10
  %389 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %388
  %390 = load i32, i32* %389, align 4
  %391 = add i32 %390, 1
  %392 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %388
  store i32 %391, i32* %392, align 4
  %393 = or i64 %338, 11
  %394 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %393
  %395 = load i32, i32* %394, align 4
  %396 = add i32 %395, 1
  %397 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %393
  store i32 %396, i32* %397, align 4
  %398 = or i64 %338, 12
  %399 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %398
  %400 = load i32, i32* %399, align 4
  %401 = add i32 %400, 1
  %402 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %398
  store i32 %401, i32* %402, align 4
  %403 = or i64 %338, 13
  %404 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %403
  %405 = load i32, i32* %404, align 4
  %406 = add i32 %405, 1
  %407 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %403
  store i32 %406, i32* %407, align 4
  %408 = or i64 %338, 14
  %409 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %408
  %410 = load i32, i32* %409, align 4
  %411 = add i32 %410, 1
  %412 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %408
  store i32 %411, i32* %412, align 4
  %413 = or i64 %338, 15
  %414 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %413
  %415 = load i32, i32* %414, align 4
  %416 = add i32 %415, 1
  %417 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %413
  store i32 %416, i32* %417, align 4
  %418 = add nuw nsw i64 %338, 16
  %419 = icmp ult i64 %413, 63
  br i1 %419, label %337, label %420

420:                                              ; preds = %337
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 53, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 52, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 54, i32 0)
  br label %421

421:                                              ; preds = %421, %420
  %422 = phi i64 [ 0, %420 ], [ %502, %421 ]
  %423 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %422
  %424 = load i32, i32* %423, align 4
  %425 = add i32 %424, 1
  %426 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %422
  store i32 %425, i32* %426, align 4
  %427 = or i64 %422, 1
  %428 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %427
  %429 = load i32, i32* %428, align 4
  %430 = add i32 %429, 1
  %431 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %427
  store i32 %430, i32* %431, align 4
  %432 = or i64 %422, 2
  %433 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %432
  %434 = load i32, i32* %433, align 4
  %435 = add i32 %434, 1
  %436 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %432
  store i32 %435, i32* %436, align 4
  %437 = or i64 %422, 3
  %438 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %437
  %439 = load i32, i32* %438, align 4
  %440 = add i32 %439, 1
  %441 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %437
  store i32 %440, i32* %441, align 4
  %442 = or i64 %422, 4
  %443 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %442
  %444 = load i32, i32* %443, align 4
  %445 = add i32 %444, 1
  %446 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %442
  store i32 %445, i32* %446, align 4
  %447 = or i64 %422, 5
  %448 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %447
  %449 = load i32, i32* %448, align 4
  %450 = add i32 %449, 1
  %451 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %447
  store i32 %450, i32* %451, align 4
  %452 = or i64 %422, 6
  %453 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %452
  %454 = load i32, i32* %453, align 4
  %455 = add i32 %454, 1
  %456 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %452
  store i32 %455, i32* %456, align 4
  %457 = or i64 %422, 7
  %458 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %457
  %459 = load i32, i32* %458, align 4
  %460 = add i32 %459, 1
  %461 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %457
  store i32 %460, i32* %461, align 4
  %462 = or i64 %422, 8
  %463 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %462
  %464 = load i32, i32* %463, align 4
  %465 = add i32 %464, 1
  %466 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %462
  store i32 %465, i32* %466, align 4
  %467 = or i64 %422, 9
  %468 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %467
  %469 = load i32, i32* %468, align 4
  %470 = add i32 %469, 1
  %471 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %467
  store i32 %470, i32* %471, align 4
  %472 = or i64 %422, 10
  %473 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %472
  %474 = load i32, i32* %473, align 4
  %475 = add i32 %474, 1
  %476 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %472
  store i32 %475, i32* %476, align 4
  %477 = or i64 %422, 11
  %478 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %477
  %479 = load i32, i32* %478, align 4
  %480 = add i32 %479, 1
  %481 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %477
  store i32 %480, i32* %481, align 4
  %482 = or i64 %422, 12
  %483 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %482
  %484 = load i32, i32* %483, align 4
  %485 = add i32 %484, 1
  %486 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %482
  store i32 %485, i32* %486, align 4
  %487 = or i64 %422, 13
  %488 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %487
  %489 = load i32, i32* %488, align 4
  %490 = add i32 %489, 1
  %491 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %487
  store i32 %490, i32* %491, align 4
  %492 = or i64 %422, 14
  %493 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %492
  %494 = load i32, i32* %493, align 4
  %495 = add i32 %494, 1
  %496 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %492
  store i32 %495, i32* %496, align 4
  %497 = or i64 %422, 15
  %498 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %497
  %499 = load i32, i32* %498, align 4
  %500 = add i32 %499, 1
  %501 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %497
  store i32 %500, i32* %501, align 4
  %502 = add nuw nsw i64 %422, 16
  %503 = icmp ult i64 %497, 63
  br i1 %503, label %421, label %504

504:                                              ; preds = %421
  tail call void @llvm.aie.lock.release.reg(i32 52, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 54, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 53, i32 0)
  br label %505

505:                                              ; preds = %505, %504
  %506 = phi i64 [ 0, %504 ], [ %586, %505 ]
  %507 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %506
  %508 = load i32, i32* %507, align 4
  %509 = add i32 %508, 1
  %510 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %506
  store i32 %509, i32* %510, align 4
  %511 = or i64 %506, 1
  %512 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %511
  %513 = load i32, i32* %512, align 4
  %514 = add i32 %513, 1
  %515 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %511
  store i32 %514, i32* %515, align 4
  %516 = or i64 %506, 2
  %517 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %516
  %518 = load i32, i32* %517, align 4
  %519 = add i32 %518, 1
  %520 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %516
  store i32 %519, i32* %520, align 4
  %521 = or i64 %506, 3
  %522 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %521
  %523 = load i32, i32* %522, align 4
  %524 = add i32 %523, 1
  %525 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %521
  store i32 %524, i32* %525, align 4
  %526 = or i64 %506, 4
  %527 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %526
  %528 = load i32, i32* %527, align 4
  %529 = add i32 %528, 1
  %530 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %526
  store i32 %529, i32* %530, align 4
  %531 = or i64 %506, 5
  %532 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %531
  %533 = load i32, i32* %532, align 4
  %534 = add i32 %533, 1
  %535 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %531
  store i32 %534, i32* %535, align 4
  %536 = or i64 %506, 6
  %537 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %536
  %538 = load i32, i32* %537, align 4
  %539 = add i32 %538, 1
  %540 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %536
  store i32 %539, i32* %540, align 4
  %541 = or i64 %506, 7
  %542 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %541
  %543 = load i32, i32* %542, align 4
  %544 = add i32 %543, 1
  %545 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %541
  store i32 %544, i32* %545, align 4
  %546 = or i64 %506, 8
  %547 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %546
  %548 = load i32, i32* %547, align 4
  %549 = add i32 %548, 1
  %550 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %546
  store i32 %549, i32* %550, align 4
  %551 = or i64 %506, 9
  %552 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %551
  %553 = load i32, i32* %552, align 4
  %554 = add i32 %553, 1
  %555 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %551
  store i32 %554, i32* %555, align 4
  %556 = or i64 %506, 10
  %557 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %556
  %558 = load i32, i32* %557, align 4
  %559 = add i32 %558, 1
  %560 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %556
  store i32 %559, i32* %560, align 4
  %561 = or i64 %506, 11
  %562 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %561
  %563 = load i32, i32* %562, align 4
  %564 = add i32 %563, 1
  %565 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %561
  store i32 %564, i32* %565, align 4
  %566 = or i64 %506, 12
  %567 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %566
  %568 = load i32, i32* %567, align 4
  %569 = add i32 %568, 1
  %570 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %566
  store i32 %569, i32* %570, align 4
  %571 = or i64 %506, 13
  %572 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %571
  %573 = load i32, i32* %572, align 4
  %574 = add i32 %573, 1
  %575 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %571
  store i32 %574, i32* %575, align 4
  %576 = or i64 %506, 14
  %577 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %576
  %578 = load i32, i32* %577, align 4
  %579 = add i32 %578, 1
  %580 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %576
  store i32 %579, i32* %580, align 4
  %581 = or i64 %506, 15
  %582 = getelementptr [64 x i32], [64 x i32]* @a_ping, i64 0, i64 %581
  %583 = load i32, i32* %582, align 4
  %584 = add i32 %583, 1
  %585 = getelementptr [64 x i32], [64 x i32]* @b_ping, i64 0, i64 %581
  store i32 %584, i32* %585, align 4
  %586 = add nuw nsw i64 %506, 16
  %587 = icmp ult i64 %581, 63
  br i1 %587, label %505, label %588

588:                                              ; preds = %505
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 53, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 52, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 54, i32 0)
  br label %589

589:                                              ; preds = %589, %588
  %590 = phi i64 [ 0, %588 ], [ %670, %589 ]
  %591 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %590
  %592 = load i32, i32* %591, align 4
  %593 = add i32 %592, 1
  %594 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %590
  store i32 %593, i32* %594, align 4
  %595 = or i64 %590, 1
  %596 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %595
  %597 = load i32, i32* %596, align 4
  %598 = add i32 %597, 1
  %599 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %595
  store i32 %598, i32* %599, align 4
  %600 = or i64 %590, 2
  %601 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %600
  %602 = load i32, i32* %601, align 4
  %603 = add i32 %602, 1
  %604 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %600
  store i32 %603, i32* %604, align 4
  %605 = or i64 %590, 3
  %606 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %605
  %607 = load i32, i32* %606, align 4
  %608 = add i32 %607, 1
  %609 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %605
  store i32 %608, i32* %609, align 4
  %610 = or i64 %590, 4
  %611 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %610
  %612 = load i32, i32* %611, align 4
  %613 = add i32 %612, 1
  %614 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %610
  store i32 %613, i32* %614, align 4
  %615 = or i64 %590, 5
  %616 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %615
  %617 = load i32, i32* %616, align 4
  %618 = add i32 %617, 1
  %619 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %615
  store i32 %618, i32* %619, align 4
  %620 = or i64 %590, 6
  %621 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %620
  %622 = load i32, i32* %621, align 4
  %623 = add i32 %622, 1
  %624 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %620
  store i32 %623, i32* %624, align 4
  %625 = or i64 %590, 7
  %626 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %625
  %627 = load i32, i32* %626, align 4
  %628 = add i32 %627, 1
  %629 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %625
  store i32 %628, i32* %629, align 4
  %630 = or i64 %590, 8
  %631 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %630
  %632 = load i32, i32* %631, align 4
  %633 = add i32 %632, 1
  %634 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %630
  store i32 %633, i32* %634, align 4
  %635 = or i64 %590, 9
  %636 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %635
  %637 = load i32, i32* %636, align 4
  %638 = add i32 %637, 1
  %639 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %635
  store i32 %638, i32* %639, align 4
  %640 = or i64 %590, 10
  %641 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %640
  %642 = load i32, i32* %641, align 4
  %643 = add i32 %642, 1
  %644 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %640
  store i32 %643, i32* %644, align 4
  %645 = or i64 %590, 11
  %646 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %645
  %647 = load i32, i32* %646, align 4
  %648 = add i32 %647, 1
  %649 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %645
  store i32 %648, i32* %649, align 4
  %650 = or i64 %590, 12
  %651 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %650
  %652 = load i32, i32* %651, align 4
  %653 = add i32 %652, 1
  %654 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %650
  store i32 %653, i32* %654, align 4
  %655 = or i64 %590, 13
  %656 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %655
  %657 = load i32, i32* %656, align 4
  %658 = add i32 %657, 1
  %659 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %655
  store i32 %658, i32* %659, align 4
  %660 = or i64 %590, 14
  %661 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %660
  %662 = load i32, i32* %661, align 4
  %663 = add i32 %662, 1
  %664 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %660
  store i32 %663, i32* %664, align 4
  %665 = or i64 %590, 15
  %666 = getelementptr [64 x i32], [64 x i32]* @a_pong, i64 0, i64 %665
  %667 = load i32, i32* %666, align 4
  %668 = add i32 %667, 1
  %669 = getelementptr [64 x i32], [64 x i32]* @b_pong, i64 0, i64 %665
  store i32 %668, i32* %669, align 4
  %670 = add nuw nsw i64 %590, 16
  %671 = icmp ult i64 %665, 63
  br i1 %671, label %589, label %672

672:                                              ; preds = %589
  tail call void @llvm.aie.lock.release.reg(i32 52, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 54, i32 1)
  ret void
}

; Function Attrs: nounwind
define void @_main() local_unnamed_addr #0 {
  tail call void @core73()
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nounwind }
attributes #1 = { inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
