void mlir_aie_configure_cores(aie_libxaie_ctx_t* ctx) {
} // mlir_aie_configure_cores

void mlir_aie_start_cores(aie_libxaie_ctx_t* ctx) {
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(7,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(7,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(7,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(7,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(7,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(7,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(7,4));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(7,4));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(0,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(0,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(0,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(0,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(0,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(0,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(0,4));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(0,4));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(1,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(1,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(1,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(1,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(1,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(1,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(1,4));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(1,4));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(2,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(2,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(2,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(2,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(2,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(2,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(2,4));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(2,4));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(3,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(3,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(3,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(3,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(3,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(3,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(3,4));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(3,4));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(4,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(4,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(4,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(4,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(4,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(4,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(4,4));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(4,4));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(5,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(5,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(5,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(5,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(5,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(5,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(5,4));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(5,4));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,4));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,4));
} // mlir_aie_start_cores

void mlir_aie_configure_dmas(aie_libxaie_ctx_t* ctx) {
XAie_DmaDesc dma_tile72_bd0;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile72_bd0), XAie_TileLoc(7,2));
XAie_DmaSetLock(&(dma_tile72_bd0), XAie_LockInit(1,0),XAie_LockInit(1,1));
XAie_DmaSetAddrLen(&(dma_tile72_bd0),  /* addrA */ 0x1000,  /* len */ 256 * 4);
XAie_DmaSetNextBd(&(dma_tile72_bd0),  /* nextbd */ 0,  /* enableNextBd */ 1);
XAie_DmaSetPkt(&(dma_tile72_bd0), XAie_PacketInit(12,4));
XAie_DmaEnableBd(&(dma_tile72_bd0));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile72_bd0), XAie_TileLoc(7,2),  /* bd */ 0);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,2), /* ChNum */0, /* dmaDir */ DMA_S2MM, /* BdNum */0);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,2), /* ChNum */ 0, /* dmaDir */ DMA_S2MM);
XAie_DmaDesc dma_tile74_bd0;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile74_bd0), XAie_TileLoc(7,4));
XAie_DmaSetLock(&(dma_tile74_bd0), XAie_LockInit(1,0),XAie_LockInit(1,1));
XAie_DmaSetAddrLen(&(dma_tile74_bd0),  /* addrA */ 0x1000,  /* len */ 256 * 4);
XAie_DmaSetNextBd(&(dma_tile74_bd0),  /* nextbd */ 0,  /* enableNextBd */ 1);
XAie_DmaSetPkt(&(dma_tile74_bd0), XAie_PacketInit(13,5));
XAie_DmaEnableBd(&(dma_tile74_bd0));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile74_bd0), XAie_TileLoc(7,4),  /* bd */ 0);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,4), /* ChNum */0, /* dmaDir */ DMA_S2MM, /* BdNum */0);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,4), /* ChNum */ 0, /* dmaDir */ DMA_S2MM);
} // mlir_aie_configure_dmas

static u64 _mlir_aie_external_myBuffer_70_0 = 0x20100004000;
void mlir_aie_external_set_addr_myBuffer_70_0(u64 addr) {
    _mlir_aie_external_myBuffer_70_0 = addr;
}
u64 mlir_aie_external_get_addr_myBuffer_70_0(void) {
    return _mlir_aie_external_myBuffer_70_0;
}
static u64 _mlir_aie_external_myBuffer_70_1 = 0x20100005000;
void mlir_aie_external_set_addr_myBuffer_70_1(u64 addr) {
    _mlir_aie_external_myBuffer_70_1 = addr;
}
u64 mlir_aie_external_get_addr_myBuffer_70_1(void) {
    return _mlir_aie_external_myBuffer_70_1;
}
void mlir_aie_configure_shimdma_70(aie_libxaie_ctx_t* ctx) {
XAie_DmaDesc dma_tile70_bd0;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile70_bd0), XAie_TileLoc(7,0));
XAie_DmaSetLock(&(dma_tile70_bd0), XAie_LockInit(1,1),XAie_LockInit(1,0));
XAie_DmaSetAddrLen(&(dma_tile70_bd0),  /* addr */ mlir_aie_external_get_addr_myBuffer_70_0(),  /* len */ 257 * 4);
XAie_DmaSetAxi(&(dma_tile70_bd0), /* smid */ 0, /* burstlen */ 4, /* QoS */ 0 , /* Cache */ 0, /* Secure */ XAIE_ENABLE);
XAie_DmaSetNextBd(&(dma_tile70_bd0),  /* nextbd */ 1,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile70_bd0));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile70_bd0), XAie_TileLoc(7,0),  /* bd */ 0);
XAie_DmaDesc dma_tile70_bd1;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile70_bd1), XAie_TileLoc(7,0));
XAie_DmaSetLock(&(dma_tile70_bd1), XAie_LockInit(2,1),XAie_LockInit(2,0));
XAie_DmaSetAddrLen(&(dma_tile70_bd1),  /* addr */ mlir_aie_external_get_addr_myBuffer_70_1(),  /* len */ 257 * 4);
XAie_DmaSetAxi(&(dma_tile70_bd1), /* smid */ 0, /* burstlen */ 4, /* QoS */ 0 , /* Cache */ 0, /* Secure */ XAIE_ENABLE);
XAie_DmaSetNextBd(&(dma_tile70_bd1),  /* nextbd */ 0,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile70_bd1));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile70_bd1), XAie_TileLoc(7,0),  /* bd */ 1);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,0), /* ChNum */0, /* dmaDir */ DMA_MM2S, /* BdNum */0);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,0), /* ChNum */ 0, /* dmaDir */ DMA_MM2S);
} // mlir_aie_configure_shimdma

void mlir_aie_initialize_locks(aie_libxaie_ctx_t* ctx) {
} // mlir_aie_initialize_locks
void mlir_aie_configure_switchboxes(aie_libxaie_ctx_t* ctx) {
  int x, y;
// Core Stream Switch column 7 row 1
x = 7;
y = 1;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 3, NORTH, 3);
// Core Stream Switch column 7 row 0
x = 7;
y = 0;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 3, NORTH, 3);
// Core Stream Switch column 7 row 2
x = 7;
y = 2;
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 0, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 1, /* MSelEn */ 1);
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), NORTH, 3, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 1, /* MSelEn */ 1);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 3);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 3, /* slot */ 0, /* packet */ XAie_PacketInit(12,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 1);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 3);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 3, /* slot */ 1, /* packet */ XAie_PacketInit(13,0), /* mask */ 0x1F, /* msel */ 1, /* arbiter */ 1);
// Core Stream Switch column 7 row 3
x = 7;
y = 3;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 3, NORTH, 3);
// Core Stream Switch column 7 row 4
x = 7;
y = 4;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 3, DMA, 0);
// ShimMux column 7 row 0
// NOTE ShimMux always connects from the south as directions are defined relative to the tile stream switch
x = 7;
y = 0;
XAie_EnableShimDmaToAieStrmPort(&(ctx->DevInst), XAie_TileLoc(x,y), 3);
} // mlir_aie_configure_switchboxes

const int buf72_0_offset = 4096;
int32_t mlir_aie_read_buffer_buf72_0(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,2), buf72_0_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf72_0(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,2), buf72_0_offset + (index*4), int_value);
}
const int buf74_0_offset = 4096;
int32_t mlir_aie_read_buffer_buf74_0(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,4), buf74_0_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf74_0(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,4), buf74_0_offset + (index*4), int_value);
}
