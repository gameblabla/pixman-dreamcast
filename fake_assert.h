#ifndef __ASSERT__
#define __ASSERT__

#ifndef NDEBUG
#include <assert.h>
#define REAL_assert(a) assert(a)
#else
#define REAL_assert(a) do {} while(0)
#endif

#endif