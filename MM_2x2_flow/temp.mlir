module @test_single_kernel {
  %0 = AIE.tile(6, 2)
  %1 = AIE.tile(6, 3)
  %2 = AIE.tile(6, 4)
  %3 = AIE.tile(7, 0)
  %4 = AIE.tile(7, 2)
  %5 = AIE.tile(7, 3)
  %6 = AIE.tile(7, 4)
  %7 = AIE.buffer(%4) {sym_name = "buf72_0"} : memref<1024xi32>
  %8 = AIE.buffer(%4) {sym_name = "buf72_1"} : memref<1024xi32>
  %9 = AIE.buffer(%4) {sym_name = "buf72_2"} : memref<1024xi32>
  %10 = AIE.buffer(%4) {sym_name = "buf72_3"} : memref<1024xi32>
  %11 = AIE.buffer(%1) {sym_name = "buf63_0"} : memref<1024xi32>
  %12 = AIE.buffer(%1) {sym_name = "buf63_1"} : memref<1024xi32>
  %13 = AIE.buffer(%1) {sym_name = "buf63_2"} : memref<1024xi32>
  %14 = AIE.buffer(%1) {sym_name = "buf63_3"} : memref<1024xi32>
  %15 = AIE.buffer(%2) {sym_name = "buf64_0"} : memref<1024xi32>
  %16 = AIE.buffer(%2) {sym_name = "buf64_1"} : memref<1024xi32>
  %17 = AIE.buffer(%2) {sym_name = "buf64_2"} : memref<1024xi32>
  %18 = AIE.buffer(%5) {sym_name = "buf73_0"} : memref<1024xi32>
  %19 = AIE.buffer(%5) {sym_name = "buf73_1"} : memref<1024xi32>
  %20 = AIE.buffer(%5) {sym_name = "buf73_2"} : memref<1024xi32>
  %21 = AIE.buffer(%5) {sym_name = "buf73_3"} : memref<1024xi32>
  %22 = AIE.buffer(%6) {sym_name = "buf74_0"} : memref<1024xi32>
  %23 = AIE.buffer(%6) {sym_name = "buf74_1"} : memref<1024xi32>
  %24 = AIE.buffer(%6) {sym_name = "buf74_2"} : memref<1024xi32>
  %25 = AIE.mem(%4) {
    %46 = AIE.lock(%4, 4)
    %47 = AIE.lock(%4, 5)
    %48 = AIE.lock(%4, 6)
    %49 = AIE.lock(%4, 7)
    %50 = AIE.dmaStart(MM2S0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %51 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb2:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%46, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%7 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 1)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%47, Acquire, 0)
    AIE.dmaBdPacket(1, 1)
    AIE.dmaBd(<%8 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 1)
    cf.br ^bb2
  ^bb4:  // 2 preds: ^bb1, ^bb5
    AIE.useLock(%48, Acquire, 0)
    AIE.dmaBdPacket(2, 2)
    AIE.dmaBd(<%9 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 1)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%49, Acquire, 0)
    AIE.dmaBdPacket(3, 3)
    AIE.dmaBd(<%10 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%49, Release, 1)
    cf.br ^bb4
  ^bb6:  // pred: ^bb1
    AIE.end
  }
  %26 = AIE.lock(%1, 0)
  %27 = AIE.lock(%1, 1)
  %28 = AIE.mem(%1) {
    %46 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %47 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%26, Acquire, 0)
    AIE.dmaBd(<%11 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%26, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%27, Acquire, 0)
    AIE.dmaBd(<%12 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%27, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %29 = AIE.lock(%2, 0)
  %30 = AIE.lock(%2, 1)
  %31 = AIE.mem(%2) {
    %46 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %47 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%29, Acquire, 0)
    AIE.dmaBd(<%15 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%30, Acquire, 0)
    AIE.dmaBd(<%16 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  func private @extern_kernel(memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>)
  %32 = AIE.lock(%1, 3)
  %33 = AIE.core(%1) {
    AIE.useLock(%26, Acquire, 1)
    AIE.useLock(%27, Acquire, 1)
    AIE.useLock(%32, Acquire, 0)
    call @extern_kernel(%11, %12, %13, %14) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%32, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %34 = AIE.lock(%2, 2)
  %35 = AIE.core(%2) {
    AIE.useLock(%32, Acquire, 1)
    AIE.useLock(%29, Acquire, 1)
    AIE.useLock(%30, Acquire, 1)
    AIE.useLock(%34, Acquire, 0)
    call @extern_kernel(%15, %16, %14, %17) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%34, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %36 = AIE.lock(%5, 0)
  %37 = AIE.lock(%5, 1)
  %38 = AIE.mem(%5) {
    %46 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %47 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%36, Acquire, 0)
    AIE.dmaBd(<%18 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%36, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%37, Acquire, 0)
    AIE.dmaBd(<%19 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%37, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %39 = AIE.lock(%6, 0)
  %40 = AIE.lock(%6, 1)
  %41 = AIE.mem(%6) {
    %46 = AIE.dmaStart(S2MM0, ^bb2, ^bb1)
  ^bb1:  // pred: ^bb0
    %47 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb2:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%39, Acquire, 0)
    AIE.dmaBd(<%22 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%39, Release, 1)
    cf.br ^bb2
  ^bb3:  // 2 preds: ^bb1, ^bb3
    AIE.useLock(%40, Acquire, 0)
    AIE.dmaBd(<%23 : memref<1024xi32>, 0, 1024>, 0)
    AIE.useLock(%40, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb1
    AIE.end
  }
  %42 = AIE.lock(%5, 2)
  %43 = AIE.core(%5) {
    AIE.useLock(%36, Acquire, 1)
    AIE.useLock(%37, Acquire, 1)
    AIE.useLock(%42, Acquire, 0)
    call @extern_kernel(%18, %19, %20, %21) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%42, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %44 = AIE.lock(%6, 2)
  %45 = AIE.core(%6) {
    AIE.useLock(%42, Acquire, 1)
    AIE.useLock(%39, Acquire, 1)
    AIE.useLock(%40, Acquire, 1)
    AIE.useLock(%44, Acquire, 0)
    call @extern_kernel(%22, %23, %21, %24) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    AIE.useLock(%44, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  AIE.packet_flow(0) {
    AIE.packet_source<%4, DMA : 0>
    AIE.packet_dest<%5, DMA : 0>
    AIE.packet_dest<%1, DMA : 0>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%4, DMA : 0>
    AIE.packet_dest<%6, DMA : 0>
    AIE.packet_dest<%2, DMA : 0>
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%4, DMA : 1>
    AIE.packet_dest<%5, DMA : 1>
    AIE.packet_dest<%1, DMA : 1>
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%4, DMA : 1>
    AIE.packet_dest<%6, DMA : 1>
    AIE.packet_dest<%2, DMA : 1>
  }
}

