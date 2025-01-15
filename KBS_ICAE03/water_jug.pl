% Initial and Goal States
init_state(state(0, 0)).
goal_state(state(2, _)).

% Valid moves
move(state(X, Y), fill_4, state(4, Y)) :- X < 4.
move(state(X, Y), fill_3, state(X, 3)) :- Y < 3.
move(state(X, Y), empty_4, state(0, Y)) :- X > 0.
move(state(X, Y), empty_3, state(X, 0)) :- Y > 0.
move(state(X, Y), pour_4_to_3, state(NewX, NewY)) :- X > 0, Y < 3, T is min(X, 3 - Y), NewX is X - T, NewY is Y + T.
move(state(X, Y), pour_3_to_4, state(NewX, NewY)) :- Y > 0, X < 4, T is min(Y, 4 - X), NewX is X + T, NewY is Y - T.

% Solve the water jug problem
solve :- init_state(S), solve_jug(S, [S], Sol), write('Solution:'), nl, print_solution(Sol).

% Recursive solution
solve_jug(S, _, []) :- goal_state(S).
solve_jug(S, V, [M | Ms]) :- move(S, M, NS), \+ member(NS, V), solve_jug(NS, [NS | V], Ms).

% Print solution
print_solution([]).
print_solution([M | R]) :- write(M), nl, print_solution(R).
