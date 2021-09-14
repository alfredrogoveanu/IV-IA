split(_,[],[],[]).
split(N,[X|L1],[X|L2],L3):-X=<N,split(N,L1,L2,L3).
split(N,[X|L1],L2,[X|L3]):-X>N,split(N,L1,L2,L3).
