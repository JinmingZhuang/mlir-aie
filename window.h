// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
#ifndef __WINDOW_H__
#define __WINDOW_H__
#include <stdio.h>
#include <assert.h>

#include "./intrinsics.h"
#include "./types.h"

#define ROUND_TO_8(x) ((x+7)/8)*8
#define W_SIZE(taps,sz)              (sz + ROUND_TO_8(taps-1))
#define W_SIZE_INTERPOLATOR(taps,sz) (sz + ROUND_TO_8((taps-1)/2))

typedef int8_t window_datatype;

#if __AIENGINE__==2
inline window_datatype * cyclic_add(window_datatype *ptr, int count, window_datatype *buf, unsigned int size) {
  int off = ptr+count-buf;
  while (off<0) off += size;
  while (off>=size) off -= size;
  return buf+off;
}
#endif

#define WINDOW_DATATYPE_SIZE   (sizeof (window_datatype))
#ifdef __NEW_WINDOW_H__
#ifdef __NEW_X86Sim__
namespace CDNOx86Sim {
    class IWindowConnector;
}
#endif
#pragma pack()
struct window_internal
{
     unsigned int  current_bufid;
     unsigned int instanceId;
     window_datatype * restrict ptr;
     window_datatype *  restrict head;
     window_datatype  *         restrict heads[2];
     window_datatype *  restrict buffer;
     window_datatype  *         restrict  buffers[2];
     unsigned int size;
     unsigned int winsize;
   #ifdef __NEW_X86Sim__
     CDNOx86Sim::IWindowConnector *conn;
   #else
     unsigned int lockids[2];
   #endif
   //  unsigned char current_bufid;
     //window_datatype  *         restrict heads[2];
     //window_datatype  *         restrict  buffers[2];
//     unsigned int lockids[2];
};
#pragma pack()
#else   //! __NEW_WINDOW_H__
struct window_internal
{
    window_datatype * restrict ptr;
    window_datatype * restrict head;
    window_datatype * restrict buffer;
    unsigned int size;
    unsigned int winsize;
};
#endif   // ! __NEW_WINDOW_H__

#ifdef __NEW_WINDOW_H__ 
#ifdef __NEW_X86Sim__
#define DEF_W_INPUT_TYPES(element_type)				\
  struct input_window_ ## element_type {			\
     unsigned int current_bufid; \
     unsigned int instanceId;\
     window_datatype *  restrict ptr;				\
     window_datatype *  restrict head; \
     window_datatype  *         restrict heads[2]; \
     window_datatype *  restrict buffer;\
     window_datatype  *         restrict  buffers[2];\
     unsigned int  size;						\
     unsigned int winsize;					\
     CDNOx86Sim::IWindowConnector *conn; \
  };
#else  // !  __NEW_X86Sim__
#define DEF_W_INPUT_TYPES(element_type)				\
  struct input_window_ ## element_type {			\
     unsigned int current_bufid; \
     unsigned int instanceId;\
     window_datatype *  restrict ptr;				\
     window_datatype *  restrict head; \
     window_datatype  *         restrict heads[2]; \
     window_datatype *  restrict buffer;\
     window_datatype  *         restrict  buffers[2];\
     unsigned int  size;						\
     unsigned int winsize;					\
     unsigned int lockids[2];\
  };
#endif // !  __NEW_X86Sim__
#else
#define DEF_W_INPUT_TYPES(element_type)                         \
  struct input_window_ ## element_type {                        \
    window_datatype *  restrict ptr;                            \
    window_datatype * head;                                     \
    window_datatype * buffer;                                   \
    unsigned int  size;                                         \
    unsigned int winsize;                                       \
  };
#endif


#ifdef NOCPP

#ifdef __NEW_WINDOW_H__ 
#ifdef __NEW_X86Sim__
#define DEF_W_OUTPUT_TYPES(element_type)			\
  struct output_window_ ## element_type {			\
     unsigned int current_bufid; \
     unsigned int instanceId;\
     window_datatype *  restrict ptr;				\
     window_datatype *  restrict head;                 \
     window_datatype  *         restrict heads[2];\
     window_datatype *  restrict buffer;\
     window_datatype  *         restrict  buffers[2];\
     unsigned int  size;						\
     unsigned int winsize;					\
     CDNOx86Sim::IWindowConnector *conn; \
  };
#else  // !  __NEW_X86Sim__
#define DEF_W_OUTPUT_TYPES(element_type)			\
  struct output_window_ ## element_type {			\
     unsigned int current_bufid; \
     unsigned int instanceId;\
     window_datatype *  restrict ptr;				\
     window_datatype *  restrict head;                 \
     window_datatype  *         restrict heads[2];\
     window_datatype *  restrict buffer;\
     window_datatype  *         restrict  buffers[2];\
     unsigned int  size;						\
     unsigned int winsize;					\
     unsigned int lockids[2]; \
  };
#endif // !  __NEW_X86Sim__
#else  // !  __NEW_WINDOW_H__ 
#define DEF_W_OUTPUT_TYPES(element_type)                        \
  struct output_window_ ## element_type {                       \
    window_datatype *  restrict ptr;                            \
    window_datatype *  head;                                    \
    window_datatype *  buffer;                                  \
    unsigned int  size;                                         \
    unsigned int winsize;                                       \
  };
#endif // !  __NEW_WINDOW_H__

#ifdef __NEW_WINDOW_H__
#pragma pack()
DEF_W_INPUT_TYPES(int8)
#pragma pack()
DEF_W_INPUT_TYPES(uint8)
#pragma pack()
DEF_W_INPUT_TYPES(int16)
#pragma pack()
DEF_W_INPUT_TYPES(uint16)
#pragma pack()
DEF_W_INPUT_TYPES(int32)
#pragma pack()
DEF_W_INPUT_TYPES(uint32)
#pragma pack()
DEF_W_INPUT_TYPES(int64)
#pragma pack()
DEF_W_INPUT_TYPES(uint64)
#pragma pack()
DEF_W_INPUT_TYPES(float)
#pragma pack()
DEF_W_OUTPUT_TYPES(int8)
#pragma pack()
DEF_W_OUTPUT_TYPES(uint8)
#pragma pack()
DEF_W_OUTPUT_TYPES(int16)
#pragma pack()
DEF_W_OUTPUT_TYPES(uint16)
#pragma pack()
DEF_W_OUTPUT_TYPES(int32)
#pragma pack()
DEF_W_OUTPUT_TYPES(uint32)
#pragma pack()
DEF_W_OUTPUT_TYPES(int64)
#pragma pack()
DEF_W_OUTPUT_TYPES(uint64)
#pragma pack()
DEF_W_OUTPUT_TYPES(float)

#ifndef __NOAIECMPLX__
#pragma pack()
DEF_W_INPUT_TYPES(cint16)
#pragma pack()
DEF_W_INPUT_TYPES(cint32)
#pragma pack()
DEF_W_INPUT_TYPES(cfloat)
#pragma pack()
DEF_W_OUTPUT_TYPES(cint16)
#pragma pack()
DEF_W_OUTPUT_TYPES(cint32)
#pragma pack()
DEF_W_OUTPUT_TYPES(cfloat)
#endif

#else // !__NEW_WINDOW_H__
DEF_W_INPUT_TYPES(int8)
DEF_W_INPUT_TYPES(uint8)
DEF_W_INPUT_TYPES(int16)
DEF_W_INPUT_TYPES(uint16)
DEF_W_INPUT_TYPES(int32)
DEF_W_INPUT_TYPES(uint32)
DEF_W_INPUT_TYPES(int64)
DEF_W_INPUT_TYPES(uint64)
DEF_W_INPUT_TYPES(float)

DEF_W_OUTPUT_TYPES(int8)
DEF_W_OUTPUT_TYPES(uint8)
DEF_W_OUTPUT_TYPES(int16)
DEF_W_OUTPUT_TYPES(uint16)
DEF_W_OUTPUT_TYPES(int32)
DEF_W_OUTPUT_TYPES(uint32)
DEF_W_OUTPUT_TYPES(int64)
DEF_W_OUTPUT_TYPES(uint64)
DEF_W_OUTPUT_TYPES(float)

#ifndef __NOAIECMPLX__
DEF_W_INPUT_TYPES(cint16)
DEF_W_INPUT_TYPES(cint32)
DEF_W_INPUT_TYPES(cfloat)
DEF_W_OUTPUT_TYPES(cint16)
DEF_W_OUTPUT_TYPES(cint32)
DEF_W_OUTPUT_TYPES(cfloat)
#endif
#endif // !__NEW_WINDOW_H__

#undef DEF_W_INPUT_TYPES
#undef DEF_W_OUTPUT_TYPES

#else //else c++

#ifdef __NEW_WINDOW_H__
#pragma pack()
template<typename T> struct input_window
{
    unsigned int current_bufid;
    unsigned int instanceId;
    window_datatype* restrict ptr;
    window_datatype* restrict head;
    window_datatype* restrict heads[2];
    window_datatype* restrict buffer;
    window_datatype* restrict buffers[2];
    unsigned int size;
    unsigned int winsize;
#ifdef __NEW_X86Sim__
    CDNOx86Sim::IWindowConnector *conn;
#else //!__NEW_X86Sim__
    unsigned int lockids[2];
#endif
};

