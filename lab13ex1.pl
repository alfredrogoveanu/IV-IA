elimimplic(X,X):-atom(X).
elimimplic([not,X],[not,Y]):-elimimplic(X,Y).
elimimplic([X,->,Y],[[not,X1],or,Y1]):-elimimplic(X,X1),elimimplic(Y,Y1),!.
elimimplic([X,O,Y],[X1,O,Y1]):-elimimplic(X,X1),elimimplic(Y,Y1).
