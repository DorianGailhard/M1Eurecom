/* MyExample
 * Author: Dorian Gailhard
 * Creation date: 03/04/2022
 */
MACHINE
    MyExample
ABSTRACT_VARIABLES
    ss
INVARIANT
    ss <: NATURAL
INITIALISATION
    ss := {}
OPERATIONS
    lire ( nn ) =
    PRE nn : NATURAL
    THEN ss := ss \/ { nn } END ;

    mm <-- maximum =
    PRE ss /= {}
    THEN mm := max ( ss ) END
END
