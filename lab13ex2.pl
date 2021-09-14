elimnot(X,X):-atom(X).
elimnot([not,[not,X]],X):-atom(X).
elimnot([not,[not,X]],Y):-elimnot(X,Y).

%elimnot([not,[not,X]],L):-elimnot(X,L).
elimnot([not,[X,and,Y]],[L,or,R]):-elimnot([not,X],L),elimnot([not,Y],R),!.
elimnot([not,[X,or,Y]],[L,and,R]):-elimnot([not,X],L),elimnot([not,Y],R),!.
elimnot([not,X],[not,Y]):-elimnot(X,Y).
elimnot([X,O,Y],[X1,O,Y1]):-elimnot(X,X1),elimnot(Y,Y1).
