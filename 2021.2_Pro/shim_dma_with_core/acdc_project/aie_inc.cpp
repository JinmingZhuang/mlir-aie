void mlir_aie_configure_cores(aie_libxaie_ctx_t* ctx) {
{
AieRC RC = XAie_LoadElf(&(ctx->DevInst), XAie_TileLoc(7,3), (const char*)"core_7_3.elf",0);
if (RC != XAIE_OK)
    printf("Failed to load elf for Core[%d,%d], ret is %d\n", 7, 3, RC);
assert(RC == XAIE_OK);
}
} // mlir_aie_configure_cores

void mlir_aie_start_cores(aie_libxaie_ctx_t* ctx) {
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(7,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(7,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(7,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(7,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(7,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(7,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(0,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(0,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(0,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(0,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(0,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(0,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(1,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(1,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(1,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(1,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(1,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(1,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(2,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(2,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(2,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(2,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(2,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(2,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(3,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(3,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(3,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(3,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(3,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(3,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(4,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(4,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(4,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(4,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(4,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(4,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(5,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(5,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(5,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(5,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(5,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(5,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,3));
} // mlir_aie_start_cores

void mlir_aie_configure_dmas(aie_libxaie_ctx_t* ctx) {
XAie_DmaDesc dma_tile73_bd0;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile73_bd0), XAie_TileLoc(7,3));
XAie_DmaSetLock(&(dma_tile73_bd0), XAie_LockInit(3,0),XAie_LockInit(3,1));
XAie_DmaSetAddrLen(&(dma_tile73_bd0),  /* addrA */ 0x1000,  /* len */ 64 * 4);
XAie_DmaSetNextBd(&(dma_tile73_bd0),  /* nextbd */ 1,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile73_bd0));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile73_bd0), XAie_TileLoc(7,3),  /* bd */ 0);
XAie_DmaDesc dma_tile73_bd1;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile73_bd1), XAie_TileLoc(7,3));
XAie_DmaSetLock(&(dma_tile73_bd1), XAie_LockInit(4,0),XAie_LockInit(4,1));
XAie_DmaSetAddrLen(&(dma_tile73_bd1),  /* addrA */ 0x1100,  /* len */ 64 * 4);
XAie_DmaSetNextBd(&(dma_tile73_bd1),  /* nextbd */ 0,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile73_bd1));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile73_bd1), XAie_TileLoc(7,3),  /* bd */ 1);
XAie_DmaDesc dma_tile73_bd2;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile73_bd2), XAie_TileLoc(7,3));
XAie_DmaSetLock(&(dma_tile73_bd2), XAie_LockInit(5,1),XAie_LockInit(5,0));
XAie_DmaSetAddrLen(&(dma_tile73_bd2),  /* addrA */ 0x1200,  /* len */ 64 * 4);
XAie_DmaSetNextBd(&(dma_tile73_bd2),  /* nextbd */ 3,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile73_bd2));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile73_bd2), XAie_TileLoc(7,3),  /* bd */ 2);
XAie_DmaDesc dma_tile73_bd3;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile73_bd3), XAie_TileLoc(7,3));
XAie_DmaSetLock(&(dma_tile73_bd3), XAie_LockInit(6,1),XAie_LockInit(6,0));
XAie_DmaSetAddrLen(&(dma_tile73_bd3),  /* addrA */ 0x1300,  /* len */ 64 * 4);
XAie_DmaSetNextBd(&(dma_tile73_bd3),  /* nextbd */ 2,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile73_bd3));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile73_bd3), XAie_TileLoc(7,3),  /* bd */ 3);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,3), /* ChNum */0, /* dmaDir */ DMA_S2MM, /* BdNum */0);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,3), /* ChNum */ 0, /* dmaDir */ DMA_S2MM);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,3), /* ChNum */1, /* dmaDir */ DMA_MM2S, /* BdNum */2);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,3), /* ChNum */ 1, /* dmaDir */ DMA_MM2S);
} // mlir_aie_configure_dmas

static u64 _mlir_aie_external_myBuffer_70_0 = 0x20100004000;
void mlir_aie_external_set_addr_myBuffer_70_0(u64 addr) {
    _mlir_aie_external_myBuffer_70_0 = addr;
}
u64 mlir_aie_external_get_addr_myBuffer_70_0(void) {
    return _mlir_aie_external_myBuffer_70_0;
}
static u64 _mlir_aie_external_myBuffer_70_1 = 0x20100006000;
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
XAie_DmaSetAddrLen(&(dma_tile70_bd0),  /* addr */ mlir_aie_external_get_addr_myBuffer_70_0(),  /* len */ 512 * 4);
XAie_DmaSetAxi(&(dma_tile70_bd0), /* smid */ 0, /* burstlen */ 4, /* QoS */ 0 , /* Cache */ 0, /* Secure */ XAIE_ENABLE);
XAie_DmaSetNextBd(&(dma_tile70_bd0),  /* nextbd */ 0,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile70_bd0));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile70_bd0), XAie_TileLoc(7,0),  /* bd */ 0);
XAie_DmaDesc dma_tile70_bd1;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile70_bd1), XAie_TileLoc(7,0));
XAie_DmaSetLock(&(dma_tile70_bd1), XAie_LockInit(2,1),XAie_LockInit(2,0));
XAie_DmaSetAddrLen(&(dma_tile70_bd1),  /* addr */ mlir_aie_external_get_addr_myBuffer_70_1(),  /* len */ 512 * 4);
XAie_DmaSetAxi(&(dma_tile70_bd1), /* smid */ 0, /* burstlen */ 4, /* QoS */ 0 , /* Cache */ 0, /* Secure */ XAIE_ENABLE);
XAie_DmaSetNextBd(&(dma_tile70_bd1),  /* nextbd */ 1,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile70_bd1));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile70_bd1), XAie_TileLoc(7,0),  /* bd */ 1);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,0), /* ChNum */0, /* dmaDir */ DMA_MM2S, /* BdNum */0);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,0), /* ChNum */ 0, /* dmaDir */ DMA_MM2S);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,0), /* ChNum */0, /* dmaDir */ DMA_S2MM, /* BdNum */1);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,0), /* ChNum */ 0, /* dmaDir */ DMA_S2MM);
} // mlir_aie_configure_shimdma

