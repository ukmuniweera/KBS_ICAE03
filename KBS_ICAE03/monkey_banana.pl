% Legal moves
move(state(middle, onbox, middle, hasnot),
     grasp,
     state(middle, onbox, middle, has)).

move(state(P, onfloor, P, H),
     climb,
     state(P, onbox, P, H)).

move(state(P1, onfloor, P1, H),
     push(P1, P2),
     state(P2, onfloor, P2, H)).

move(state(P1, onfloor, B, H),
     walk(P1, P2),
     state(P2, onfloor, B, H)).

% canget(State): the monkey can get the banana in a given state
canget(state(_, _, _, has)) :-
    write('Monkey has the banana!'), nl.

canget(State1) :-
    move(State1, Move, State2),
    write('Performing move: '), write(Move), nl,
    canget(State2).

% Initial state
init_state(state(door, onfloor, window, hasnot)).

% Start solving the problem from the initial state
go :-
    init_state(State),
    canget(State).
