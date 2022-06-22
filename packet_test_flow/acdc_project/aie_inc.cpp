void mlir_aie_configure_cores(aie_libxaie_ctx_t* ctx) {
XAieTile_ShimColumnReset(&(ctx->TileInst[7][0]), XAIE_RESETENABLE);
// Reset configuration
// Reset configuration
// ShimDMA
for (int i=0x1D000; i<=0x1D13C; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr+i, 0);
for (int i=0x1D140; i<=0x1D140; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr+i, 0);
for (int i=0x1D148; i<=0x1D148; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr+i, 0);
for (int i=0x1D150; i<=0x1D150; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr+i, 0);
for (int i=0x1D158; i<=0x1D158; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F058; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F15C; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F37C; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr+i, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[7][0]), XAIE_RESETDISABLE);
XAieTile_CoreControl(&(ctx->TileInst[7][2]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[7][2]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[7][3]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[7][3]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[7][4]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[7][4]), l, 0x0, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[0][0]), XAIE_RESETENABLE);
// Reset configuration
XAieTile_ShimColumnReset(&(ctx->TileInst[0][0]), XAIE_RESETDISABLE);
XAieTile_CoreControl(&(ctx->TileInst[0][1]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[0][1]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[0][2]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[0][2]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[0][3]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[0][3]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[0][4]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[0][4]), l, 0x0, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[1][0]), XAIE_RESETENABLE);
// Reset configuration
// Stream Switch master config
for (int i=0x3F000; i<=0x3F058; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][0]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F15C; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][0]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F37C; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][0]))->TileAddr+i, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[1][0]), XAIE_RESETDISABLE);
XAieTile_CoreControl(&(ctx->TileInst[1][1]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[1][1]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[1][2]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[1][2]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[1][3]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[1][3]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[1][4]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[1][4]), l, 0x0, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[2][0]), XAIE_RESETENABLE);
// Reset configuration
// Reset configuration
// ShimDMA
for (int i=0x1D000; i<=0x1D13C; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr+i, 0);
for (int i=0x1D140; i<=0x1D140; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr+i, 0);
for (int i=0x1D148; i<=0x1D148; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr+i, 0);
for (int i=0x1D150; i<=0x1D150; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr+i, 0);
for (int i=0x1D158; i<=0x1D158; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F058; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F15C; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F37C; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr+i, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[2][0]), XAIE_RESETDISABLE);
XAieTile_CoreControl(&(ctx->TileInst[2][1]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[2][1]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[2][2]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[2][2]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[2][3]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[2][3]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[2][4]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[2][4]), l, 0x0, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[3][0]), XAIE_RESETENABLE);
// Reset configuration
// Reset configuration
// ShimDMA
for (int i=0x1D000; i<=0x1D13C; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr+i, 0);
for (int i=0x1D140; i<=0x1D140; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr+i, 0);
for (int i=0x1D148; i<=0x1D148; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr+i, 0);
for (int i=0x1D150; i<=0x1D150; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr+i, 0);
for (int i=0x1D158; i<=0x1D158; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F058; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F15C; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F37C; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr+i, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[3][0]), XAIE_RESETDISABLE);
XAieTile_CoreControl(&(ctx->TileInst[3][1]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[3][1]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[3][2]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[3][2]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[3][3]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[3][3]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[3][4]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[3][4]), l, 0x0, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[4][0]), XAIE_RESETENABLE);
// Reset configuration
// Stream Switch master config
for (int i=0x3F000; i<=0x3F058; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][0]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F15C; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][0]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F37C; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][0]))->TileAddr+i, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[4][0]), XAIE_RESETDISABLE);
XAieTile_CoreControl(&(ctx->TileInst[4][1]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[4][1]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[4][2]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[4][2]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[4][3]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[4][3]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[4][4]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[4][4]), l, 0x0, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[5][0]), XAIE_RESETENABLE);
// Reset configuration
// Stream Switch master config
for (int i=0x3F000; i<=0x3F058; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][0]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F15C; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][0]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F37C; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][0]))->TileAddr+i, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[5][0]), XAIE_RESETDISABLE);
XAieTile_CoreControl(&(ctx->TileInst[5][1]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[5][1]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[5][2]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[5][2]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[5][3]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[5][3]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[5][4]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[5][4]), l, 0x0, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[6][0]), XAIE_RESETENABLE);
// Reset configuration
// Reset configuration
// ShimDMA
for (int i=0x1D000; i<=0x1D13C; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr+i, 0);
for (int i=0x1D140; i<=0x1D140; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr+i, 0);
for (int i=0x1D148; i<=0x1D148; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr+i, 0);
for (int i=0x1D150; i<=0x1D150; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr+i, 0);
for (int i=0x1D158; i<=0x1D158; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F058; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F15C; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F37C; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr+i, 0);
XAieTile_ShimColumnReset(&(ctx->TileInst[6][0]), XAIE_RESETDISABLE);
XAieTile_CoreControl(&(ctx->TileInst[6][1]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[6][1]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[6][2]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[6][2]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[6][3]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[6][3]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[6][4]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[6][4]), l, 0x0, 0);
XAieTile_CoreControl(&(ctx->TileInst[7][1]), XAIE_DISABLE, XAIE_ENABLE);
// Reset configuration
// Program Memory
for (int i=0x20000; i<=0x23FFF; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr+i, 0);
// TileDMA
for (int i=0x1D000; i<=0x1D1F8; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr+i, 0);
for (int i=0x1DE00; i<=0x1DE00; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr+i, 0);
for (int i=0x1DE08; i<=0x1DE08; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr+i, 0);
for (int i=0x1DE10; i<=0x1DE10; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr+i, 0);
for (int i=0x1DE18; i<=0x1DE18; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr+i, 0);
// Stream Switch master config
for (int i=0x3F000; i<=0x3F060; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr+i, 0);
// Stream Switch slave config
for (int i=0x3F100; i<=0x3F168; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr+i, 0);
// Stream Switch slave slot config
for (int i=0x3F200; i<=0x3F3AC; i+=4) XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr+i, 0);
for (int l=0; l<16; l++)
  XAieTile_LockRelease(&(ctx->TileInst[7][1]), l, 0x0, 0);
} // mlir_aie_configure_cores