#pragma pack()
template<typename T> struct output_window
{
    unsigned int current_bufid;
    unsigned int instanceId;
    window_datatype* restrict ptr;
    window_datatype* restrict head;
    window_datatype* restrict heads[2];
    window_datatype* restrict buffer;
    window_datatype* restrict buffers[2];
    unsigned int size;
    unsigned int winsize;
#ifdef __NEW_X86Sim__
    CDNOx86Sim::IWindowConnector *conn;
#else //!__NEW_X86Sim__
    unsigned int lockids[2];
#endif
};

#else //!__NEW_WINDOW_H__

template<typename T> struct input_window
{
    window_datatype* restrict ptr;
    window_datatype* head;
    window_datatype* buffer;
    unsigned int size;
    unsigned int winsize;
};

template<typename T> struct output_window
{
    window_datatype* restrict ptr;
    window_datatype* head;
    window_datatype* buffer;
    unsigned int size;
    unsigned int winsize;
};

#endif //for #ifdef __NEW_WINDOW_H__

typedef input_window<int8> input_window_int8;
typedef input_window<uint8> input_window_uint8;
typedef input_window<int16> input_window_int16;
typedef input_window<uint16> input_window_uint16;
typedef input_window<int32> input_window_int32;
typedef input_window<uint32> input_window_uint32;
typedef input_window<int64> input_window_int64;
typedef input_window<uint64> input_window_uint64;
typedef input_window<float> input_window_float;

typedef output_window<int8> output_window_int8;
typedef output_window<uint8> output_window_uint8;
typedef output_window<int16> output_window_int16;
typedef output_window<uint16> output_window_uint16;
typedef output_window<int32> output_window_int32;
typedef output_window<uint32> output_window_uint32;
typedef output_window<int64> output_window_int64;
typedef output_window<uint64> output_window_uint64;
typedef output_window<float> output_window_float;

#ifndef __NOAIECMPLX__
typedef input_window<cint16> input_window_cint16;
typedef input_window<cint32> input_window_cint32;
typedef input_window<cfloat> input_window_cfloat;
typedef output_window<cint16> output_window_cint16;
typedef output_window<cint32> output_window_cint32;
typedef output_window<cfloat> output_window_cfloat;
#endif

#endif //for #ifdef NOCPP


#ifdef __NEW_WINDOW_H__
#define CAST_TYPES( direction, element_type )  \
  static inline  direction ## _window_ ## element_type *  get_ ## direction ## _async_window_ ## element_type(window_internal * wind ) { \
    direction ## _window_ ## element_type * toReturn = ( direction ## _window_ ## element_type *)wind; \
      return toReturn; \
  }
CAST_TYPES(input, int8)
CAST_TYPES(input, uint8)
CAST_TYPES(input, int16)
CAST_TYPES(input, uint16)
CAST_TYPES(input, int32)
CAST_TYPES(input, uint32)
CAST_TYPES(input, int64)
CAST_TYPES(input, uint64)
CAST_TYPES(input, float)
CAST_TYPES(output, int8)
CAST_TYPES(output, uint8)
CAST_TYPES(output, int16)
CAST_TYPES(output, uint16)
CAST_TYPES(output, int32)
CAST_TYPES(output, uint32)
CAST_TYPES(output, int64)
CAST_TYPES(output, uint64)
CAST_TYPES(output, float)

#ifndef __NOAIECMPLX__
CAST_TYPES(input, cint16)
CAST_TYPES(input, cint32)
CAST_TYPES(input, cfloat)
CAST_TYPES(output, cint16)
CAST_TYPES(output, cint32)
CAST_TYPES(output, cfloat)
#endif

#undef CAST_TYPES
#endif //  __NEW_WINDOW_H__

#define CAST_TYPES( direction, element_type )  \
  static inline  direction ## _window_ ## element_type *  get_ ## direction ## _window_ ## element_type(window_internal * wind ) { \
    direction ## _window_ ## element_type * toReturn = ( direction ## _window_ ## element_type *)wind; \
      toReturn->ptr = wind->head;\
      return toReturn; \
  }

CAST_TYPES(input, int8)
CAST_TYPES(input, uint8)
CAST_TYPES(input, int16)
CAST_TYPES(input, uint16)
CAST_TYPES(input, int32)
CAST_TYPES(input, uint32)
CAST_TYPES(input, int64)
CAST_TYPES(input, uint64)
CAST_TYPES(input, float)

CAST_TYPES(output, int8)
CAST_TYPES(output, uint8)
CAST_TYPES(output, int16)
CAST_TYPES(output, uint16)
CAST_TYPES(output, int32)
CAST_TYPES(output, uint32)
CAST_TYPES(output, int64)
CAST_TYPES(output, uint64)
CAST_TYPES(output, float)

#ifndef __NOAIECMPLX__
CAST_TYPES(input, cint16)
CAST_TYPES(input, cint32)
CAST_TYPES(input, cfloat)
CAST_TYPES(output, cint16)
CAST_TYPES(output, cint32)
CAST_TYPES(output, cfloat)
#endif

#undef CAST_TYPES

#ifdef __NEW_WINDOW_H__
#define COPY_TYPES( direction, element_type ) \
  static inline void window_copy(direction ## _window_ ## element_type *dst, direction ## _window_ ## element_type *src) { \
    dst->ptr    = chess_copy(src->ptr); \
    dst->head   = chess_copy(src->head); \
    dst->buffer = chess_copy(src->buffer); \
    dst->size   = chess_copy(src->size); \
    dst->winsize= chess_copy(src->winsize); \
  }
#else
#define COPY_TYPES( direction, element_type ) \
  static inline void window_copy(direction ## _window_ ## element_type *dst, direction ## _window_ ## element_type *src) { \
    dst->head   = chess_copy(src->head); \
    dst->ptr    = chess_copy(src->ptr); \
    dst->buffer = chess_copy(src->buffer); \
    dst->size   = chess_copy(src->size); \
    dst->winsize= chess_copy(src->winsize); \
  }
#endif
COPY_TYPES(input, int8)
COPY_TYPES(input, uint8)
COPY_TYPES(input, int16)
COPY_TYPES(input, uint16)
COPY_TYPES(input, int32)
COPY_TYPES(input, uint32)
COPY_TYPES(input, int64)
COPY_TYPES(input, uint64)
COPY_TYPES(input, float)

COPY_TYPES(output, int8)
COPY_TYPES(output, uint8)
COPY_TYPES(output, int16)
COPY_TYPES(output, uint16)
COPY_TYPES(output, int32)
COPY_TYPES(output, uint32)
COPY_TYPES(output, int64)
COPY_TYPES(output, uint64)
COPY_TYPES(output, float)

#ifndef __NOAIECMPLX__
COPY_TYPES(input, cint16)
COPY_TYPES(input, cint32)
COPY_TYPES(input, cfloat)
COPY_TYPES(output, cint16)
COPY_TYPES(output, cint32)
COPY_TYPES(output, cfloat)
#endif

#undef COPY_TYPES


#ifdef __NEW_WINDOW_H__
static inline void window_init(window_internal *w, 
			       int const channels, 
			       window_datatype *buffer_ping,
			       unsigned int lockid_ping, 
			       window_datatype *buffer_pong, 
			       unsigned int lockid_pong, 
			       int const size, 
			       int const winsize) {
    //assert(size % 8 == 0);
    for (int i = 0; i < channels; ++i) 
    {
        w[i].buffers[0] = buffer_ping+size*i;
        w[i].heads[0] = w[i].buffers[0];
      #ifdef __NEW_X86Sim__
        w[i].conn = nullptr;
      #else
	    w[i].lockids[0] =  lockid_ping;
      #endif
        w[i].buffers[1] = 0; /* null */
        w[i].heads[1] = 0; /* null */
      #ifndef __NEW_X86Sim__
        w[i].lockids[1] = -1; /* Invalid, dummy */
      #endif

	if (buffer_pong != buffer_ping) {  /* there is a separate pong buffer */
	    w[i].buffers[1] = buffer_pong+size*i;
	    w[i].heads[1] = w[i].buffers[1];
    #ifndef __NEW_X86Sim__
	     w[i].lockids[1] = lockid_pong;
    #endif
     }

	w[i].current_bufid = 0;
        w[i].buffer = w[i].buffers[0];
        w[i].head   = w[i].heads[0];
        w[i].ptr    = w[i].head;
        w[i].size   = size;
	w[i].winsize= winsize;
    }
}
#else
static inline void window_init(window_internal *w, int const channels, window_datatype *buffer, int const size, int const winsize)
{
    for (int i = 0; i < channels; ++i)
    {
        w[i].buffer = buffer+size*i;
        w[i].ptr    = w[i].buffer;
        w[i].head   = w[i].buffer;
        w[i].size   = size;
        w[i].winsize= winsize;
    }
}
#endif

#ifdef __NEW_WINDOW_H__
#define W_CTOR(type)                                                     \
  static inline void window_init(window_internal *w, int const channels, \
				   type *buffer_ping, unsigned int lockid_ping,	\
				   type *buffer_pong, unsigned int lockid_pong,	\
				   int const size, int const winsize)	\
  {\
    int s = (sizeof(type))/sizeof(window_datatype);									\
    int const sz = (size *s ); \
    int const winsz =  (winsize * s); \
    window_init(w,channels, (window_datatype *)buffer_ping, lockid_ping, (window_datatype *)buffer_pong, lockid_pong, sz, winsz); \
  }									\
  static inline void window_init(window_internal *w, int const channels, \
				   type *restrict buffer_ping, unsigned int lockid_ping,	\
				   type *restrict buffer_pong, unsigned int lockid_pong,	\
				   int const size)			\
  {									\
    int const sz = (size * sizeof(type))/sizeof(window_datatype);       \
    window_init (w, channels, buffer_ping, lockid_ping, buffer_pong, lockid_pong, sz, sz); \
  }     \
