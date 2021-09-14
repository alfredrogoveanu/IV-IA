append([or],L4,R2), append(R1,R2,R).
expr(L,R):-divide(L,1,L1,L2),p(L1,X,Y),atom(X),
     append([not],L1,R1),divide(L2,1,L3,L4),append([or],L4,R2),append(R1,R2,R).
divide(L,N,L1,L2):- append(L1, L2, L),length(L1, N),p([H|T],H,T).
