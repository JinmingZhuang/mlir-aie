// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
#ifndef __INTRINSICS_H__
#define __INTRINSICS_H__

// Macros for backward core model compatibility for arch 12

#define fsrs(x,s) srs((x),(s)+15)
#define srsI(x,s) srs_ilv((x),(s))

#define upd_elem0(b,v) upd_elem((b),0,(v))
#define upd_elem1(b,v) upd_elem((b),1,(v))
#define upd_elem2(b,v) upd_elem((b),2,(v))
#define upd_elem3(b,v) upd_elem((b),3,(v))
#define upd_elem4(b,v) upd_elem((b),4,(v))
#define upd_elem5(b,v) upd_elem((b),5,(v))
#define upd_elem6(b,v) upd_elem((b),6,(v))
#define upd_elem7(b,v) upd_elem((b),7,(v))

// Acquire/Release lock values and primitives for backward compatibility
#define FOR_READ  1
#define FOR_WRITE 0
#define ACQ_READ  1
#define ACQ_WRITE 0
#define REL_READ  1
#if __AIENGINE__==1
#define REL_WRITE 0
#elif __AIENGINE__==2
#define REL_WRITE (-1)
#define acquire(l,v) acquire_equal(l,v)
#endif

#if 0
// upd_vwx with index
#define upd_v0(b,v) upd_v((b),0,(v))
#define upd_v1(b,v) upd_v((b),1,(v))
#define upd_v2(b,v) upd_v((b),2,(v))
#define upd_v3(b,v) upd_v((b),3,(v))
#define upd_v4(b,v) upd_v((b),4,(v))
#define upd_v5(b,v) upd_v((b),5,(v))
#define upd_v6(b,v) upd_v((b),6,(v))
#define upd_v7(b,v) upd_v((b),7,(v))
#define upd_w0(b,v) upd_w((b),0,(v))
#define upd_w1(b,v) upd_w((b),1,(v))
#define upd_w2(b,v) upd_w((b),2,(v))
#define upd_w3(b,v) upd_w((b),3,(v))
#define upd_x0(b,v) upd_x((b),0,(v))
#define upd_x1(b,v) upd_x((b),1,(v))

// ext_vwx with index
#define ext_v0(b) ext_v((b),0)
#define ext_v1(b) ext_v((b),1)
#define ext_v2(b) ext_v((b),2)
#define ext_v3(b) ext_v((b),3)
#define ext_v4(b) ext_v((b),4)
#define ext_v5(b) ext_v((b),5)
#define ext_v6(b) ext_v((b),6)
#define ext_v7(b) ext_v((b),7)
#define ext_w0(b) ext_w((b),0)
#define ext_w1(b) ext_w((b),1)
#define ext_w2(b) ext_w((b),2)
#define ext_w3(b) ext_w((b),3)
#define ext_x0(b) ext_x((b),0)
#define ext_x1(b) ext_x((b),1)
#endif
#endif


