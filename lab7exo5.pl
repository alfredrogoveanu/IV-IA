addLeaf(nil,X,t(nil,X,nil)).
addLeaf(t(Left,X,Right),X,t(Left,X,Right)).
addLeaf(t(Left,Root,Right),X,t(Left1,Root,Right)):-gt(Root,X),addLeaf(Left,X,Left1).
addLeaf(t(Left,Root,Right),X,t(Left,Root,Right1)):-gt(X,Root),
    addLeaf(Right,X,Right1).
gt(Element1,Element2):-Element1 @> Element2.
