void mlir_aie_configure_cores(aie_libxaie_ctx_t* ctx) {
{
AieRC RC = XAie_LoadElf(&(ctx->DevInst), XAie_TileLoc(5,3), (const char*)"core_5_3.elf",0);
if (RC != XAIE_OK)
    printf("Failed to load elf for Core[%d,%d], ret is %d\n", 5, 3, RC);
assert(RC == XAIE_OK);
}
{
AieRC RC = XAie_LoadElf(&(ctx->DevInst), XAie_TileLoc(5,4), (const char*)"core_5_4.elf",0);
if (RC != XAIE_OK)
    printf("Failed to load elf for Core[%d,%d], ret is %d\n", 5, 4, RC);
assert(RC == XAIE_OK);
}
{
AieRC RC = XAie_LoadElf(&(ctx->DevInst), XAie_TileLoc(7,3), (const char*)"core_7_3.elf",0);
if (RC != XAIE_OK)
    printf("Failed to load elf for Core[%d,%d], ret is %d\n", 7, 3, RC);
assert(RC == XAIE_OK);
}
{
AieRC RC = XAie_LoadElf(&(ctx->DevInst), XAie_TileLoc(7,4), (const char*)"core_7_4.elf",0);
if (RC != XAIE_OK)
    printf("Failed to load elf for Core[%d,%d], ret is %d\n", 7, 4, RC);
assert(RC == XAIE_OK);
}
} // mlir_aie_configure_cores

void mlir_aie_start_cores(aie_libxaie_ctx_t* ctx) {
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(5,2));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(5,2));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(5,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(5,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(5,4));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(5,4));
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
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,1));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,3));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,3));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(6,4));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(6,4));
XAie_CoreUnreset(&(ctx->DevInst), XAie_TileLoc(7,1));
XAie_CoreEnable(&(ctx->DevInst), XAie_TileLoc(7,1));
} // mlir_aie_start_cores

