/* SetAsserts
 * Author: Dorian Gailhard
 * Creation date: 08/04/2022
 */
MACHINE
    SetAsserts
SETS
    UNIVERSE




ASSERTIONS
//Exercise 10
! SS . ( SS : FIN ( NATURAL ) => ( # TT . ( TT : FIN ( NATURAL ) & SS <<: TT ) ) )

&
//Exercise 11
! SS . ( SS : FIN ( NATURAL ) => ( # ( aa , bb ) . ( aa : NATURAL & bb : NATURAL & SS <: ( aa .. bb ) ) ) )

&
//Exercise 12
! nn . ( nn : NATURAL & nn /= 0 => { kk | kk : NATURAL & ( # kk . ( kk : NATURAL & nn = kk * kk ) ) } : FIN ( NATURAL ) )

&
//Exercise 13
! ( SS , TT ) . ( SS : FIN ( UNIVERSE ) & TT : FIN ( UNIVERSE ) & SS <: TT => card ( SS ) <= card ( TT ) )

&
//Exercise 14
! ( SS , TT ) . ( SS : FIN ( UNIVERSE ) & TT : FIN ( UNIVERSE ) => ( card ( SS ) <= card ( TT ) <=> # ff . ( ff : SS >-> TT ) ) )

&
/* Exercise 15 */
! ( SS , TT ) . ( SS : FIN ( UNIVERSE ) & TT : FIN ( UNIVERSE ) => ( card ( SS ) >= card ( TT ) <=> # ff . ( ff : SS -->> TT ) ) )

&
/* Exercise 16 */
! SS . ( SS : POW ( UNIVERSE ) =>

SS <: SS &
! TT . ( TT : POW ( UNIVERSE ) => ( ( SS <: TT & TT <: SS => SS = TT )
& ( ! UU . ( UU : POW ( UNIVERSE ) & TT <: UU & SS <: TT => SS <: UU ) ) ) ) )

&
/* Exercise 17 */
! ff . ( # SS . ( SS <: POW ( UNIVERSE ) & ff : SS +-> POW ( UNIVERSE ) & ! ( xx , yy ) . ( xx : SS & yy : SS & xx <: yy => ff ( xx ) <: ff ( yy ) ) ) => # xx . ( xx : POW ( UNIVERSE ) & ff ( xx ) = xx ) )

END
