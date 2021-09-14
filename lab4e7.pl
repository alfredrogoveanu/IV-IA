decomprime([],[]).
decomprime([[X,Y]|T],List):-decomp(X,Y,List1),decomprime(T,List2),append(List1,List2,List).
decomp(X,1,[X]).
decomp(X,Y,[X|L1]):-Y1 is Y-1,decomp(X,Y1,L1).
