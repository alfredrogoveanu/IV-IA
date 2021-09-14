initial(state(west,3,3,0,0)).
final(state(east,0,0,3,3)).
illegal(state(_,A,B,_,_)):-A<B,A>0.
illegal(state(_,_,_,C,D)):-C<D,C>0.
move(state(west,MV,CV,ME,CE),state(east,MV1,CV,ME1,CE)):-MV1 is MV-1,ME1 is ME+1,MV>0.
move(state(west,MV,CV,ME,CE),state(east,MV1,CV,ME1,CE)):-MV1 is MV-2,ME1 is ME+2,MV>1.
move(state(west,MV,CV,ME,CE),state(east,MV,CV1,ME,CE1)):-CV1 is CV-1,CE1 is CE+1,CV>0.
move(state(west,MV,CV,ME,CE),state(east,MV,CV1,ME,CE1)):-CV1 is CV-2,CE1 is CE+2,CV>1.
move(state(west,MV,CV,ME,CE),state(east,MV1,CV1,ME1,CE1)):-MV1 is MV-1,ME1 is ME+1,CV1 is CV-1,
    CE1 is CE+1,MV>0,CV>0.
move(state(east,MV,CV,ME,CE),state(west,MV1,CV,ME1,CE)):-MV1 is MV+1,ME1 is ME-1,ME>0.
move(state(east,MV,CV,ME,CE),state(west,MV1,CV,ME1,CE)):-MV1 is MV+2,ME1 is ME-2,ME>1.
move(state(east,MV,CV,ME,CE),state(west,MV,CV1,ME,CE1)):-CV1 is CV+1,CE1 is CE-1,CE>0.
move(state(east,MV,CV,ME,CE),state(west,MV,CV1,ME,CE1)):-CV1 is CV+2,CE1 is CE-2,CE>1.
move(state(east,MV,CV,ME,CE),state(west,MV1,CV1,ME1,CE1)):-MV1 is MV+1,ME1 is ME-1,CV1 is CV+1,
    CE1 is CE-1,ME>0,CE>0.
canibal(State,[State|Visited],Visited):-final(State).
canibal(State,Solution,Visited):-move(State,NextState),not(illegal(NextState)),
    not(member(NextState,[State|Visited])),canibal(NextState,Solution,[State|Visited]).
solve(Solution):-initial(State),canibal(State,Solution,[]).
display1([]):-nl.
display1([X|R]):-display1(R),nl,write(X).
go:-solve(L),display1(L),fail.