static inline void window_init(window_internal *w, int const channels, \
                                   type *buffer_ping,                        \
                                   int const size, int const winsize)   \
  {                                                                     \
    int s = (sizeof(type))/sizeof(window_datatype);                                                                     \
    int const sz = (size *s ); \
    int const winsz =  (winsize * s); \
    window_init(w,channels, (window_datatype *)buffer_ping, 0, (window_datatype *)buffer_ping, 0,sz, winsz); \
  }                                                                     \
  static inline void window_init(window_internal *w, int const channels, \
                                   type *buffer_ping,       \
                                   int const size)                      \
  {                                                                     \
    int const sz = (size * sizeof(type))/sizeof(window_datatype);       \
    window_init (w, channels, (window_datatype *)buffer_ping, 0, (window_datatype *)buffer_ping, 0, sz, sz); \
  }
#else
#define W_CTOR(type)                                                     \
  static inline void window_init(window_internal *w, int const channels, \
                                 type *buffer, int const size,           \
                                 int const winsize)                      \
  {                                                                      \
    int const sz = (size * sizeof(type))/sizeof(window_datatype);        \
    int const winsz =  (winsize * sizeof(type))/sizeof(window_datatype); \
    window_init(w,channels,(window_datatype *)buffer,sz, winsz);         \
  }                                                                      \
  static inline void window_init(window_internal *w, int const channels, \
                                 type *buffer, int const size)           \
  {                                                                      \
    window_init (w, channels, buffer, size, size);                       \
  }     
#endif                                                                 

/* First handle scalars. */
//W_CTOR(int8) -- This is default so no reason to handle again..
W_CTOR(uint8)
W_CTOR(int16)
W_CTOR(uint16)
W_CTOR(int32)
W_CTOR(uint32)
W_CTOR(int64)
W_CTOR(uint64)
W_CTOR(float)

#if __AIENGINE__!=2
/* 128 Bit Vectors.  */
W_CTOR(v16int8)
W_CTOR(v16uint8)
W_CTOR(v4int32)
W_CTOR(v8int16)
W_CTOR(v4float)
#endif

/* 256 Bit Vectors.  */
W_CTOR(v16int16)
//W_CTOR(v2int128)  
W_CTOR(v32int8)
W_CTOR(v32uint8)
W_CTOR(v4int64)
W_CTOR(v8int32)
W_CTOR(v8float)

/* 512 bit vectors.  */
W_CTOR(v16int32)
W_CTOR(v32int16)
W_CTOR(v64int8)
W_CTOR(v64uint8)
W_CTOR(v8int64)
W_CTOR(v16float)

/* 1024 bit vectors.  */
W_CTOR(v128int8)
W_CTOR(v128uint8)
W_CTOR(v32int32)
W_CTOR(v64int16)
#if __AIENGINE__!=2
W_CTOR(v32float)
#endif

#ifndef __NOAIECMPLX__
/* complex vectors */
W_CTOR(cint16)
W_CTOR(cint32)
W_CTOR(cfloat)

W_CTOR(v2cint32)
W_CTOR(v4cint16)
W_CTOR(v2cfloat)

//W_CTOR(v1cint128)    
//W_CTOR(v2cint64)
W_CTOR(v4cint32)
W_CTOR(v8cint16)
W_CTOR(v4cfloat)

W_CTOR(v8cint32)
W_CTOR(v16cint16)
//W_CTOR(v4cint64)
W_CTOR(v8cfloat)

W_CTOR(v16cint32)
W_CTOR(v32cint16)
W_CTOR(v16cfloat)
#endif

#undef W_CTOR

static inline void set_window_size(window_internal *w, int const size) {
  // int diff = (w->ptr - w->head)/sizeof(window_datatype);
  // w->winsize = (diff>0) ? diff : (diff+w->size);
  w->winsize = size;
  //printf("window@%x: size = %d, winsize = %d\n", (void*)(w->buffer), w->size, w->winsize);
}

static inline unsigned window_size(window_internal *w) {
  return w->winsize;
}

