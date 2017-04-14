#ifndef _GLOBAL
#define _GLOBAL

/* Compile flags. */
#define WIN32_LEAN_AND_MEAN         /* Ignore large portion of Windows-specific headers. */
#define _CRT_SECURE_NO_WARNINGS
#define _CRT_NONSTDC_NO_DEPRECATE

#include <wtypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#ifndef bool
#define bool BOOL
#endif

#ifndef inline
#define inline _inline
#endif

#define SYS_OK          0
#define SYS_ERROR       1

#define MAX_LINE_LEN    1024

#endif /* _GLOBAL */
