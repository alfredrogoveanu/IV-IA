selsort([],[]).
selsort([X],[X]).
selsort([X,Y|L],[Z|T]):-minimale([X,Y|L],Z),extraire(Z,[X,Y|L],S),selsort(S,T).
minimale([X],X).
minimale([X,Y|L],X):-minimale([Y|L],M),X=<M.
minimale([X,Y|L],M):-minimale([Y|L],M),X>M.
extraire(X,[],[]).
extraire(X,[X|L],L).
extraire(X,[U|L],[U|M]):-X\==U,extraire(X,L,M).
