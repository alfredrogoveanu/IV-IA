effacer(X,[],[]).
effacer(X,[Y|R],R1):-X=Y,effacer(X,R,R1).
effacer(X,[Y|R],[Y|R1]):-Y\=X,effacer(X,R,R1).
