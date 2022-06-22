// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
#ifndef __REDEFINE_H__
#define __REDEFINE_H__

// Redefine registration macros to no-op in __AIENGINE__
#ifdef __AIENGINE__
#define REGISTER_PARAMETER(var)
#define REGISTER_FUNCTION(func)
#endif

#endif