void mlir_aie_start_cores(aie_libxaie_ctx_t* ctx) {
XAieTile_CoreControl(&(ctx->TileInst[7][2]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[7][3]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[7][4]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[0][1]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[0][2]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[0][3]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[0][4]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[1][1]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[1][2]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[1][3]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[1][4]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[2][1]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[2][2]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[2][3]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[2][4]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[3][1]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[3][2]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[3][3]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[3][4]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[4][1]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[4][2]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[4][3]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[4][4]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[5][1]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[5][2]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[5][3]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[5][4]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[6][1]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[6][2]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[6][3]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[6][4]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[7][1]), XAIE_ENABLE, XAIE_DISABLE);
} // mlir_aie_start_cores

void mlir_aie_configure_dmas(aie_libxaie_ctx_t* ctx) {
XAieDma_TileInitialize(&(ctx->TileInst[7][2]), &(ctx->TileDMAInst[7][2]));
XAieDma_TileBdClearAll(&(ctx->TileDMAInst[7][2]));
XAieDma_TileChResetAll(&(ctx->TileDMAInst[7][2]));
XAieDma_TileBdSetLock(&(ctx->TileDMAInst[7][2]),  /* bd */ 0, XAIEDMA_TILE_BD_ADDRA,  /* lockID */ 1, XAIE_ENABLE,  /* release */ 1, XAIE_ENABLE,  /* acquire */ 0);
XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[7][2]),  /* bd */ 0,  /* addrA */ 0x1000,  /* addrB */ 0x0,  /* len */ 256 * 4,  /* ABMode */ XAIE_DISABLE,  /* FIFOMode */ XAIE_DISABLE);
XAieDma_TileBdSetNext(&(ctx->TileDMAInst[7][2]),  /* bd */ 0,  /* nextbd */ 0);
XAieDma_TileBdWrite(&(ctx->TileDMAInst[7][2]),  /* bd */ 0);
XAieDma_TileBdSetLock(&(ctx->TileDMAInst[7][2]),  /* bd */ 1, XAIEDMA_TILE_BD_ADDRA,  /* lockID */ 1, XAIE_ENABLE,  /* release */ 0, XAIE_ENABLE,  /* acquire */ 1);
XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[7][2]),  /* bd */ 1,  /* addrA */ 0x1000,  /* addrB */ 0x0,  /* len */ 256 * 4,  /* ABMode */ XAIE_DISABLE,  /* FIFOMode */ XAIE_DISABLE);
XAieDma_TileBdSetNext(&(ctx->TileDMAInst[7][2]),  /* bd */ 1,  /* nextbd */ 1);
XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[7][2]),  /* bd */ 1,  /* en */ 1,  /* type */ 1,  /* id */ 13);
XAieDma_TileBdWrite(&(ctx->TileDMAInst[7][2]),  /* bd */ 1);
XAieDma_TileSetStartBd((&(ctx->TileDMAInst[7][2])), XAIEDMA_TILE_CHNUM_S2MM0,  /* bd */ 0);
XAieDma_TileChControl(&(ctx->TileDMAInst[7][2]), XAIEDMA_TILE_CHNUM_S2MM0, XAIE_RESETDISABLE, XAIE_ENABLE);
XAieDma_TileSetStartBd((&(ctx->TileDMAInst[7][2])), XAIEDMA_TILE_CHNUM_MM2S0,  /* bd */ 1);
XAieDma_TileChControl(&(ctx->TileDMAInst[7][2]), XAIEDMA_TILE_CHNUM_MM2S0, XAIE_RESETDISABLE, XAIE_ENABLE);
XAieDma_TileInitialize(&(ctx->TileInst[7][4]), &(ctx->TileDMAInst[7][4]));
XAieDma_TileBdClearAll(&(ctx->TileDMAInst[7][4]));
XAieDma_TileChResetAll(&(ctx->TileDMAInst[7][4]));
XAieDma_TileBdSetLock(&(ctx->TileDMAInst[7][4]),  /* bd */ 0, XAIEDMA_TILE_BD_ADDRA,  /* lockID */ 1, XAIE_ENABLE,  /* release */ 1, XAIE_ENABLE,  /* acquire */ 0);
XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[7][4]),  /* bd */ 0,  /* addrA */ 0x1000,  /* addrB */ 0x0,  /* len */ 256 * 4,  /* ABMode */ XAIE_DISABLE,  /* FIFOMode */ XAIE_DISABLE);
XAieDma_TileBdSetNext(&(ctx->TileDMAInst[7][4]),  /* bd */ 0,  /* nextbd */ 0);
XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[7][4]),  /* bd */ 0,  /* en */ 1,  /* type */ 1,  /* id */ 13);
XAieDma_TileBdWrite(&(ctx->TileDMAInst[7][4]),  /* bd */ 0);
XAieDma_TileSetStartBd((&(ctx->TileDMAInst[7][4])), XAIEDMA_TILE_CHNUM_S2MM0,  /* bd */ 0);
XAieDma_TileChControl(&(ctx->TileDMAInst[7][4]), XAIEDMA_TILE_CHNUM_S2MM0, XAIE_RESETDISABLE, XAIE_ENABLE);
XAieDma_Shim ShimDMAInst_7_0;
XAieDma_ShimInitialize(&(ctx->TileInst[7][0]), &ShimDMAInst_7_0);
XAieDma_ShimBdSetLock(&ShimDMAInst_7_0,  /* bd */ 0,  /* lockID */ 1, XAIE_ENABLE,  /* release */ 0, XAIE_ENABLE,  /* acquire */ 1);
XAieDma_ShimBdSetAddr(&ShimDMAInst_7_0,  /* bd */ 0, HIGH_ADDR((u64)0x20100004000), LOW_ADDR((u64)0x20100004000),  /* len */ 256 * 4);
XAieDma_ShimBdSetAxi(&ShimDMAInst_7_0, /* bd */ 0, /* smid */ 0, /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0, /* secure */ XAIE_ENABLE);
XAieDma_ShimBdSetNext(&ShimDMAInst_7_0,  /* bd */ 0,  /* nextbd */ 0);
XAieDma_ShimBdWrite(&ShimDMAInst_7_0,  /* bd */ 0);
XAieDma_ShimSetStartBd(&ShimDMAInst_7_0, XAIEDMA_SHIM_CHNUM_MM2S0,  /* bd */ 0);
XAieDma_ShimChControl(&ShimDMAInst_7_0, XAIEDMA_TILE_CHNUM_MM2S0, /* PauseStream */ XAIE_DISABLE, /* PauseMM */ XAIE_DISABLE, /* Enable */ XAIE_ENABLE);
} // mlir_aie_configure_dmas