#define WINSIZE(type)                                                     \
  static inline void set_window_size(input_window_ ## type *w, int const size)  \
  {                                                                      \
    set_window_size((window_internal *)w,size*(sizeof(type)/sizeof(window_datatype))); 		 \
  }                                                                      \
  static inline void set_window_size(output_window_ ## type *w, int const size)  \
  {                                                                      \
    set_window_size((window_internal *)w,size*(sizeof(type)/sizeof(window_datatype))); 		 \
  }                                                                      \
  static inline unsigned window_size(input_window_ ## type *w) 		 \
  {                                                                      \
    return window_size((window_internal *)w)/(sizeof(type)/sizeof(window_datatype));		 \
  }                                                                      \
  static inline unsigned window_size(output_window_ ## type *w) 	 \
  {                                                                      \
    return window_size((window_internal *)w)/(sizeof(type)/sizeof(window_datatype));	         \
  }                                                                      

WINSIZE(int8)
WINSIZE(uint8) 
WINSIZE(int16)
WINSIZE(uint16)
WINSIZE(int32)
WINSIZE(uint32)
WINSIZE(int64)
WINSIZE(uint64)
WINSIZE(float)

#ifndef __NOAIECMPLX__
WINSIZE(cint16)
WINSIZE(cint32)
WINSIZE(cfloat)
#endif

static inline void window_copy(window_internal *dst, window_internal *src,
                               int const channels)
{
    for (int i = 0; i < channels; ++i)
    {
      dst[i].head   = chess_copy(src[i].head); 
      dst[i].ptr    = chess_copy(src[i].ptr); 
      dst[i].buffer = chess_copy(src[i].buffer); 
      dst[i].size   = chess_copy(src[i].size); 
      dst[i].winsize = chess_copy(src[i].winsize);  
    } 
} 

// Compiler-Inserted Window Operations

// buffer has a specific allocated amount of memory which starts at w->buffer and is of w->size in bytes

#ifdef __NEW_WINDOW_H__
static inline void window_incr_pingpong(window_internal *w, int count) { 
  // window_incr_pingpong() is very similar to window_incr() except that it increments both heads[0] and heads[1], 
  // and is only called outside the for(...test_iteration...) loop.
  //count *= sizeof(int8_t) / sizeof(window_datatype);
  w->heads[0] = cyclic_add(w->heads[0], count, w->buffers[0], w->size);
  //if (w->is_pingpong)
  w->heads[1] = cyclic_add(w->heads[1], count, w->buffers[1], w->size);
  w->head = w->heads[0];//w->current_bufid];
}
#endif
// increments in 8-bit chunks
  static inline void window_incr(window_internal * w, window_datatype *restrict ping_buffer,
                                window_datatype *restrict pong_buffer,int const index,int margin,
                                int count) {
    //count *= sizeof(int8_t) / sizeof(window_datatype);
    //printf("window@%x: size = %d, winsize = %d, count = %d\n", (void*)(w->buffer), w->size, w->winsize, count);
    window_datatype * restrict hd = (index ? pong_buffer : ping_buffer) + margin;
    hd = cyclic_add(hd, count, index ? pong_buffer : ping_buffer, w->size);
  }


// increments in 8-bit chunks
  static inline void window_incr(window_internal * w, int count) { 		   
    //count *= sizeof(int8_t) / sizeof(window_datatype);
    //printf("window@%x: size = %d, winsize = %d, count = %d\n", (void*)(w->buffer), w->size, w->winsize, count);
    w->head = cyclic_add(w->head, count, w->buffer, w->size);	
  }

#define COMPILER_INCR_DECR_OPS( type )				   \
  static inline void window_incr_ ## type(window_internal * w, int count) { \
    count *= sizeof(type) / sizeof(window_datatype);			   \
    w->head = cyclic_add(w->head, count, w->buffer, w->size);	  \
  }								  \
  static inline void window_decr_ ## type (window_internal * w, int count) { \
    window_incr_ ## type (w, -count);				  \
  }

#if __AIENGINE__!=2
/* 128 Bit Vectors.  */
COMPILER_INCR_DECR_OPS(v16int8)
COMPILER_INCR_DECR_OPS(v16uint8)
COMPILER_INCR_DECR_OPS(v4int32)
COMPILER_INCR_DECR_OPS(v8int16)
COMPILER_INCR_DECR_OPS(v4float)
#endif

/* 256 Bit Vectors.  */
COMPILER_INCR_DECR_OPS(v16int16)
//COMPILER_INCR_DECR_OPS(v2int128)  
COMPILER_INCR_DECR_OPS(v32int8)
COMPILER_INCR_DECR_OPS(v32uint8)
COMPILER_INCR_DECR_OPS(v4int64)
COMPILER_INCR_DECR_OPS(v8int32)
COMPILER_INCR_DECR_OPS(v8float)

/* 512 bit vectors.  */
COMPILER_INCR_DECR_OPS(v16int32)
COMPILER_INCR_DECR_OPS(v32int16)
COMPILER_INCR_DECR_OPS(v64int8)
COMPILER_INCR_DECR_OPS(v64uint8)
COMPILER_INCR_DECR_OPS(v8int64)
COMPILER_INCR_DECR_OPS(v16float)


/* 1024 bit vectors.  */
COMPILER_INCR_DECR_OPS(v128int8)
COMPILER_INCR_DECR_OPS(v128uint8)
COMPILER_INCR_DECR_OPS(v32int32)
COMPILER_INCR_DECR_OPS(v64int16)
#if __AIENGINE__!=2
COMPILER_INCR_DECR_OPS(v32float)
#endif

#ifndef __NOAIECMPLX__
COMPILER_INCR_DECR_OPS(v2cint32)
COMPILER_INCR_DECR_OPS(v4cint16)
COMPILER_INCR_DECR_OPS(v2cfloat)

//COMPILER_INCR_DECR_OPS(v1cint128)    
//COMPILER_INCR_DECR_OPS(v2cint64) 
COMPILER_INCR_DECR_OPS(v4cint32)
COMPILER_INCR_DECR_OPS(v8cint16)
COMPILER_INCR_DECR_OPS(v4cfloat)

COMPILER_INCR_DECR_OPS(v8cint32)
COMPILER_INCR_DECR_OPS(v16cint16)
//COMPILER_INCR_DECR_OPS(v4cint64)
COMPILER_INCR_DECR_OPS(v8cfloat)

COMPILER_INCR_DECR_OPS(v16cint32)
COMPILER_INCR_DECR_OPS(v32cint16)
COMPILER_INCR_DECR_OPS(v16cfloat)
#endif

// Customer-Facing Window Operations

#define INCR_SCALAR_OPS(direction, type)				      \
  static inline void window_incr(direction ## _window_ ## type * w, int count) { \
    count *= sizeof(type) / sizeof(window_datatype);  		      \
    w->ptr = cyclic_add(w->ptr, count, w->buffer, w->size);           \
  }

 #define DECR_SCALAR_OPS(direction, type)			      \
    static inline void window_decr(direction ## _window_ ## type * w, int count) { \
    window_incr(w, -count);  \
  } 


  INCR_SCALAR_OPS(input, int8)    
  INCR_SCALAR_OPS(input, uint8)   
  INCR_SCALAR_OPS(input, int16)   
  INCR_SCALAR_OPS(input, uint16)  
  INCR_SCALAR_OPS(input, int32)   
  INCR_SCALAR_OPS(input, uint32)  
  INCR_SCALAR_OPS(input, float)   
  INCR_SCALAR_OPS(input, int64)   
  INCR_SCALAR_OPS(input, uint64)  

  INCR_SCALAR_OPS(output, int8)   
  INCR_SCALAR_OPS(output, uint8)  
  INCR_SCALAR_OPS(output, int16)  
  INCR_SCALAR_OPS(output, uint16) 
  INCR_SCALAR_OPS(output, int32)  
  INCR_SCALAR_OPS(output, uint32) 
  INCR_SCALAR_OPS(output, float)  
  INCR_SCALAR_OPS(output, int64)  
  INCR_SCALAR_OPS(output, uint64) 

  DECR_SCALAR_OPS(input, int8)    
  DECR_SCALAR_OPS(input, uint8)   
  DECR_SCALAR_OPS(input, int16)   
  DECR_SCALAR_OPS(input, uint16)  
  DECR_SCALAR_OPS(input, int32)   
  DECR_SCALAR_OPS(input, uint32)  
  DECR_SCALAR_OPS(input, float)   
  DECR_SCALAR_OPS(input, int64)   
  DECR_SCALAR_OPS(input, uint64)  

  DECR_SCALAR_OPS(output, int8)   
  DECR_SCALAR_OPS(output, uint8)  
  DECR_SCALAR_OPS(output, int16)  
  DECR_SCALAR_OPS(output, uint16) 
  DECR_SCALAR_OPS(output, int32)  
  DECR_SCALAR_OPS(output, uint32) 
  DECR_SCALAR_OPS(output, float)  
  DECR_SCALAR_OPS(output, int64)  
  DECR_SCALAR_OPS(output, uint64) 

#ifndef __NOAIECMPLX__
  INCR_SCALAR_OPS(input, cint16)  
  INCR_SCALAR_OPS(input, cint32)  
  INCR_SCALAR_OPS(input, cfloat)  

  INCR_SCALAR_OPS(output, cint16) 
  INCR_SCALAR_OPS(output, cint32) 
  INCR_SCALAR_OPS(output, cfloat) 

  DECR_SCALAR_OPS(input, cint16)  
  DECR_SCALAR_OPS(input, cint32)  
  DECR_SCALAR_OPS(input, cfloat)  

  DECR_SCALAR_OPS(output, cint16) 
  DECR_SCALAR_OPS(output, cint32) 
  DECR_SCALAR_OPS(output, cfloat) 
#endif

#undef DECR_SCALAR_OPS
#undef INCR_SCALAR_OPS

#define INCR_VECTOR_OPS(direction, type, lanes)				      \
 static inline void window_incr_v ## lanes (direction ## _window_ ## type * w, int count) { \
    count *= lanes * sizeof(type) / sizeof(window_datatype);  						      \
    w->ptr = cyclic_add(w->ptr, count, w->buffer, w->size);             \
  }

#define DECR_VECTOR_OPS(direction, type, lanes)				      \
 static  inline void window_decr_v ## lanes (direction ## _window_ ## type * w, int count) { \
     window_incr_v ## lanes(w, -count);\
  }

  /* Handling 4 element vectors.  */
  INCR_VECTOR_OPS(input, int8, 4)    
  INCR_VECTOR_OPS(input, uint8, 4)   
  INCR_VECTOR_OPS(input, int16, 4)   
  INCR_VECTOR_OPS(input, uint16, 4)  
  INCR_VECTOR_OPS(input, int32, 4)   
  INCR_VECTOR_OPS(input, uint32, 4)  
  INCR_VECTOR_OPS(input, int64, 4)   
  INCR_VECTOR_OPS(input, uint64, 4)  
  INCR_VECTOR_OPS(input, float, 4)   

  INCR_VECTOR_OPS(output, int8, 4)   
  INCR_VECTOR_OPS(output, uint8, 4)  
  INCR_VECTOR_OPS(output, int16, 4)  
  INCR_VECTOR_OPS(output, uint16, 4) 
  INCR_VECTOR_OPS(output, int32, 4)  
  INCR_VECTOR_OPS(output, uint32, 4) 
  INCR_VECTOR_OPS(output, int64, 4)  
  INCR_VECTOR_OPS(output, uint64, 4) 
  INCR_VECTOR_OPS(output, float, 4)  

  DECR_VECTOR_OPS(input, int8, 4)   
  DECR_VECTOR_OPS(input, uint8, 4)  
  DECR_VECTOR_OPS(input, int16, 4)  
  DECR_VECTOR_OPS(input, uint16, 4) 
  DECR_VECTOR_OPS(input, int32, 4)  
  DECR_VECTOR_OPS(input, uint32, 4) 
  DECR_VECTOR_OPS(input, int64, 4)  
  DECR_VECTOR_OPS(input, uint64, 4) 
  DECR_VECTOR_OPS(input, float, 4)  

  DECR_VECTOR_OPS(output, int8, 4)   
  DECR_VECTOR_OPS(output, uint8, 4)  
  DECR_VECTOR_OPS(output, int16, 4)  
  DECR_VECTOR_OPS(output, uint16, 4) 
  DECR_VECTOR_OPS(output, int32, 4)  
  DECR_VECTOR_OPS(output, uint32, 4) 
  DECR_VECTOR_OPS(output, int64, 4)  
  DECR_VECTOR_OPS(output, uint64, 4) 
  DECR_VECTOR_OPS(output, float, 4)  

  /* Handling 8 element vectors. */
  INCR_VECTOR_OPS(input, int8,  8)   
  INCR_VECTOR_OPS(input, uint8, 8)   
  INCR_VECTOR_OPS(input, int16, 8)   
  INCR_VECTOR_OPS(input, uint16, 8)  
  INCR_VECTOR_OPS(input, int32, 8)   
  INCR_VECTOR_OPS(input, uint32, 8)  
  INCR_VECTOR_OPS(input, float, 8)   
  INCR_VECTOR_OPS(input, int64, 8)   
  INCR_VECTOR_OPS(input, uint64, 8)  
 
  INCR_VECTOR_OPS(output, int8, 8)   
  INCR_VECTOR_OPS(output, uint8, 8)  
  INCR_VECTOR_OPS(output, int16, 8)  
  INCR_VECTOR_OPS(output, uint16, 8) 
  INCR_VECTOR_OPS(output, int32, 8)  
  INCR_VECTOR_OPS(output, uint32, 8) 
  INCR_VECTOR_OPS(output, float, 8)  
  INCR_VECTOR_OPS(output, int64, 8)  
  INCR_VECTOR_OPS(output, uint64, 8) 

  DECR_VECTOR_OPS(input, int8, 8)    
  DECR_VECTOR_OPS(input, uint8, 8)   
  DECR_VECTOR_OPS(input, int16, 8)   
  DECR_VECTOR_OPS(input, uint16, 8)  
  DECR_VECTOR_OPS(input, int32, 8)   
  DECR_VECTOR_OPS(input, uint32, 8)  
  DECR_VECTOR_OPS(input, float, 8)   
  DECR_VECTOR_OPS(input, int64, 8)   
  DECR_VECTOR_OPS(input, uint64, 8)  

  DECR_VECTOR_OPS(output, int8, 8)   
  DECR_VECTOR_OPS(output, uint8, 8)  
  DECR_VECTOR_OPS(output, int16, 8)  
  DECR_VECTOR_OPS(output, uint16, 8) 
  DECR_VECTOR_OPS(output, int32, 8)  
  DECR_VECTOR_OPS(output, uint32, 8) 
  DECR_VECTOR_OPS(output, float, 8)  
  DECR_VECTOR_OPS(output, int64, 8)  
  DECR_VECTOR_OPS(output, uint64, 8) 


  /* Handling 16 element vectors.  */
  INCR_VECTOR_OPS(input, int8,  16)   
  INCR_VECTOR_OPS(input, uint8, 16)   
  INCR_VECTOR_OPS(input, int16,  16)  
  INCR_VECTOR_OPS(input, uint16, 16)  
  INCR_VECTOR_OPS(input, int32,  16)  
  INCR_VECTOR_OPS(input, uint32, 16)  
  INCR_VECTOR_OPS(input, float,  16)  
  INCR_VECTOR_OPS(input, int64, 16)   
  INCR_VECTOR_OPS(input, uint64, 16)  

  DECR_VECTOR_OPS(input, int8,  16)   
  DECR_VECTOR_OPS(input, uint8, 16)   
  DECR_VECTOR_OPS(input, int16,  16)  
  DECR_VECTOR_OPS(input, uint16, 16)  
  DECR_VECTOR_OPS(input, int32,  16)  
  DECR_VECTOR_OPS(input, uint32, 16)  
  DECR_VECTOR_OPS(input, float,  16)  
  DECR_VECTOR_OPS(input, int64,  16)  
  DECR_VECTOR_OPS(input, uint64, 16)  
 
  INCR_VECTOR_OPS(output, int8,  16)  
  INCR_VECTOR_OPS(output, uint8, 16)  
  INCR_VECTOR_OPS(output, int16,  16) 
  INCR_VECTOR_OPS(output, uint16, 16) 
  INCR_VECTOR_OPS(output, int32,  16) 
  INCR_VECTOR_OPS(output, uint32, 16) 
  INCR_VECTOR_OPS(output, float,  16) 
  INCR_VECTOR_OPS(output, int64, 16)  
  INCR_VECTOR_OPS(output, uint64, 16) 

  DECR_VECTOR_OPS(output, int8,  16)  
  DECR_VECTOR_OPS(output, uint8, 16)  
  DECR_VECTOR_OPS(output, int16,  16) 
  DECR_VECTOR_OPS(output, uint16, 16) 
  DECR_VECTOR_OPS(output, int32,  16) 
  DECR_VECTOR_OPS(output, uint32, 16) 
  DECR_VECTOR_OPS(output, float,  16) 
  DECR_VECTOR_OPS(output, int64, 16)  
  DECR_VECTOR_OPS(output, uint64, 16) 

  /* Handle 32 element vectors.  */
  INCR_VECTOR_OPS(input, int8,  32)   
  INCR_VECTOR_OPS(input, uint8, 32)   
  INCR_VECTOR_OPS(input, int16,  32)  
  INCR_VECTOR_OPS(input, uint16, 32)  
  INCR_VECTOR_OPS(input, int32,  32)  
  INCR_VECTOR_OPS(input, uint32, 32)  
  INCR_VECTOR_OPS(input, float,  32)  

  DECR_VECTOR_OPS(input, int8,  32)   
  DECR_VECTOR_OPS(input, uint8, 32)   
  DECR_VECTOR_OPS(input, int16,  32)  
  DECR_VECTOR_OPS(input, uint16, 32)  
  DECR_VECTOR_OPS(input, int32,  32)  
  DECR_VECTOR_OPS(input, uint32, 32)  
  DECR_VECTOR_OPS(input, float,  32)  
 
  INCR_VECTOR_OPS(output, int8,  32)  
  INCR_VECTOR_OPS(output, uint8, 32)  
  INCR_VECTOR_OPS(output, int16, 32)  
  INCR_VECTOR_OPS(output, uint16, 32) 
  INCR_VECTOR_OPS(output, int32,  32) 
  INCR_VECTOR_OPS(output, uint32, 32) 
  INCR_VECTOR_OPS(output, float,  32) 

  DECR_VECTOR_OPS(output, int8,  32)  
  DECR_VECTOR_OPS(output, uint8, 32)  
  DECR_VECTOR_OPS(output, int16,  32) 
  DECR_VECTOR_OPS(output, uint16, 32) 
  DECR_VECTOR_OPS(output, int32,  32) 
  DECR_VECTOR_OPS(output, uint32, 32) 
  DECR_VECTOR_OPS(output, float,  32) 

  /* Handles 64 element vectors.  */
  INCR_VECTOR_OPS(input, int8,  64)   
  INCR_VECTOR_OPS(input, uint8, 64)   
  INCR_VECTOR_OPS(input, int16,  64)  
  INCR_VECTOR_OPS(input, uint16, 64)  

  DECR_VECTOR_OPS(input, int8,  64)   
  DECR_VECTOR_OPS(input, uint8, 64)   
  DECR_VECTOR_OPS(input, int16,  64)  
  DECR_VECTOR_OPS(input, uint16, 64)  
 
  INCR_VECTOR_OPS(output, int8,  64)  
  INCR_VECTOR_OPS(output, uint8, 64)  
  INCR_VECTOR_OPS(output, int16, 64)  
  INCR_VECTOR_OPS(output, uint16, 64) 

  DECR_VECTOR_OPS(output, int8,  64)  
  DECR_VECTOR_OPS(output, uint8, 64)  
  DECR_VECTOR_OPS(output, int16,  64) 
  DECR_VECTOR_OPS(output, uint16, 64) 


