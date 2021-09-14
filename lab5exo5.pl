rotation(L,_,0,L).
rotation([H|T],Direction,N,List1):-Direction=gauche,
    M is N-1,append(T,[H],List1).
aux(X,0,[X|_]).
aux([A|B],N,[A|L1]):-M is N-1,aux(B,M,L1).