void mlir_aie_initialize_locks(aie_libxaie_ctx_t* ctx) {
} // mlir_aie_initialize_locks
void mlir_aie_configure_switchboxes(aie_libxaie_ctx_t* ctx) {
  int x, y;
// Core Stream Switch column 7 row 0
x = 7;
y = 0;
XAieTile_StrmConnectCct(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 3),
	XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
	XAIE_ENABLE);
// Core Stream Switch column 7 row 2
x = 7;
y = 2;
XAieTile_StrmConnectCct(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
	XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0),
	XAIE_ENABLE);
XAieTile_StrmConfigMstr(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
	XAIE_ENABLE,
	XAIE_ENABLE,
	XAIETILE_STRSW_MPORT_CFGPKT(&(ctx->TileInst[x][y]),
		XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
		XAIE_DISABLE /*drop_header*/,
		0x1 /*mask*/,
		0 /*arbiter*/));
XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_SPORT_DMA(&(ctx->TileInst[x][y]), 0),
	XAIE_ENABLE, XAIE_ENABLE);
XAieTile_StrmConfigSlvSlot(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_SPORT_DMA(&(ctx->TileInst[x][y]), 0),
	0 /*slot*/,
	XAIE_ENABLE,
	XAIETILE_STRSW_SLVSLOT_CFG(&(ctx->TileInst[x][y]),
		(XAIETILE_STRSW_SPORT_DMA(&(ctx->TileInst[x][y]), 0)),
		0 /*slot*/,
		0xD /*ID value*/,
		0x1F /*mask*/,
		XAIE_ENABLE,
		0 /*msel*/,
		0 /*arbiter*/));
