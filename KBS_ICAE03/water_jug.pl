% Initial and goal states
init_state(state(0, 0)).
goal_state(state(2, 0)).

% Rules for filling, emptying, and transferring water
move(state(X, Y), action('Fill the 4-liter jug'), state(4, Y)) :- X < 4.
move(state(X, Y), action('Fill the 3-liter jug'), state(X, 3)) :- Y < 3.
move(state(X, Y), action('Empty the 4-liter jug'), state(0, Y)) :- X > 0.
move(state(X, Y), action('Empty the 3-liter jug'), state(X, 0)) :- Y > 0.
move(state(X, Y), action('Pour from 3-liter to 4-liter until full'), state(4, NewY)) :- X + Y >= 4, Y > 0, NewY is Y - (4 - X).
move(state(X, Y), action('Pour from 4-liter to 3-liter until full'), state(NewX, 3)) :- X + Y >= 3, X > 0, NewX is X - (3 - Y).
move(state(X, Y), action('Pour all from 3-liter to 4-liter'), state(NewX, 0)) :- X + Y =< 4, Y > 0, NewX is X + Y.
move(state(X, Y), action('Pour all from 4-liter to 3-liter'), state(0, NewY)) :- X + Y =< 3, X > 0, NewY is X + Y.

% Recursive function to solve the problem
solve(State, Goal, _, []) :- State = Goal, write('Goal reached!'), nl.
solve(State, Goal, Visited, [Action | Actions]) :-
    move(State, Action, NewState),
    \+ member(NewState, Visited),
    solve(NewState, Goal, [NewState | Visited], Actions).

% Start solving the problem
start :-
    init_state(Start),
    goal_state(Goal),
    solve(Start, Goal, [Start], Actions),
    write('Actions to achieve the goal:'), nl,
    write_actions(Actions).

% Helper function to write actions
write_actions([]).
write_actions([H | T]) :-
    write(H), nl,
    write_actions(T).
