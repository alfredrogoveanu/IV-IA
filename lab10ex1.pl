can(move(Block,From,To),[clear(Block),clear(To),on(Block,From)]):-block(Block),
    object(To),To\=Block,object(From),From\=To,Block\=From.
adds(move(X,From,To),[on(X,To),clear(From)]).
deletes(move(X,From,To),[on(X,From),clear(To)]).
object(X):-place(X);block(X).
block(a).
block(b).
block(c).
place(1).
place(2).
place(3).
place(4).

state1([clear(2),clear(4),clear(b),clear(c),on(a,1),on(b,3),on(c,a)]).
plan(State, Goals, [], State) :- satisfied(State,Goals).
plan(State, Goals, Plan, FinalState):-conc(PrePlan,[Action|PostPlan],Plan),
    selectb(State,Goals,Goal),achieves(Action,Goal),can(Action,Condition),
    plan(State,Condition,PrePlan,MidState1),apply(MidState1, Action, MidState2),
    plan(MidState2,Goals,PostPlan, FinalState).

satisfied(State,[]).
satisfied(State,[Goal|Goals]):-member(Goal,State),satisfied(State,Goals).

selectb(State,Goals,Goal):-member(Goal,Goals),not(member(Goal,State)).

achieves(Action,Goal) :-
adds(Action,Goals),
member(Goal,Goals).

apply(State,Action,NewState):-deletes(Action,DelList),delete_all(State,DelList,State1),!,adds(Action, AddList),conc(AddList, State1, NewState).

delete_all([],_,[]).
delete_all([X|L1],L2,Diff):-member(X,L2),!,delete_all(L1,L2,Diff).
delete_all([X|L1],L2,[X|Diff]):-delete_all(L1,L2,Diff).

conc([],Y,Y).
conc([A|X],Y,[A|Z]):-conc(X,Y,Z).


