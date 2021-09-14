diviser(L,A,B):-append(A,B,L),length(A,N),length(B,N).
diviser(L,A,B):-append(A,B,L),length(B,N),N1 is N+1,length(A,N1).
diviser(L,A,B):-append(A,B,L),length(B,N),N1 is N-1,length(A,N1).
