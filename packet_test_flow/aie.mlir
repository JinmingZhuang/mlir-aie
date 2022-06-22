module @test_single_kernel {
  %t70 = AIE.tile(7, 0)
  %t72 = AIE.tile(7, 2)
  %t73 = AIE.tile(7, 3)
  %t74 = AIE.tile(7, 4)
  
   %buffer0 = AIE.external_buffer 0x020100004000 : memref<256 x i32>



  %buf72_0 = AIE.buffer(%t72) {sym_name = "buf72_0"} : memref<256xi32>
  %buf74_0 = AIE.buffer(%t74) {sym_name = "buf74_0"}: memref<256xi32>


  AIE.flow(%t70, "DMA" : 0, %t72, "DMA" : 0)
  
  //%sw72 = AIE.switchbox(%t72) {
  //  AIE.connect<"DMA" : 0, "North" : 3>
  //}
  

  //%sw73 = AIE.switchbox(%t73) {
  //  %tmsel = AIE.amsel<1> (0) // <arbiter> (mask). mask is msel_enable
  //  %tmaster = AIE.masterset(North : 3, %tmsel)
  //  AIE.packetrules(South : 3)  {
  //    AIE.rule(0x1f, 0xd, %tmsel) // (mask, id)
  //  }
  //}
//
  //%sw74 = AIE.switchbox(%t74) {
  //  %tmsel = AIE.amsel<1> (0) // <arbiter> (mask). mask is msel_enable
  //  %tmaster = AIE.masterset(DMA : 0, %tmsel)
  //  AIE.packetrules(South : 3)  {
  //    AIE.rule(0x1f, 0xd, %tmsel) // (mask, id)
  //  }
  //}

  AIE.packet_flow(0xd) {
    AIE.packet_source<%t72, DMA : 0>
    AIE.packet_dest<%t74, DMA : 0>
  }
  

  %dma = AIE.shimDMA(%t70) {
    %lock1 = AIE.lock(%t70, 1)
    AIE.dmaStart(MM2S0, ^bd0, ^end)
    ^bd0:
      AIE.useLock(%lock1, Acquire, 1)
      AIE.dmaBd(<%buffer0 : memref<256 x i32>, 0, 256>, 0)
      AIE.useLock(%lock1, Release, 0)
      cf.br ^bd0
    ^end:
      AIE.end
  }

  %lock72_1 = AIE.lock(%t72, 1)

  %m72 = AIE.mem(%t72)  {
  %srcDma0 = AIE.dmaStart("S2MM0", ^bb2, ^dma)
  ^dma:
      %srcDma1 = AIE.dmaStart("MM2S0", ^bb3, ^end)
  ^bb2: 
    AIE.useLock(%lock72_1, Acquire, 0)
    AIE.dmaBd(<%buf72_0 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%lock72_1, Release, 1)
    cf.br ^bb2
  ^bb3: 
    AIE.useLock(%lock72_1, Acquire, 1)
    AIE.dmaBdPacket(0x1, 0xd)
    AIE.dmaBd(<%buf72_0 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%lock72_1, Release, 0)
    cf.br ^bb3
  ^end: 
    AIE.end
  }

  %lock74_1 = AIE.lock(%t74, 1)
  %m74 = AIE.mem(%t74)  {
    %srcDma = AIE.dmaStart("S2MM0", ^bb2, ^end)
  ^bb2: 
    AIE.useLock(%lock74_1, Acquire, 0)
    AIE.dmaBdPacket(0x1, 0xd)
    AIE.dmaBd(<%buf74_0 : memref<256xi32>, 0, 256>, 0)
    AIE.useLock(%lock74_1, Release, 1)
    cf.br ^end
  ^end: 
    AIE.end
  }

}