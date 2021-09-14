%Finding an item X in a binary search tree
%in(X,Tree): X in binary search tree Tree
in(X,t(_,X,_)).
in(X,t(Left,Root,Right)):-gt(Root,X), %Root greater than X
 in(X,Left). %Search left sub tree
in(X,t(Left,Root,Right)):-
    gt(X,Root), %X greater than Root
    in(X,Right). %Search right sub tree
gt(X,Y):-X>Y.
