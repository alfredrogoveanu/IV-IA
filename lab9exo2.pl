initial([n,n,n,v,b,b,b]).
final([b,b,b,v,n,n,n]).

move(P1,P2):-append(A,[n,v|B],P1),append(A,[v,n|B],P2).
move(P1,P2):-append(A,[v,b|B],P1),append(A,[b,v|B],P2).
move(P1,P2):-append(A,[v,n,b|B],P1),append(A,[b,n,v|B],P2).
move(P1,P2):-append(A,[n,b,v|B],P1),append(A,[v,b,n|B],P2).

solve(P,Prev,R):-final(P)->reverse([P|Prev],R);move(P,Q),solve(Q,[P|Prev],R).
go:-initial(P),solve(P,[],R),writeln(R),fail.
