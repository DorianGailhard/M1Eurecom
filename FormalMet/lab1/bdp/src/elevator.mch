/* elevator
 * Author: Dorian Gailhard
 * Creation date: 03/04/2022
 */
MACHINE
    elevator

SETS
    DOORSTATES = { closed , open }

CONCRETE_CONSTANTS
    /* Range of the possible floors */
    fmin ,
    fmax ,
    floors

PROPERTIES
    fmin : INT &
    fmax : INT &
    fmin < fmax &
    floors = ( fmin .. fmax )

ABSTRACT_VARIABLES
    currentFloor ,
    door ,
    req // Requested floors

INVARIANT
    currentFloor : floors &
    req <: floors &
    door : DOORSTATES

INITIALISATION
    currentFloor := fmin || //We start at the lowest floor
    req := {} || //No requests
    door := closed

OPERATIONS
    //Add a request for a given floor.
    request ( fl ) =
        PRE fl : floors
        THEN req := req \/ { fl } END ;

    //Move the elevator to a floor in req.
    move =
        PRE req /= {} &
            currentFloor /: req & //If the current floor is in req, we open the door
            door = closed
        THEN currentFloor :: req //The elevator goes to the first requested floor
        END ;

    // Open the door and remove the floor from req
    toggle =
        PRE currentFloor : req
        THEN
            IF door = closed
            THEN door := open
            ELSE
                req := req - { currentFloor } || //We remove the current floor from requested ones because it has been visited
                door := closed
            END
        END
END
