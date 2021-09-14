comprime(C,L):-comprime(C,L,N is 0,E is a).
comprime([H|T],L,N,E):-H=E,N is N+1,comprime(T,L,N,E).
comprime([H|T],L,N,E):-H\=E,append([E,N],L,List1),N is 1,E is H,comprime(T,List1,N,E).
