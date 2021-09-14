functie([],[],[]).
functie([H1|T1],[H2|T2],[H1|L]):-H1 = H2,functie(T1,T2,L).
functie([H1|T1],[H2|T2],L):-functie(T1,T2,L).

nou(L):-functie([p,e,r,u,c,a],L,L1),length(L1,2),
    functie([p,u,r,i,c,e],L,L2),length(L2,2),
    functie([m,u,t,a,r,e],L,L3),length(L3,2),
    functie([m,a,t,u,s,a],L,L4),length(L4,2),
    functie([m,e,d,u,z,a],L,L5),length(L5,2),
    functie([c,a,d,a,n,a],L,L6),length(L6,2),
    functie([r,e,c,u,r,s],L,L7),length(L7,2),fc2(L).

fc2([]).
fc2([X|L]):-not(member(X,L)),fc2(L).