#ifndef __NOAIECMPLX__
  INCR_VECTOR_OPS(input, cint16, 4)  
  INCR_VECTOR_OPS(input, cint32, 4)  
  INCR_VECTOR_OPS(input, cfloat, 4)  
  INCR_VECTOR_OPS(input, cint16, 8)  
  INCR_VECTOR_OPS(input, cint32, 8)  
  INCR_VECTOR_OPS(input, cfloat, 8)  
  INCR_VECTOR_OPS(input, cint16, 16)  
  INCR_VECTOR_OPS(input, cint32, 16)  
  INCR_VECTOR_OPS(input, cfloat, 16)  
  INCR_VECTOR_OPS(input, cint16, 32)  

  INCR_VECTOR_OPS(output, cint16, 4) 
  INCR_VECTOR_OPS(output, cint32, 4) 
  INCR_VECTOR_OPS(output, cfloat, 4) 
  INCR_VECTOR_OPS(output, cint16, 8) 
  INCR_VECTOR_OPS(output, cint32, 8) 
  INCR_VECTOR_OPS(output, cfloat, 8) 
  INCR_VECTOR_OPS(output, cint16, 16) 
  INCR_VECTOR_OPS(output, cint32, 16) 
  INCR_VECTOR_OPS(output, cfloat, 16) 
  INCR_VECTOR_OPS(output, cint16, 32) 

  DECR_VECTOR_OPS(input, cint16, 4) 
  DECR_VECTOR_OPS(input, cint32, 4) 
  DECR_VECTOR_OPS(input, cfloat, 4) 
  DECR_VECTOR_OPS(input, cint16, 8)  
  DECR_VECTOR_OPS(input, cint32, 8)  
  DECR_VECTOR_OPS(input, cfloat, 8)  
  DECR_VECTOR_OPS(input, cint16, 16)  
  DECR_VECTOR_OPS(input, cint32, 16)  
  DECR_VECTOR_OPS(input, cfloat, 16)  
  DECR_VECTOR_OPS(input, cint16, 32)  

  DECR_VECTOR_OPS(output, cint16, 4) 
  DECR_VECTOR_OPS(output, cint32, 4) 
  DECR_VECTOR_OPS(output, cfloat, 4) 
  DECR_VECTOR_OPS(output, cint16, 8) 
  DECR_VECTOR_OPS(output, cint32, 8) 
  DECR_VECTOR_OPS(output, cfloat, 8) 
  DECR_VECTOR_OPS(output, cint16, 16) 
  DECR_VECTOR_OPS(output, cint32, 16) 
  DECR_VECTOR_OPS(output, cfloat, 16) 
  DECR_VECTOR_OPS(output, cint16, 32) 
#endif
  
#undef INCR_VECTOR_OPS
#undef DECR_VECTOR_OPS

// Scalar Read / Writes

#define SCALAR_OPS(scalartype)                   						\
  static inline void window_write(output_window_ ## scalartype * w, scalartype value) {		\
    *((scalartype * restrict)(w->ptr)) = value;	                      \
  }						                      \
  static inline void window_writeincr(output_window_ ## scalartype * w, scalartype value) {     \
    *((scalartype * restrict)(w->ptr)) = value;                      	\
     window_incr(w,1);        	        	\
  }                      									\
  static inline scalartype window_read(input_window_ ## scalartype *w) {                        \
  return *((scalartype * restrict)(w->ptr));          					        \
  } 						                         			\
  static inline void window_read(input_window_ ## scalartype *w, scalartype & value) {          \
  value = *((scalartype * restrict)(w->ptr));                  					\
  }                            									\
  static inline void window_readincr(input_window_ ## scalartype *w, scalartype & value) {      \
   value = *((scalartype * restrict)(w->ptr));						        \
   window_incr(w,1);                    \
  }                                                                                             \
  static inline scalartype window_readincr(input_window_ ## scalartype *w) {                    \
    scalartype  value;					                                 	\
    window_readincr(w, value);					                         	\
    return value;                                                                               \
 } 

  
  SCALAR_OPS(int8)   // writes 1-bytes
  SCALAR_OPS(uint8)  // writes 1-bytes
  SCALAR_OPS(int16)  // writes 2-bytes
  SCALAR_OPS(uint16) // writes 2-bytes
  SCALAR_OPS(int32)  // writes 4-bytes
  SCALAR_OPS(uint32) // writes 4-bytes
  SCALAR_OPS(float)  // writes 4-bytes
  SCALAR_OPS(int64)  // writes 8-bytes
  SCALAR_OPS(uint64) // writes 8-bytes

