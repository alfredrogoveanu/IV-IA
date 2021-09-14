subst([],[]).
subst(A,B):-select(X,A,A1),select(X,B,B1),subst(A1,B1).
