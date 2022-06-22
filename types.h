// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
#ifndef __TYPES_H__
#define __TYPES_H__
#include <stdint.h>


// raw window for compiler / testbench manipulations
struct window_internal;

#define INT_TYPEDEF(type) \
  typedef type ## _t type ;

  INT_TYPEDEF(int8)
  INT_TYPEDEF(int16)
  INT_TYPEDEF(int32)

  INT_TYPEDEF(uint8)
  INT_TYPEDEF(uint16)
  INT_TYPEDEF(uint32)
  

#if !defined(_WIN32) && defined(__x86_64__)
  #if !defined(SYSTEMC_H)
    typedef long long int64;
    typedef unsigned long long uint64;
  #endif
#else
  INT_TYPEDEF(int64)
  INT_TYPEDEF(uint64)
#endif

#undef INT_TYPEDEF

//#ifndef __NOAIECMPLX__
//#include </proj/rdi/staff/jinmingz/nobkup/mlir-aie/test/unit_tests/chess_compiler_tests/complexint.h>
//#endif

#ifdef NOCPP

#define W_TYPES(direction,element_type)\
  struct direction ## _window_ ## element_type;

W_TYPES(input, int8)
W_TYPES(input, uint8)
W_TYPES(input, int16)
W_TYPES(input, uint16)
W_TYPES(input, int32)
W_TYPES(input, uint32)
W_TYPES(input, int64)
W_TYPES(input, uint64)
W_TYPES(input, float)

W_TYPES(output, int8)
W_TYPES(output, uint8)
W_TYPES(output, int16)
W_TYPES(output, uint16)
W_TYPES(output, int32)
W_TYPES(output, uint32)
W_TYPES(output, int64)
W_TYPES(output, uint64)
W_TYPES(output, float)

#ifndef __NOAIECMPLX__
W_TYPES(input, cint16)
W_TYPES(input, cint32)
W_TYPES(input, cfloat)

W_TYPES(output, cint16)
W_TYPES(output, cint32)
W_TYPES(output, cfloat)
#endif

#else //c++

template<typename T> struct input_window;
template<typename T> struct output_window;

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

#endif // NOCPP

#endif // __TYPES_H__
