maxelem(nil,0).
maxelem(t(nil,X,nil),X):-!.
maxelem(t(S,R,D),M):-maxelem(S,M1),maxelem(D,M2),comp(M1,M2,M).
comp(E,E1,E):-E>=E1.
comp(E,E1,E1):-E<E1.
%linearize(nil,[]).
%linearize(t(nil,X,nil),[X]):-!.
% linearize(t(S,R,D),[R|L]):-linearize(S,L1),linearize(D,L2),concat(L1,L2,L).
%

%concat([],L,L).
%concat([H|T],L,[H|L1]):-concat(T,L,L1).
