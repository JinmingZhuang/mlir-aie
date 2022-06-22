
module @broadpacket0 {
    %70 = AIE.tile(7, 0)
    %73 = AIE.tile(7, 3)
    %74 = AIE.tile(7, 4)
    %63 = AIE.tile(6, 3)
    %64 = AIE.tile(6, 4)
    AIE.broad_packet{
      AIE.bp_source<%70, "DMA" : 0>
      AIE.bp_id(0x0){
        AIE.bp_dest<%73, "DMA" : 0>
        AIE.bp_dest<%63, "DMA" : 0>
      }
      AIE.bp_id(0x1){
        AIE.bp_dest<%74, "DMA" : 0>
        AIE.bp_dest<%64, "DMA" : 0>
      }
    }
}