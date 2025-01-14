adjacent(1,2).
adjacent(1,3).
adjacent(1,5).
adjacent(1,6).
adjacent(2,3).
adjacent(2,4).
adjacent(2,5).
adjacent(2,6).
adjacent(3,4).
adjacent(3,6).
adjacent(5,6).

adjacent(2,1).
adjacent(3,1).
adjacent(5,1).
adjacent(6,1).
adjacent(3,2).
adjacent(4,2).
adjacent(5,2).
adjacent(6,2).
adjacent(4,3).
adjacent(6,3).
adjacent(6,5).

color(1,red,1).
color(2,blue,1).
color(3,green,1).
color(4,yellow,1).
color(5,yellow,1).
color(6,orange,1).

color(1,red,2).
color(2,brown,2).
color(3,blue,2).
color(4,black,2).
color(5,black,2).
color(6,red,2).

color_scheme(S):-
    adjacent(X,Y),color(X,C,S),color(Y,C,S)->
    write('Schema '),write(S),write(' not valid.');
    write('Schema '),write(S),write(' valid.').
    