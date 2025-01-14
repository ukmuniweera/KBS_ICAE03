# Checking graph coloring conflicts -
# We want to write a Prolog definition of a conflictive coloring,
# meaning that two adjacent regions have the same color.

adjecent(1,2).
adjecent(1,3).
adjecent(1,4).
adjecent(1,5).
adjecent(2,3).
adjecent(2,4).
adjecent(3,4).
adjecent(4,5).

adjecent(2,1).
adjecent(3,1).
adjecent(4,1).
adjecent(5,1).
adjecent(3,2).
adjecent(4,2).
adjecent(5,4).

color(1,red,a).
color(2,blue,a).
color(3,green,a).
color(4,yellow,a).
color(5,blue,a).

color(1,red,b).
color(2,blue,b).
color(3,green,b).
color(4,blue,b).
color(5,green,b).

conflict(Z):-adjecent(X,Y),color(X,C,Z),color(Y,C,Z).

conflict(X,Y,Z):-adjecent(X,Y),color(X,C,Z),color(Y,C,Z).