// Core Stream Switch column 7 row 3
x = 7;
y = 3;
XAieTile_StrmConfigMstr(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
	XAIE_ENABLE,
	XAIE_ENABLE,
	XAIETILE_STRSW_MPORT_CFGPKT(&(ctx->TileInst[x][y]),
		XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
		XAIE_DISABLE /*drop_header*/,
		0x1 /*mask*/,
		0 /*arbiter*/));
XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
	XAIE_ENABLE, XAIE_ENABLE);
XAieTile_StrmConfigSlvSlot(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
	0 /*slot*/,
	XAIE_ENABLE,
	XAIETILE_STRSW_SLVSLOT_CFG(&(ctx->TileInst[x][y]),
		(XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0)),
		0 /*slot*/,
		0xD /*ID value*/,
		0x1F /*mask*/,
		XAIE_ENABLE,
		0 /*msel*/,
		0 /*arbiter*/));
// Core Stream Switch column 7 row 4
x = 7;
y = 4;
XAieTile_StrmConfigMstr(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0),
	XAIE_ENABLE,
	XAIE_ENABLE,
	XAIETILE_STRSW_MPORT_CFGPKT(&(ctx->TileInst[x][y]),
		XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0),
		XAIE_ENABLE /*drop_header*/,
		0x1 /*mask*/,
		0 /*arbiter*/));
XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
	XAIE_ENABLE, XAIE_ENABLE);
XAieTile_StrmConfigSlvSlot(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
	0 /*slot*/,
	XAIE_ENABLE,
	XAIETILE_STRSW_SLVSLOT_CFG(&(ctx->TileInst[x][y]),
		(XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0)),
		0 /*slot*/,
		0xD /*ID value*/,
		0x1F /*mask*/,
		XAIE_ENABLE,
		0 /*msel*/,
		0 /*arbiter*/));
// Core Stream Switch column 7 row 1
x = 7;
y = 1;
XAieTile_StrmConnectCct(&(ctx->TileInst[x][y]),
	XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
	XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
	XAIE_ENABLE);
// ShimMux column 7 row 0
// NOTE ShimMux always connects from the south as directions are defined relative to the tile stream switch
x = 7;
y = 0;
XAieTile_ShimStrmMuxConfig(&(ctx->TileInst[x][y]),
	XAIETILE_SHIM_STRM_MUX_SOUTH3,
	XAIETILE_SHIM_STRM_MUX_DMA);
} // mlir_aie_configure_switchboxes

const int buf72_0_offset = 4096;
int32_t mlir_aie_read_buffer_buf72_0(aie_libxaie_ctx_t* ctx, int index) {
  int32_t value = XAieTile_DmReadWord(&(ctx->TileInst[7][2]), buf72_0_offset + (index*4));
  return value;
}
void mlir_aie_write_buffer_buf72_0(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[7][2]), buf72_0_offset + (index*4), int_value);
}
const int buf74_0_offset = 4096;
int32_t mlir_aie_read_buffer_buf74_0(aie_libxaie_ctx_t* ctx, int index) {
  int32_t value = XAieTile_DmReadWord(&(ctx->TileInst[7][4]), buf74_0_offset + (index*4));
  return value;
}
void mlir_aie_write_buffer_buf74_0(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[7][4]), buf74_0_offset + (index*4), int_value);
}