#ifndef __NOAIECMPLX__
  SCALAR_OPS(cint16) // writes 4-bytes
  SCALAR_OPS(cint32) // writes 8-bytes
  SCALAR_OPS(cfloat) // writes 8-bytes
#endif

#undef SCALAR_OPS

// Vector Reads / Writes

#define VECTOR_OPS( type, lanes)                                   					\
  static inline void window_write(output_window_ ## type * w, v ## lanes ## type  value) {		\
    *((v ## lanes ## type * restrict)(w->ptr)) = value;			                                \
  }                                                                                                     \
  static inline void window_write(window_internal * w, v ## lanes ## type  value) {	   	                \
    *((v ## lanes ## type * restrict)(w->head)) = value;               				       	\
  }						                            			        \
  static inline void window_writeincr(output_window_ ## type *w, v ## lanes ## type  value) {           \
    *((v ## lanes ## type  * restrict)(w->ptr)) = value;                       				\
     window_incr_v ## lanes (w,1);                    					              	\
  }			     							                        \
  static inline void window_read(input_window_ ## type * w, v ## lanes ## type & value ) {              \
    value = *((v ## lanes ## type * restrict)(w->ptr));                        				\
  }									                                \
  static inline void window_read(window_internal * w, v ## lanes ## type & value ) {                             \
    value = *((v ## lanes ## type * restrict)(w->head));                       				\
  }                                                                                                     \
  static inline v ## lanes ## type window_read_v ## lanes (input_window_ ## type * w) {                 \
    v ## lanes ## type aux = *((v ## lanes ## type * restrict)(w->ptr));                                \
    return aux;                                                                                         \
  }                                                                                                     \
  static inline void window_readincr(input_window_ ## type *w, v ## lanes ## type & value) {            \
    value = *((v ## lanes ## type * restrict)(w->ptr));                        				\
    window_incr_v ## lanes (w, 1);							                \
  }                                                                                                     \
  static inline v ## lanes ## type window_readincr_v ## lanes (input_window_ ## type * w) {             \
    v ## lanes ## type aux = *((v ## lanes ## type * restrict)(w->ptr));                                \
    int count = lanes * sizeof(type) / sizeof(window_datatype);  					\
    w->ptr = cyclic_add(w->ptr, count, w->buffer, w->size);                                             \
    return aux;                                                                                         \
  }                                                                                                     \
  static inline void window_readdecr(input_window_ ## type *w, v ## lanes ## type & value) {            \
    value = *((v ## lanes ## type * restrict)(w->ptr));                        				\
    window_decr_v ## lanes (w, 1);							                \
  }                      									        \
  static inline v ## lanes ## type window_readdecr_v ## lanes (input_window_ ## type * w) {             \
    v ## lanes ## type aux = *((v ## lanes ## type * restrict)(w->ptr));                                \
    int count = lanes * sizeof(type) / sizeof(window_datatype);  					\
    w->ptr = cyclic_add(w->ptr, -count, w->buffer, w->size);                                            \
    return aux;                                                                                         \
  }                                                                                                     

#if __AIENGINE__!=2
/* 128-bit ops */
  VECTOR_OPS(int32, 4)
  VECTOR_OPS(int16, 8)
  //VECTOR_OPS(uint16,8)
  VECTOR_OPS(int8, 16)
  VECTOR_OPS(uint8, 16)
  VECTOR_OPS(float, 4)
#endif

/* 256-bit ops */
  VECTOR_OPS(int64, 4)
  VECTOR_OPS(int32, 8)
  VECTOR_OPS(int16, 16)
  VECTOR_OPS(int8, 32)
  VECTOR_OPS(uint8,32)
  VECTOR_OPS(float, 8)

/* 512-bit ops */
  VECTOR_OPS(int32, 16)
  VECTOR_OPS(int16,32)
  VECTOR_OPS(int8,64)
  VECTOR_OPS(uint8,64)
  VECTOR_OPS(float, 16)

/* 1024-bit ops */
  VECTOR_OPS(int32,32)
  VECTOR_OPS(int16,64)
  VECTOR_OPS(float,32)
  
#ifndef __NOAIECMPLX__
  VECTOR_OPS(cint16, 4)
  VECTOR_OPS(cint32, 4)
  VECTOR_OPS(cfloat, 4)
  VECTOR_OPS(cint16, 8)
  VECTOR_OPS(cint16, 16)
  VECTOR_OPS(cint32, 16)
  VECTOR_OPS(cfloat, 16)
  VECTOR_OPS(cint16, 32)
#endif

#undef VECTOR_OPS

#ifdef __NEW_WINDOW_H__
static inline void window_bypass_copy(window_internal *win,
                                      window_internal *wout,
                                      unsigned int margin,
                                      unsigned int blocksize,unsigned int phase)
{
  int count = (margin/WINDOW_DATATYPE_SIZE);
  count *= sizeof(int8_t) / sizeof(window_datatype);
  //int phasein = phase & win->current_bufid;
  //int phaseout = phase & wout->current_bufid;
  win->head = cyclic_add(win->head, count, win->buffer, win->size);
  count = 8*(sizeof(int32)/WINDOW_DATATYPE_SIZE);
  count *= sizeof(int8_t) / sizeof(window_datatype);
  for (unsigned int i = 0; i < (blocksize/WINDOW_DATATYPE_SIZE)/32; ++i) {
    v8int32 tmp;
    tmp = *((v8int32  * restrict)(win->head));
    win->head = cyclic_add(win->head ,count, win->buffer, win->size);
    *((v8int32  * restrict)(wout->head)) = tmp;
    wout->head = cyclic_add(wout->head, count, wout->buffer, wout->size);
  }
  count = (-(margin/WINDOW_DATATYPE_SIZE)-(blocksize/WINDOW_DATATYPE_SIZE));
  count *= sizeof(int8_t) / sizeof(window_datatype);
  win->head = cyclic_add(win->head, count, win->buffer, win->size);
  count = -(blocksize/WINDOW_DATATYPE_SIZE);
  count *= sizeof(int8_t) / sizeof(window_datatype);
  wout->head = cyclic_add(wout->head, count, wout->buffer, wout->size);
}

static inline void window_margin_copy(window_internal *w,
                                      unsigned  int margin)
{
  unsigned  int id = w->current_bufid;
  //int count = window_size(w);
  //int sz = 8*(sizeof(int32)/WINDOW_DATATYPE_SIZE);
  //int sz1 = sizeof(int8_t) / sizeof(window_datatype);
  //count *= sizeof(int8_t) / sizeof(window_datatype);
   window_datatype *restrict h1 = w->heads[1-id];
   window_datatype *restrict h2 = w->heads[id];
   window_datatype *restrict buf1 = w->buffers[1-id];
   window_datatype *restrict buf2  = w->buffers[id];
  h2 = cyclic_add(h2, w->winsize, buf2, w->size);
  //count = sz ;
  for (unsigned int k = 0; k < margin/32; ++k)
      chess_flatten_loop
  {
    v8int32 chess_storage(wc0) tmp;
    tmp = *((v8int32  * restrict)(h2));
    h2 = cyclic_add(h2, 8*(sizeof(int32)), buf2, w->size);
    *((v8int32  * restrict)(h1)) = tmp;
    h1 = cyclic_add(h1, 8*(sizeof(int32)), buf1, w->size);
  }
  int msize = -(margin);
  //count = -(margin/WINDOW_DATATYPE_SIZE)-window_size(w) ;
  h2 = cyclic_add(h2, msize-w->winsize,buf2, w->size);
  //count = -(margin/WINDOW_DATATYPE_SIZE) ;
  h1 = cyclic_add(h1, msize,buf1, w->size);
  w->heads[1-id] = h1;
  w->heads[id] = h2;
  w->buffers[1-id] = buf1;
  w->buffers[id] = buf2;
  //chess_separator();
}

static inline void window_margin_copy(window_internal *w, 
                                      unsigned const int margin, 
                                      window_datatype * restrict ping_buffer,
                                      window_datatype * restrict pong_buffer, 
                                      const int index)
{
 // int id = 1-i;//w->current_bufid;
  //int count = window_size(w);
  //int sz = 8*(sizeof(int32)/WINDOW_DATATYPE_SIZE);
  //int sz1 = sizeof(int8_t) / sizeof(window_datatype);
  //count *= sizeof(int8_t) / sizeof(window_datatype);
   window_datatype *restrict h1 = index ? ping_buffer : pong_buffer;//w->heads[1-index];
   window_datatype *restrict h2 = index ? pong_buffer : ping_buffer;//index ? w->heads[1] : w->heads[0];
   window_datatype *restrict buf1 = index ? ping_buffer : pong_buffer; //w->buffers[1-index];
   window_datatype *restrict buf2  = index ? pong_buffer : ping_buffer;//index ? w->buffers[1] : w->buffers[0];
  h2 = cyclic_add(h2, w->winsize, buf2, w->size);
  //count = sz ;
  for (unsigned int k = 0; k < margin/32; ++k)
     //chess_unroll_loop(*)
  {
       v8int32 tmp;
       tmp = *((v8int32  * restrict)(h2));
       h2 = cyclic_add(h2, 8*(sizeof(int32)), buf2, chess_copy(w->size));
       *((v8int32  * restrict)(h1)) = tmp;
       h1 = cyclic_add(h1, 8*(sizeof(int32)), buf1, chess_copy(w->size));
  }
  //int msize = -(margin);
  //count = -(margin/WINDOW_DATATYPE_SIZE)-window_size(w) ;
  h2 = cyclic_add(h2, -(margin)-w->winsize,buf2, w->size); 
  //count = -(margin/WINDOW_DATATYPE_SIZE) ;
  h1 = cyclic_add(h1, -(margin),buf1, w->size);
  //w->heads[1-index] = h1;
  //w->heads[index] = h2;
  (index ? ping_buffer : pong_buffer ) = buf1; 
  //w->buffers[1-index] = buf1;
 (index ?  pong_buffer : ping_buffer ) = buf2 ;
 // w->buffers[index] = buf2;
  //chess_separator();
}

static inline void window_acquire(window_internal* w) {

 /* Currently window_acquire without Lock Type is a nop.
  * This API is generated to make consistencies with lock
  * decided by interposer. Ports without locks decided by
  * interposer should be called with this API to make
  * consistencies with lock acquired by ports.
  */
}

static inline void window_release(window_internal* w) {
    
 /* Currently window_release without Lock Type is a nop.
  * This API is generated to make consistencies with lock
  * decided by interposer. Ports without locks decided by
  * interposer should be called with this API to make
  * consistencies with lock acquired by ports.
  */
}

#ifdef __NEW_X86Sim__
namespace CDNOx86Sim {
    void windowAcquire(window_internal* w, int type);
    void windowRelease(window_internal* w, int type);
}

#undef ACQREL_OPS

#define ACQREL_OPS(scalartype)					      \
  static inline void window_acquire(input_window_ ## scalartype* w) { \
      CDNOx86Sim::windowAcquire((window_internal*) w, FOR_READ);\
  }\
  static inline void window_release(input_window_ ## scalartype* w) {	\
      CDNOx86Sim::windowRelease((window_internal*) w, FOR_WRITE);\
  }\
  static inline void window_acquire(output_window_ ## scalartype* w) {	\
      CDNOx86Sim::windowAcquire((window_internal*) w, FOR_WRITE);\
  } \
  static inline void window_release(output_window_ ## scalartype* w) {	\
      CDNOx86Sim::windowRelease((window_internal*) w, FOR_READ);\
  }

ACQREL_OPS(int8)
ACQREL_OPS(uint8)
ACQREL_OPS(int16)
ACQREL_OPS(uint16)
ACQREL_OPS(int32)
ACQREL_OPS(uint32)
ACQREL_OPS(int64)
ACQREL_OPS(uint64)

#ifndef __NOAIECMPLX__
ACQREL_OPS(cint16)
ACQREL_OPS(cint32)
#endif

#undef ACQREL_OPS


#else // ! __NEW_X86Sim__
#if 0
static inline void window_acquire(window_internal* w, int type) {
    // if (w->is_pingpong) {
    //   w->buffer = w->buffers[w->current_bufid];
    //   w->head = w->heads[w->current_bufid];
    //   w->lockid = w->lockids[w->current_bufid];
    // }
    // Below is the shortcut for the above, since w->is_pingpong is 0 or 1, 
    // and the answer is 0 for the former case, while it is w->current_bufid for the latter case:
    //acquire(w->lockids[w->is_pingpong & w->current_bufid],type);
    //unsigned char id = w->current_bufid;
    w->buffer = w->current_bufid ? (w->buffers[1]) : w->buffers[0];
    w->head = w->current_bufid ? w->heads[1] : w->heads[0];
//    w->ptr = w->head; 
    int lockid =  w->current_bufid ? w->lockids[1] : w->lockids[0];
    acquire(lockid, type);
}

static inline void window_release(window_internal* w, int type) {
    // TBD: Pull margin copy code inside this function.
    //release(w->lockid, type);
    // w->current_bufid = w->is_pingpong ? (1 - w->current_bufid) : w->current_bufid;
    // Below is the shortcut for the above, since w->is_pingpong is 0 or 1, 
    // and w->current_bufid stays 0 for the former case, while it toggles for the latter case:
 //   unsigned char id = w->current_bufid;
    w->heads[w->current_bufid] = w->head;
    int lockid =  w->current_bufid ? w->lockids[1] : w->lockids[0];
    w->current_bufid = 1 - w->current_bufid;
    release(lockid, type);
}
#endif
static inline void window_acquire(window_internal* w, 
                                  unsigned int ping_lockid,
                                  unsigned int pong_lockid,
                                  window_datatype * restrict ping_buffer,
                                  window_datatype * restrict pong_buffer,
                                  const int margin, 
                                  const int index,
                                  int type) {
    // if (w->is_pingpong) {
    //   w->buffer = w->buffers[w->current_bufid];
    //   w->head = w->heads[w->current_bufid];
    //   w->lockid = w->lockids[w->current_bufid];
    // }
    // Below is the shortcut for the above, since w->is_pingpong is 0 or 1, 
    // and the answer is 0 for the former case, while it is w->current_bufid for the latter case:
    //acquire(w->lockids[w->is_pingpong & w->current_bufid],type);
    w->buffer = index ? pong_buffer : ping_buffer;
    int lockid = index ? pong_lockid : ping_lockid; 
    w->head =   (index ? pong_buffer  : ping_buffer ) + margin;
    //w->ptr =   index ? w->heads[1] : w->heads[0];
    //w->ptr = w->head; 
    //int lockid =  index ? w->lockids[1] : w->lockids[0];
    acquire(lockid, type);

}

static inline void window_release(window_internal* w, 
                                  unsigned int ping_lockid,
                                  unsigned int pong_lockid,
                                  window_datatype * restrict ping_buffer,
                                  window_datatype * restrict pong_buffer,
                                  const int margin,
                                  const int index,
                                  int type) {
    // TBD: Pull margin copy code inside this function.
    //release(w->lockid, type);
    // w->current_bufid = w->is_pingpong ? (1 - w->current_bufid) : w->current_bufid;
    // Below is the shortcut for the above, since w->is_pingpong is 0 or 1, 
    // and w->current_bufid stays 0 for the former case, while it toggles for the latter case:
    window_datatype *restrict h1 = (index ? pong_buffer : ping_buffer) + margin;
    h1 = w->head;
   int lockid =  index ? pong_lockid : ping_lockid ;//w->lockids[1] : w->lockids[0];
   // w->current_bufid = 1 - w->current_bufid;
   release(lockid, type);
}


#undef ACQREL_OPS

#define ACQREL_OPS(scalartype)					      \
  static inline void window_acquire(input_window_ ## scalartype* w) { \
    w->buffer = w->current_bufid ? w->buffers[1]: w->buffers[0];		\
    w->head = w->ptr =  w->current_bufid ? w->heads[1]: w->heads[0];		\
    int lockid =  w->current_bufid ? w->lockids[1] : w->lockids[0]; \
    acquire(lockid, ACQ_READ);					\
  }									\
  static inline void window_release(input_window_ ## scalartype* w) {	\
    int lockid =  w->current_bufid ? w->lockids[1] : w->lockids[0]; \
    release(lockid, REL_WRITE);					\
    w->heads[w->current_bufid] = w->head;\
    w->current_bufid = 1 - (w->current_bufid);		\
  }									\
  static inline void window_acquire(output_window_ ## scalartype* w) {	\
    w->buffer = w->current_bufid ? w->buffers[1]: w->buffers[0];                \
    w->head = w->ptr =  w->current_bufid ? w->heads[1]: w->heads[0];            \
    int lockid =  w->current_bufid ? w->lockids[1] : w->lockids[0]; \
    acquire(lockid, ACQ_WRITE);                                  \
  }                                                             \
  static inline void window_release(output_window_ ## scalartype* w) {	\
    int lockid =  w->current_bufid ? w->lockids[1] : w->lockids[0];\
    release(lockid, REL_READ);					\
    w->heads[w->current_bufid] = w->head;\
    w->current_bufid = 1 - (w->current_bufid);		\
  }\
  static inline void window_acquire(input_window_ ## scalartype *w,\
                                    int const id,\
                                    unsigned int const ping_lockid, \
                                    unsigned int const pong_lockid,\
                                    window_datatype *restrict ping_buffer,\
                                    window_datatype  *restrict pong_buffer,\
                                    bool const &isbufferHeadNotRequired = 0) { \
    if (isbufferHeadNotRequired)\
      w->ptr =  (id ? pong_buffer : ping_buffer);\
    else {\
      w->ptr =  (id ? pong_buffer : ping_buffer);\
      w->head =  (id ? pong_buffer : ping_buffer);\
      w->buffer =  (id? pong_buffer : ping_buffer);\
    }\
    int  lockid =  id ? pong_lockid : ping_lockid;\
    acquire(lockid, ACQ_READ);                                  \
  }            \
  static inline void window_release(input_window_ ## scalartype *w, \
                                    unsigned int const id,\
                                    unsigned int const ping_lockid,\
                                    unsigned int const pong_lockid,\
                                    window_datatype  *restrict ping_buffer,\
                                    window_datatype  *restrict pong_buffer,\
                                    bool const &isbufferHeadNotRequired = 0) {     \
    int lockid = id ? pong_lockid : ping_lockid;\
    if (isbufferHeadNotRequired)\
      release(lockid, REL_WRITE);        \
    else {\
      window_datatype *restrict h1 = (id ? pong_buffer : ping_buffer);\
      h1 = w->head;\
      release(lockid, REL_WRITE);                                  \
    }                      \
  }                                                             \
  static inline void window_acquire(output_window_ ## scalartype *w,\
                                    int const id,\
                                    unsigned int const ping_lockid,\
                                    unsigned int const pong_lockid,\
                                    window_datatype *restrict ping_buffer,\
                                    window_datatype *restrict pong_buffer,\
                                    bool const &isbufferHeadNotRequired = 0) { \
    if (isbufferHeadNotRequired)\
      w->ptr =  (id ? pong_buffer : ping_buffer);\
    else {\
      w->ptr =  (id ? pong_buffer : ping_buffer);\
      w->head =  (id ? pong_buffer : ping_buffer);\
      w->buffer =  (id ? pong_buffer : ping_buffer);\
    }\
    int  lockid =  id ? pong_lockid : ping_lockid;\
    acquire(lockid, ACQ_WRITE);                                  \
  }                                                             \
  static inline void window_release(output_window_ ## scalartype *w,\
                                   int const id,\
                                   unsigned int const ping_lockid,\
                                   unsigned int const pong_lockid,\
                                   window_datatype  *restrict ping_buffer,\
                                   window_datatype *restrict pong_buffer, \
                                   bool const &isbufferHeadNotRequired = 0) {     \
    int lockid = id ? pong_lockid : ping_lockid;\
    if (isbufferHeadNotRequired)\
      release(lockid, REL_READ);        \
    else {\
      window_datatype *restrict h1 = (id ? pong_buffer : ping_buffer);\
      h1 = w->head;\
      release(lockid, REL_READ);                                  \
    }\
  }

ACQREL_OPS(int8)
ACQREL_OPS(uint8)
ACQREL_OPS(int16)
ACQREL_OPS(uint16)
ACQREL_OPS(int32)
ACQREL_OPS(uint32)
ACQREL_OPS(int64)
ACQREL_OPS(uint64)
ACQREL_OPS(cfloat)
ACQREL_OPS(float)

#ifndef __NOAIECMPLX__
ACQREL_OPS(cint16)
ACQREL_OPS(cint32)
#endif

#undef ACQREL_OPS

#endif  // ! __NEW_X86Sim__
 

#endif

#ifndef NOCPP

template<typename T> static inline input_window<T> * get_input_async_window(window_internal * wind) { input_window<T> * toReturn = (input_window<T> *)wind; return toReturn; }
template<typename T> static inline output_window<T> * get_output_async_window(window_internal * wind) { output_window<T> * toReturn = (output_window<T> *)wind; return toReturn; }

template<typename T> static inline input_window<T> * get_input_window(window_internal * wind) { input_window<T> * toReturn = (input_window<T> *)wind; toReturn->ptr = wind->head; return toReturn; }
template<typename T> static inline output_window<T> * get_output_window(window_internal * wind) { output_window<T> * toReturn = (output_window<T> *)wind; toReturn->ptr = wind->head; return toReturn; }

template<typename T> static inline void window_copy(input_window<T> *dst, input_window<T> *src) { dst->ptr = chess_copy(src->ptr); dst->head = chess_copy(src->head); dst->buffer = chess_copy(src->buffer); dst->size = chess_copy(src->size); dst->winsize = chess_copy(src->winsize); }
template<typename T> static inline void window_copy(output_window<T> *dst, output_window<T> *src) { dst->ptr = chess_copy(src->ptr); dst->head = chess_copy(src->head); dst->buffer = chess_copy(src->buffer); dst->size = chess_copy(src->size); dst->winsize = chess_copy(src->winsize); }

#ifdef __NEW_WINDOW_H__
template<typename T> static inline void window_init(window_internal *w, int const channels, T *buffer_ping, unsigned int lockid_ping, T *buffer_pong, unsigned int lockid_pong, int const size, int const winsize) { int s = (sizeof(T)) / sizeof(window_datatype); int const sz = (size * s); int const winsz = (winsize * s); window_init(w, channels, (window_datatype *)buffer_ping, lockid_ping, (window_datatype *)buffer_pong, lockid_pong, sz, winsz); }
template<typename T> static inline void window_init(window_internal *w, int const channels, T *buffer_ping, unsigned int lockid_ping, T *buffer_pong, unsigned int lockid_pong, int const size) { int const sz = (size * sizeof(T)) / sizeof(window_datatype); window_init(w, channels, buffer_ping, lockid_ping, buffer_pong, lockid_pong, sz, sz); }
template<typename T> static inline void window_init(window_internal *w, int const channels, T *buffer_ping, int const size, int const winsize) { int s = (sizeof(T)) / sizeof(window_datatype); int const sz = (size *s); int const winsz = (winsize * s); window_init(w, channels, (window_datatype *)buffer_ping, 0, (window_datatype *)buffer_ping, 0, sz, winsz); }
template<typename T> static inline void window_init(window_internal *w, int const channels, T *buffer_ping, int const size) { int const sz = (size * sizeof(T)) / sizeof(window_datatype); window_init(w, channels, (window_datatype *)buffer_ping, 0, (window_datatype *)buffer_ping, 0, sz, sz); }
#else
template<typename T> static inline void window_init(window_internal *w, int const channels, T *buffer, int const size, int const winsize) { int const sz = (size * sizeof(T)) / sizeof(window_datatype); int const winsz = (winsize * sizeof(T)) / sizeof(window_datatype); window_init(w, channels, (window_datatype *)buffer, sz, winsz); }
template<typename T> static inline void window_init(window_internal *w, int const channels, T *buffer, int const size) { window_init(w, channels, buffer, size, size); }
#endif

template<typename T> static inline void set_window_size(input_window<T> *w, int const size) { set_window_size((window_internal *)w, size*(sizeof(T) / sizeof(window_datatype))); }
template<typename T> static inline void set_window_size(output_window<T> *w, int const size) { set_window_size((window_internal *)w, size*(sizeof(T) / sizeof(window_datatype))); }
template<typename T> static inline unsigned window_size(input_window<T> *w) { return window_size((window_internal *)w) / (sizeof(T) / sizeof(window_datatype)); }
template<typename T> static inline unsigned window_size(output_window<T> *w) { return window_size((window_internal *)w) / (sizeof(T) / sizeof(window_datatype)); }

template<typename T> static inline void window_incr(window_internal * w, int count) { count *= sizeof(T) / sizeof(window_datatype); w->head = cyclic_add(w->head, count, w->buffer, w->size); }
template<typename T> static inline void window_decr(window_internal * w, int count) { window_incr<T>(w, -count); }

template<typename T> static inline void window_incr(input_window<T> * w, int count) { count *= sizeof(T) / sizeof(window_datatype); w->ptr = cyclic_add(w->ptr, count, w->buffer, w->size); }
template<typename T> static inline void window_incr(output_window<T> * w, int count) { count *= sizeof(T) / sizeof(window_datatype); w->ptr = cyclic_add(w->ptr, count, w->buffer, w->size); }
template<typename T> static inline void window_decr(input_window<T> * w, int count) { window_incr(w, -count); }
template<typename T> static inline void window_decr(output_window<T> * w, int count) { window_incr(w, -count); }

template<size_t N, typename T> static inline void window_incr_v(input_window<T> * w, int count) { count *= N * sizeof(T) / sizeof(window_datatype); w->ptr = cyclic_add(w->ptr, count, w->buffer, w->size); }
template<size_t N, typename T> static inline void window_incr_v(output_window<T> * w, int count) { count *= N * sizeof(T) / sizeof(window_datatype); w->ptr = cyclic_add(w->ptr, count, w->buffer, w->size); }
template<size_t N, typename T> static inline void window_decr_v(input_window<T> * w, int count) { window_incr_v<N>(w, -count); }
template<size_t N, typename T> static inline void window_decr_v(output_window<T> * w, int count) { window_incr_v<N>(w, -count); }

template<typename T> static inline void window_write(output_window<T> * w, T value) { *((T *)(w->ptr)) = value; }
template<typename T> static inline void window_writeincr(output_window<T> * w, T value) { *((T *)(w->ptr)) = value; window_incr(w, 1); }
template<typename T> static inline T window_read(input_window<T> *w) { return *((T *)(w->ptr)); }
template<typename T> static inline void window_read(input_window<T> *w, T & value) { value = *((T *)(w->ptr)); }
template<typename T> static inline void window_readincr(input_window<T> *w, T & value) { value = *((T *)(w->ptr)); window_incr(w, 1); }
template<typename T> static inline T window_readincr(input_window<T> *w) { T value; window_readincr(w, value); return value; }

//vector operations of window_write, window_writeincr, window_read, window_readincr are implemented using macro as overloaded functions.
//The templated vector operations do not work because the function signature overlapped with scalar operations.
//e.g., window_writeincr<output_window_<int16>*, int32> is not allowed for scalar operation but vector function signature, window_writeincr(output_window_<T> *w, vNT value), makes it allowed, which causes incorrect behavior.

#endif

#endif
