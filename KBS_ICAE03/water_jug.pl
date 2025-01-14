% Initial State: Both jugs are empty
init_state(state(0, 0)).

% Goal State: 2 liters in the 4-liter jug
goal_state(state(2, _)).

% Valid moves between states
move(state(X, Y), fill_4, state(4, Y)) :- X < 4.
move(state(X, Y), fill_3, state(X, 3)) :- Y < 3.
move(state(X, Y), empty_4, state(0, Y)) :- X > 0.
move(state(X, Y), empty_3, state(X, 0)) :- Y > 0.
move(state(X, Y), pour_4_to_3, state(NewX, NewY)) :-
    X > 0, Y < 3,
    Transfer is min(X, 3 - Y),
    NewX is X - Transfer,
    NewY is Y + Transfer.
move(state(X, Y), pour_3_to_4, state(NewX, NewY)) :-
    Y > 0, X < 4,
    Transfer is min(Y, 4 - X),
    NewX is X + Transfer,
    NewY is Y - Transfer.

% Solve the water jug problem
solve :-
    init_state(Start),
    solve_jug(Start, [Start], Solution),
    write('Solution: '), nl,
    print_solution(Solution).

% Recursive function to solve the problem
solve_jug(State, _, []) :- goal_state(State).
solve_jug(State, Visited, [Move | Moves]) :-
    move(State, Move, NewState),
    \+ member(NewState, Visited),
    solve_jug(NewState, [NewState | Visited], Moves).

% Print the solution
print_solution([]).
print_solution([Move | Rest]) :-
    write(Move), nl,
    print_solution(Rest).
