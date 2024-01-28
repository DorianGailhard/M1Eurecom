/* NatAsserts
 * Author: Dorian Gailhard
 * Creation date: 08/04/2022
 */
MACHINE NatAsserts2



ASSERTIONS
//Exercise 1
# xx . ( xx : NATURAL & ! yy . ( yy : INTEGER => xx <= yy ) )

&
//Exercise 2
! xx . ( xx : NATURAL => # yy . ( yy : NATURAL & xx < yy ) )

&
//Exercise 3
! ( nn , mm ) . ( ( nn : NATURAL & mm : NATURAL & nn /= mm ) => ( nn < mm or nn > mm ) )

&
//Exercise 4
! nn . ( nn : NATURAL => # kk . ( kk : NATURAL & ( nn = 2 * kk or nn = 2 * kk + 1 ) ) )

&
//Exercise 5
! nn . ( nn : NATURAL => ( ( # kk . ( kk : NATURAL & nn = kk * nn ) ) & ( # kk . ( kk : NATURAL & 0 = kk * nn ) ) ) )

&
//Exercise 6
# kk . ( kk : NATURAL & ! nn . ( nn : NATURAL => ( # kk . ( kk : NATURAL & nn = kk * kk ) ) ) )

&
//Exercise 7
! ( dd , nn ) . ( ( dd : NATURAL & nn : NATURAL & dd /= 0 ) => ( ( # kk . ( kk : NATURAL & nn = kk * dd ) ) <=> ( nn mod dd = 0 ) ) )

&
//Exercise 8
! nn . ( nn : NATURAL =>

( # kk . ( kk : NATURAL & nn = kk * nn ) ) &
! mm . ( mm : NATURAL => ( ( ( # kk . ( kk : NATURAL & mm = kk * nn ) ) & ( # kk . ( kk : NATURAL & nn = kk * mm ) ) => nn = mm )
& ( ! kk . ( kk : NATURAL & ( # kk . ( kk : NATURAL & kk = kk * mm ) ) & ( # kk . ( kk : NATURAL & mm = kk * nn ) ) => ( # kk . ( kk : NATURAL & kk = kk * nn ) ) ) ) ) ) )

&
//Exercise 9
//The meaning is that for a natural n, n mod 2 = 0 <=> 2 divides n
! nn . ( nn : NATURAL => ( ( nn mod 2 = 0 ) <=> ( ( # kk . ( kk : NATURAL & nn = kk * 2 ) ) ) ) )

END
