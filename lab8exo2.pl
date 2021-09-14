initial(state(0,0)).
final(state(4,0)).
illegal(state(X,_)):-X>5.
illegal(state(_,Y)):-Y>8.
illegal(state(X,_)):-X<0.
illegal(state(_,Y)):-Y<0.
move(state(_,Y),state(X1,Y)):-X1 is 5.
move(state(X,_),state(X,Y1)):-Y1 is 8.
move(state(_,Y),state(X1,Y)):-X1 is 0.
move(state(X,_),state(X,Y1)):-Y1 is 0.
move(state(X,Y),state(X1,Y1)):-X1 is X-(8-Y),Y1 is 8.
move(state(X,Y),state(X1,Y1)):-X1 is 0,Y1 is X+Y.
move(state(X,Y),state(X1,Y1)):-Y1 is Y-(5-X),X1 is 5.
apa(State,[State|Visited],Visited):-final(State),!.
apa(State,Solution,Visited):-move(State,NextState),
    not(illegal(NextState)),not(member(NextState,[State|Visited])),
    apa(NextState,Solution,[State|Visited]).
solve(Solution):-initial(State),apa(State,Solution,[]).
display1([]):- nl.
display1([X|R]):-display1(R),nl,write(X).
go:-solve(L),display1(L),fail.

