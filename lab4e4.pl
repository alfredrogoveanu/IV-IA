%sousensembles(L1,N,List):-member(X,L1),member(Y,L1),X\=Y,X<Y,append([X],[Y],List).
sousensemble([X|_],1,[X]).
sousensemble([X|L],N,[X|List]):-N1 is N-1,sousensemble(L,N1,List).
sousensemble([H|T],N,List):-sousensemble(T,N,List).
