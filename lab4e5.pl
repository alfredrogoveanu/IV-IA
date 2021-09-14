sump([],0,[]).
sump([X|L],N,[X|List]):-N1 is N-X,sump(L,N1,List).
sump([H|T],N,List):-sump(T,N,List).
