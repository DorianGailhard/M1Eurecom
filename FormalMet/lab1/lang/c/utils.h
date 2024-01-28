#ifndef _utils_h
#define _utils_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */

/* Clause CONCRETE_VARIABLES */

extern void utils__INITIALISATION(void);

/* Clause OPERATIONS */

extern void utils__mini(int32_t xx, int32_t yy, int32_t *res);
extern void utils__maxi(int32_t xx, int32_t yy, int32_t zz, int32_t *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _utils_h */
