insertion(X,[],[X]).
insertion(X,[X1|L1],[X,X1|L1]):-X=<X1.
insertion(X,[X1|L1],[X1|L]):-insertion(X,L1,L).
sorttri([],[]).
sorttri([X|L],S):-sorttri(L,S1),insertion(X,S1,S).
