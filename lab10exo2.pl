combination(L,N,F):-length(F,N),evaluare(F,L).
evaluare([],_).
evaluare([H|T],L):-member(H,L),evaluare(T,L).
