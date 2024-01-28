/* utils
 * Author: Dorian Gailhard
 * Creation date: 03/04/2022
 */
MACHINE
    utils
OPERATIONS
    res ← mini(xx,yy) =
    PRE xx ∈ NAT
    ∧ yy ∈ NAT
    THEN res := min({xx,yy})
    END ;
    res ← maxi(xx,yy,zz) =
        PRE xx ∈ NAT
        ∧ yy ∈ NAT
        ∧ zz ∈ NAT
        THEN res := max({xx,yy,zz})
        END
    END