void mlir_aie_configure_dmas(aie_libxaie_ctx_t* ctx) {
XAie_DmaDesc dma_tile72_bd0;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile72_bd0), XAie_TileLoc(7,2));
XAie_DmaSetLock(&(dma_tile72_bd0), XAie_LockInit(4,0),XAie_LockInit(4,1));
XAie_DmaSetAddrLen(&(dma_tile72_bd0),  /* addrA */ 0x1000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile72_bd0),  /* nextbd */ 1,  /* enableNextBd */ 1);
XAie_DmaSetPkt(&(dma_tile72_bd0), XAie_PacketInit(0,0));
XAie_DmaEnableBd(&(dma_tile72_bd0));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile72_bd0), XAie_TileLoc(7,2),  /* bd */ 0);
XAie_DmaDesc dma_tile72_bd1;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile72_bd1), XAie_TileLoc(7,2));
XAie_DmaSetLock(&(dma_tile72_bd1), XAie_LockInit(5,0),XAie_LockInit(5,1));
XAie_DmaSetAddrLen(&(dma_tile72_bd1),  /* addrA */ 0x2000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile72_bd1),  /* nextbd */ 0,  /* enableNextBd */ 1);
XAie_DmaSetPkt(&(dma_tile72_bd1), XAie_PacketInit(1,1));
XAie_DmaEnableBd(&(dma_tile72_bd1));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile72_bd1), XAie_TileLoc(7,2),  /* bd */ 1);
XAie_DmaDesc dma_tile72_bd2;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile72_bd2), XAie_TileLoc(7,2));
XAie_DmaSetLock(&(dma_tile72_bd2), XAie_LockInit(6,0),XAie_LockInit(6,1));
XAie_DmaSetAddrLen(&(dma_tile72_bd2),  /* addrA */ 0x3000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile72_bd2),  /* nextbd */ 3,  /* enableNextBd */ 1);
XAie_DmaSetPkt(&(dma_tile72_bd2), XAie_PacketInit(2,2));
XAie_DmaEnableBd(&(dma_tile72_bd2));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile72_bd2), XAie_TileLoc(7,2),  /* bd */ 2);
XAie_DmaDesc dma_tile72_bd3;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile72_bd3), XAie_TileLoc(7,2));
XAie_DmaSetLock(&(dma_tile72_bd3), XAie_LockInit(7,0),XAie_LockInit(7,1));
XAie_DmaSetAddrLen(&(dma_tile72_bd3),  /* addrA */ 0x4000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile72_bd3),  /* nextbd */ 2,  /* enableNextBd */ 1);
XAie_DmaSetPkt(&(dma_tile72_bd3), XAie_PacketInit(3,3));
XAie_DmaEnableBd(&(dma_tile72_bd3));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile72_bd3), XAie_TileLoc(7,2),  /* bd */ 3);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,2), /* ChNum */0, /* dmaDir */ DMA_MM2S, /* BdNum */0);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,2), /* ChNum */ 0, /* dmaDir */ DMA_MM2S);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,2), /* ChNum */1, /* dmaDir */ DMA_MM2S, /* BdNum */2);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,2), /* ChNum */ 1, /* dmaDir */ DMA_MM2S);
XAie_DmaDesc dma_tile53_bd0;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile53_bd0), XAie_TileLoc(5,3));
XAie_DmaSetLock(&(dma_tile53_bd0), XAie_LockInit(0,0),XAie_LockInit(0,1));
XAie_DmaSetAddrLen(&(dma_tile53_bd0),  /* addrA */ 0x1000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile53_bd0),  /* nextbd */ 0,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile53_bd0));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile53_bd0), XAie_TileLoc(5,3),  /* bd */ 0);
XAie_DmaDesc dma_tile53_bd1;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile53_bd1), XAie_TileLoc(5,3));
XAie_DmaSetLock(&(dma_tile53_bd1), XAie_LockInit(1,0),XAie_LockInit(1,1));
XAie_DmaSetAddrLen(&(dma_tile53_bd1),  /* addrA */ 0x2000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile53_bd1),  /* nextbd */ 1,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile53_bd1));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile53_bd1), XAie_TileLoc(5,3),  /* bd */ 1);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(5,3), /* ChNum */0, /* dmaDir */ DMA_S2MM, /* BdNum */0);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(5,3), /* ChNum */ 0, /* dmaDir */ DMA_S2MM);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(5,3), /* ChNum */1, /* dmaDir */ DMA_S2MM, /* BdNum */1);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(5,3), /* ChNum */ 1, /* dmaDir */ DMA_S2MM);
XAie_DmaDesc dma_tile54_bd0;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile54_bd0), XAie_TileLoc(5,4));
XAie_DmaSetLock(&(dma_tile54_bd0), XAie_LockInit(0,0),XAie_LockInit(0,1));
XAie_DmaSetAddrLen(&(dma_tile54_bd0),  /* addrA */ 0x1000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile54_bd0),  /* nextbd */ 0,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile54_bd0));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile54_bd0), XAie_TileLoc(5,4),  /* bd */ 0);
XAie_DmaDesc dma_tile54_bd1;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile54_bd1), XAie_TileLoc(5,4));
XAie_DmaSetLock(&(dma_tile54_bd1), XAie_LockInit(1,0),XAie_LockInit(1,1));
XAie_DmaSetAddrLen(&(dma_tile54_bd1),  /* addrA */ 0x2000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile54_bd1),  /* nextbd */ 1,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile54_bd1));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile54_bd1), XAie_TileLoc(5,4),  /* bd */ 1);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(5,4), /* ChNum */0, /* dmaDir */ DMA_S2MM, /* BdNum */0);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(5,4), /* ChNum */ 0, /* dmaDir */ DMA_S2MM);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(5,4), /* ChNum */1, /* dmaDir */ DMA_S2MM, /* BdNum */1);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(5,4), /* ChNum */ 1, /* dmaDir */ DMA_S2MM);
XAie_DmaDesc dma_tile73_bd0;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile73_bd0), XAie_TileLoc(7,3));
XAie_DmaSetLock(&(dma_tile73_bd0), XAie_LockInit(0,0),XAie_LockInit(0,1));
XAie_DmaSetAddrLen(&(dma_tile73_bd0),  /* addrA */ 0x1000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile73_bd0),  /* nextbd */ 0,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile73_bd0));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile73_bd0), XAie_TileLoc(7,3),  /* bd */ 0);
XAie_DmaDesc dma_tile73_bd1;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile73_bd1), XAie_TileLoc(7,3));
XAie_DmaSetLock(&(dma_tile73_bd1), XAie_LockInit(1,0),XAie_LockInit(1,1));
XAie_DmaSetAddrLen(&(dma_tile73_bd1),  /* addrA */ 0x2000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile73_bd1),  /* nextbd */ 1,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile73_bd1));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile73_bd1), XAie_TileLoc(7,3),  /* bd */ 1);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,3), /* ChNum */0, /* dmaDir */ DMA_S2MM, /* BdNum */0);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,3), /* ChNum */ 0, /* dmaDir */ DMA_S2MM);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,3), /* ChNum */1, /* dmaDir */ DMA_S2MM, /* BdNum */1);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,3), /* ChNum */ 1, /* dmaDir */ DMA_S2MM);
XAie_DmaDesc dma_tile74_bd0;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile74_bd0), XAie_TileLoc(7,4));
XAie_DmaSetLock(&(dma_tile74_bd0), XAie_LockInit(0,0),XAie_LockInit(0,1));
XAie_DmaSetAddrLen(&(dma_tile74_bd0),  /* addrA */ 0x1000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile74_bd0),  /* nextbd */ 0,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile74_bd0));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile74_bd0), XAie_TileLoc(7,4),  /* bd */ 0);
XAie_DmaDesc dma_tile74_bd1;
XAie_DmaDescInit(&(ctx->DevInst), &(dma_tile74_bd1), XAie_TileLoc(7,4));
XAie_DmaSetLock(&(dma_tile74_bd1), XAie_LockInit(1,0),XAie_LockInit(1,1));
XAie_DmaSetAddrLen(&(dma_tile74_bd1),  /* addrA */ 0x2000,  /* len */ 1024 * 4);
XAie_DmaSetNextBd(&(dma_tile74_bd1),  /* nextbd */ 1,  /* enableNextBd */ 1);
XAie_DmaEnableBd(&(dma_tile74_bd1));
XAie_DmaWriteBd(&(ctx->DevInst), &(dma_tile74_bd1), XAie_TileLoc(7,4),  /* bd */ 1);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,4), /* ChNum */0, /* dmaDir */ DMA_S2MM, /* BdNum */0);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,4), /* ChNum */ 0, /* dmaDir */ DMA_S2MM);
XAie_DmaChannelPushBdToQueue(&(ctx->DevInst), XAie_TileLoc(7,4), /* ChNum */1, /* dmaDir */ DMA_S2MM, /* BdNum */1);
XAie_DmaChannelEnable(&(ctx->DevInst), XAie_TileLoc(7,4), /* ChNum */ 1, /* dmaDir */ DMA_S2MM);
} // mlir_aie_configure_dmas

