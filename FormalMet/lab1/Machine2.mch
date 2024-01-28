/* Machine2
 * Author: Dorian Gailhard
 * Creation date: 03/04/2022
 */
MACHINE
    Machine2
VARIABLES
    few, many
INVARIANT
    few ⊆ NATURAL ∧
    many ⊆ NATURAL ∧
    few ⊆ many
INITIALISATION
    few,many := {2,3},{2,3,4}
END
