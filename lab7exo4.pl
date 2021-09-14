in(X,t(_,X,_),[X]).
in(X,t(Left,Root,Right),[]):-gt(Root,X),in(X,Left,[X|L]).
in(X,t(Left,Root,Right),[]):-gt(X,Root),in(X,Right,).
gt(X,Y):-X>Y.

%in(X,t(Left,Root,Right),[]):-gt(Root,X),in(X,Left).

path(X,nil,[]).
path(X,t(X,nil,nil),[X]).
path(X,t(RT,L,R),[RT|Path]):-path(X,L,Path);path(X,R,Path).
