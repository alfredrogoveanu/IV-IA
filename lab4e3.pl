cartesian(L1,L2,List):-member(X,L1),member(Y,L2),X\=Y,append([X],[Y],List).
