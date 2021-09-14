linearize(nil,[]).
linearize(t(nil,X,nil),[X]):-!.
linearize(t(S,R,D),[R|L]):-linearize(S,L1),linearize(D,L2),concat(L1,L2,L).

concat([],L,L).
concat([H|T],L,[H|L1]):-concat(T,L,L1).
