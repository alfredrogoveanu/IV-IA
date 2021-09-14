%union([],[],L).
%union([X|R],Y,[X|L]):-not(member(X,R)),union(R,Y,L).
%union([],[Y|R],L):-member(Y,L),member(Y,R),union([],R,L).
%union([],[Y|R],[Y|L]):-not(member(Y,R)),union([],R,L).

%union([X|R],[],[X|L]):-not(member(X,L)),union(R,[],[X|L]).

union(X,[],X).
union(X,[Y|R],[Y|L]):-not(member(Y,X)),union(X,R,L).
union(X,[Y|R],L):-member(Y,X),union(X,R,L).
