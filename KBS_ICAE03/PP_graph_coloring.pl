% Defining adjacent regions
adjacent(1, 2).
adjacent(1, 3).
adjacent(1, 4).
adjacent(1, 5).
adjacent(1, 6).
adjacent(2, 4).
adjacent(3, 4).
adjacent(4, 5).
adjacent(5, 6).

% Check if two adjacent regions have different colors
valid_scheme(Scheme) :-
    adjacent(Region1, Region2),
    member((Region1, Color1), Scheme),
    member((Region2, Color2), Scheme),
    Color1 \= Color2.

% Defining Scheme 1
scheme1([
    (1, red),
    (2, blue),
    (3, green),
    (4, yellow),
    (5, yellow),
    (6, orange)
]).

% Defining Scheme 2
scheme2([
    (1, red),
    (2, brown),
    (3, blue),
    (4, black),
    (5, black),
    (6, red)
]).

% Check both schemes
check_schemes :-
    scheme1(S1),
    (valid_scheme(S1) -> writeln('Scheme 1 is valid.'); writeln('Scheme 1 is invalid.')),
    scheme2(S2),
    (valid_scheme(S2) -> writeln('Scheme 2 is valid.'); writeln('Scheme 2 is invalid.')).
