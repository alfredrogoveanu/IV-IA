%elimimplic(X,X):-atom(X).
elimimplic([X|T],[X|T]).
elimimplic([X,->,Y],[[not,X],or,Y2]):-elimimplic([Y],Y2),!.
elimimplic([X,O,Y],[X2,O,Y2]):-elimimplic(X,X2),elimimplic(Y,Y2).


elimnot(X,X):-atom(X).
elimnot([not,[not,X]],L):-elimnot(X,L),!.
elimnot([not,[X,and,Y]],[[not,L],or,[not,R]]):-elimnot(X,L),elimnot(Y,R).
elimnot([not,[X,or,Y]],[[not,L],and,[not,R]]):-elimnot(X,L),elimnot(Y,R).