void mlir_aie_initialize_locks(aie_libxaie_ctx_t* ctx) {
} // mlir_aie_initialize_locks
void mlir_aie_configure_switchboxes(aie_libxaie_ctx_t* ctx) {
  int x, y;
// Core Stream Switch column 7 row 0
x = 7;
y = 0;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 3, NORTH, 3);
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), NORTH, 2, SOUTH, 2);
// Core Stream Switch column 7 row 1
x = 7;
y = 1;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 3, NORTH, 0);
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), NORTH, 0, SOUTH, 2);
// Core Stream Switch column 7 row 2
x = 7;
y = 2;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0, NORTH, 0);
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), NORTH, 0, SOUTH, 0);
// Core Stream Switch column 7 row 3
x = 7;
y = 3;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0, DMA, 0);
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 1, SOUTH, 0);
// ShimMux column 7 row 0
// NOTE ShimMux always connects from the south as directions are defined relative to the tile stream switch
x = 7;
y = 0;
XAie_EnableShimDmaToAieStrmPort(&(ctx->DevInst), XAie_TileLoc(x,y), 3);
XAie_EnableAieToShimDmaStrmPort(&(ctx->DevInst), XAie_TileLoc(x,y), 2);
} // mlir_aie_configure_switchboxes

const int a_ping_offset = 4096;
int32_t mlir_aie_read_buffer_a_ping(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,3), a_ping_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_a_ping(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,3), a_ping_offset + (index*4), int_value);
}
const int a_pong_offset = 4352;
int32_t mlir_aie_read_buffer_a_pong(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,3), a_pong_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_a_pong(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,3), a_pong_offset + (index*4), int_value);
}
const int b_ping_offset = 4608;
int32_t mlir_aie_read_buffer_b_ping(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,3), b_ping_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_b_ping(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,3), b_ping_offset + (index*4), int_value);
}
const int b_pong_offset = 4864;
int32_t mlir_aie_read_buffer_b_pong(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,3), b_pong_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_b_pong(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,3), b_pong_offset + (index*4), int_value);
}
