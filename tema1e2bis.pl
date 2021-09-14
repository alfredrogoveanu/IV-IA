dernier([X],X).
dernier([_|L],X):-dernier(L,X).
diviser([X],[X],[]).
diviser([X|L],[X|L1],[Y|L2]):-dernier(L,Y),delete(L,Y,T),diviser(T,L1,L2).
