intersection([],Y,[]).
intersection([X|R],Y,[X|L]):-member(X,Y),intersection(R,Y,L).
intersection([X|R],Y,L):-not(member(X,Y)),intersection(R,Y,L).
