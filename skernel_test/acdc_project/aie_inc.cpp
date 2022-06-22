void mlir_aie_configure_cores(aie_libxaie_ctx_t* ctx) {
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
{
int ret = XAieGbl_LoadElf(&(ctx->TileInst[1][3]), (u8*)"core_1_3.elf", XAIE_ENABLE);
if (ret == XAIELIB_FAILURE)
printf("Failed to load elf for Core[%d,%d], ret is %d", 1, 3, ret);
assert(ret != XAIELIB_FAILURE);
}
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
} // mlir_aie_configure_cores

void mlir_aie_start_cores(aie_libxaie_ctx_t* ctx) {
XAieTile_CoreControl(&(ctx->TileInst[1][3]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[1][4]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[0][1]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[0][2]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[0][3]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[0][4]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[1][1]), XAIE_ENABLE, XAIE_DISABLE);
XAieTile_CoreControl(&(ctx->TileInst[1][2]), XAIE_ENABLE, XAIE_DISABLE);
} // mlir_aie_start_cores

void mlir_aie_configure_dmas(aie_libxaie_ctx_t* ctx) {
} // mlir_aie_configure_dmas

void mlir_aie_initialize_locks(aie_libxaie_ctx_t* ctx) {
} // mlir_aie_initialize_locks
void mlir_aie_configure_switchboxes(aie_libxaie_ctx_t* ctx) {
  int x, y;
} // mlir_aie_configure_switchboxes

const int a_offset = 4096;
int32_t mlir_aie_read_buffer_a(aie_libxaie_ctx_t* ctx, int index) {
  int32_t value = XAieTile_DmReadWord(&(ctx->TileInst[1][3]), a_offset + (index*4));
  return value;
}
void mlir_aie_write_buffer_a(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[1][3]), a_offset + (index*4), int_value);
}
const int b_offset = 8192;
int32_t mlir_aie_read_buffer_b(aie_libxaie_ctx_t* ctx, int index) {
  int32_t value = XAieTile_DmReadWord(&(ctx->TileInst[1][3]), b_offset + (index*4));
  return value;
}
void mlir_aie_write_buffer_b(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[1][3]), b_offset + (index*4), int_value);
}
const int acc_offset = 12288;
int32_t mlir_aie_read_buffer_acc(aie_libxaie_ctx_t* ctx, int index) {
  int32_t value = XAieTile_DmReadWord(&(ctx->TileInst[1][3]), acc_offset + (index*4));
  return value;
}
void mlir_aie_write_buffer_acc(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[1][3]), acc_offset + (index*4), int_value);
}
const int c_offset = 16384;
int32_t mlir_aie_read_buffer_c(aie_libxaie_ctx_t* ctx, int index) {
  int32_t value = XAieTile_DmReadWord(&(ctx->TileInst[1][3]), c_offset + (index*4));
  return value;
}
void mlir_aie_write_buffer_c(aie_libxaie_ctx_t* ctx, int index, int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[1][3]), c_offset + (index*4), int_value);
}
