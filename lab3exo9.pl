difference([],Y,[]).
difference([X|R],Y,[X|L]):-not(member(X,Y)),difference(R,Y,L).
difference([X|R],Y,L):-member(X,Y),difference(R,Y,L).