void mlir_aie_initialize_locks(aie_libxaie_ctx_t* ctx) {
} // mlir_aie_initialize_locks
void mlir_aie_configure_switchboxes(aie_libxaie_ctx_t* ctx) {
  int x, y;
// Core Stream Switch column 7 row 2
x = 7;
y = 2;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 0, NORTH, 0);
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 1, NORTH, 1);
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 0, WEST, 0);
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 1, WEST, 1);
// Core Stream Switch column 6 row 2
x = 6;
y = 2;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), EAST, 0, WEST, 0);
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), EAST, 1, WEST, 1);
// Core Stream Switch column 5 row 2
x = 5;
y = 2;
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), EAST, 0, NORTH, 0);
XAie_StrmConnCctEnable(&(ctx->DevInst), XAie_TileLoc(x,y), EAST, 1, NORTH, 1);
// Core Stream Switch column 5 row 3
x = 5;
y = 3;
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 0, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 0, /* MSelEn */ 1);
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), NORTH, 0, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 1, /* MSelEn */ 1);
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 1, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 2, /* MSelEn */ 1);
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), NORTH, 1, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 3, /* MSelEn */ 1);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0, /* slot */ 0, /* packet */ XAie_PacketInit(0,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 0);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0, /* slot */ 1, /* packet */ XAie_PacketInit(1,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 1);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1, /* slot */ 0, /* packet */ XAie_PacketInit(2,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 2);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1, /* slot */ 1, /* packet */ XAie_PacketInit(3,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 3);
// Core Stream Switch column 5 row 4
x = 5;
y = 4;
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 0, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 0, /* MSelEn */ 1);
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 1, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 1, /* MSelEn */ 1);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0, /* slot */ 0, /* packet */ XAie_PacketInit(1,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 0);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1, /* slot */ 0, /* packet */ XAie_PacketInit(3,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 1);
// Core Stream Switch column 7 row 3
x = 7;
y = 3;
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 0, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 0, /* MSelEn */ 1);
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), NORTH, 0, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 1, /* MSelEn */ 1);
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 1, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 2, /* MSelEn */ 1);
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), NORTH, 1, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 3, /* MSelEn */ 1);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0, /* slot */ 0, /* packet */ XAie_PacketInit(0,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 0);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0, /* slot */ 1, /* packet */ XAie_PacketInit(1,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 1);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1, /* slot */ 0, /* packet */ XAie_PacketInit(2,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 2);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1, /* slot */ 1, /* packet */ XAie_PacketInit(3,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 3);
// Core Stream Switch column 7 row 4
x = 7;
y = 4;
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 0, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 0, /* MSelEn */ 1);
XAie_StrmPktSwMstrPortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), DMA, 1, /* drop_header */ XAIE_SS_PKT_DROP_HEADER, /* arbiter */ 1, /* MSelEn */ 1);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 0, /* slot */ 0, /* packet */ XAie_PacketInit(1,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 0);
XAie_StrmPktSwSlavePortEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1);
XAie_StrmPktSwSlaveSlotEnable(&(ctx->DevInst), XAie_TileLoc(x,y), SOUTH, 1, /* slot */ 0, /* packet */ XAie_PacketInit(3,0), /* mask */ 0x1F, /* msel */ 0, /* arbiter */ 1);
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
const int buf72_1_offset = 8192;
int32_t mlir_aie_read_buffer_buf72_1(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,2), buf72_1_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf72_1(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,2), buf72_1_offset + (index*4), int_value);
}
const int buf72_2_offset = 12288;
int32_t mlir_aie_read_buffer_buf72_2(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,2), buf72_2_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf72_2(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,2), buf72_2_offset + (index*4), int_value);
}
const int buf72_3_offset = 16384;
int32_t mlir_aie_read_buffer_buf72_3(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,2), buf72_3_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf72_3(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,2), buf72_3_offset + (index*4), int_value);
}
const int buf54_0_offset = 4096;
int32_t mlir_aie_read_buffer_buf54_0(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(5,4), buf54_0_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf54_0(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(5,4), buf54_0_offset + (index*4), int_value);
}
const int buf54_1_offset = 8192;
int32_t mlir_aie_read_buffer_buf54_1(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(5,4), buf54_1_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf54_1(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(5,4), buf54_1_offset + (index*4), int_value);
}
const int buf54_2_offset = 12288;
int32_t mlir_aie_read_buffer_buf54_2(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(5,4), buf54_2_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf54_2(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(5,4), buf54_2_offset + (index*4), int_value);
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
const int buf74_1_offset = 8192;
int32_t mlir_aie_read_buffer_buf74_1(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,4), buf74_1_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf74_1(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,4), buf74_1_offset + (index*4), int_value);
}
const int buf74_2_offset = 12288;
int32_t mlir_aie_read_buffer_buf74_2(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,4), buf74_2_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf74_2(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,4), buf74_2_offset + (index*4), int_value);
}
const int buf53_0_offset = 4096;
int32_t mlir_aie_read_buffer_buf53_0(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(5,3), buf53_0_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf53_0(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(5,3), buf53_0_offset + (index*4), int_value);
}
const int buf53_1_offset = 8192;
int32_t mlir_aie_read_buffer_buf53_1(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(5,3), buf53_1_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf53_1(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(5,3), buf53_1_offset + (index*4), int_value);
}
const int buf53_2_offset = 12288;
int32_t mlir_aie_read_buffer_buf53_2(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(5,3), buf53_2_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf53_2(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(5,3), buf53_2_offset + (index*4), int_value);
}
const int buf53_3_offset = 16384;
int32_t mlir_aie_read_buffer_buf53_3(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(5,3), buf53_3_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf53_3(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(5,3), buf53_3_offset + (index*4), int_value);
}
const int buf73_0_offset = 4096;
int32_t mlir_aie_read_buffer_buf73_0(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,3), buf73_0_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf73_0(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,3), buf73_0_offset + (index*4), int_value);
}
const int buf73_1_offset = 8192;
int32_t mlir_aie_read_buffer_buf73_1(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,3), buf73_1_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf73_1(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,3), buf73_1_offset + (index*4), int_value);
}
const int buf73_2_offset = 12288;
int32_t mlir_aie_read_buffer_buf73_2(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,3), buf73_2_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf73_2(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,3), buf73_2_offset + (index*4), int_value);
}
const int buf73_3_offset = 16384;
int32_t mlir_aie_read_buffer_buf73_3(aie_libxaie_ctx_t* ctx, int index) {
u32 value; auto rc = XAie_DataMemRdWord(&(ctx->DevInst), XAie_TileLoc(7,3), buf73_3_offset + (index*4), &value);
  return value;
}
void mlir_aie_write_buffer_buf73_3(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
u32 rc =    XAie_DataMemWrWord(&(ctx->DevInst), XAie_TileLoc(7,3), buf73_3_offset + (index*4), int_value);
}
