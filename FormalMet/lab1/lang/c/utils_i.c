/* WARNING if type checker is not performed, translation could contain errors ! */

#include "utils.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void utils__INITIALISATION(void)
{
    
}

/* Clause OPERATIONS */

void utils__mini(int32_t xx, int32_t yy, int32_t *res)
{
    if((xx) >= (yy))
    {
        (*res) = yy;
    }
    else
    {
        (*res) = xx;
    }
}

void utils__maxi(int32_t xx, int32_t yy, int32_t zz, int32_t *res)
{
    if((xx) >= (yy))
    {
        (*res) = xx;
    }
    if((xx) <= (yy))
    {
        (*res) = yy;
    }
    if(((*res)) <= (zz))
    {
        (*res) = zz;
    }
}

