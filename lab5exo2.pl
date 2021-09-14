parts([X|_],[X]).
parts([X|L],[X|List]):-parts(L,List).
parts([H|T],List):-parts(T,List).
