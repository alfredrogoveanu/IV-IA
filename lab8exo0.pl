move(state(Farmer,Farmer,Goat,Cabbage),state(Farmer1,Farmer1,Goat,Cabbage)):-opposite(Farmer,Farmer1).
move(state(Farmer,Wolf,Farmer,Cabbage),state(Farmer1,Wolf,Farmer1,Cabbage)):-opposite(Farmer,Farmer1).
move(state(Farmer,Wolf,Goat,Farmer),state(Farmer1,Wolf,Goat,Farmer1)):-opposite(Farmer,Farmer1).
move(state(Farmer,Wolf,Goat,Cabbage),state(Farmer1,Wolf,Goat,Cabbage)):-opposite(Farmer,Farmer1).
opposite(left,right).
opposite(right,left).
initial(state(left,left,left,left)).
final(state(right,right,right,right)).
illegal(state(Farmer, Wolf, Wolf, _)):-opposite(Farmer, Wolf).
illegal(state(Farmer, _,Goat,Goat)):-opposite(Farmer, Goat).
farmer(State,[State|Visited],Visited):-final(State).
farmer(State,Solution,Visited):-move(State,NextState),not(illegal(NextState)),
 not(member(NextState,[State|Visited])),farmer(NextState,Solution,[State|Visited]).
solve(Solution):-initial(State),farmer(State,Solution,[]).
display1([]):-nl.
display1([X|R]):-display1(R),nl,write(X).
go:-solve(L),display1(L),fail.
