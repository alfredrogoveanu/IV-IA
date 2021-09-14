%on(Block,Object).
%clear(Object).
%etat1([clear(2),clear(4),clear(b),clear(c),on(a,1),on(b,3),on(c,a)]).
%move(X,Y,Z).

%Definition of action move(Block,From,To) in the blocks world

%can(Action,Condition): Action possible if Condition true
can(move(Block,From,To),[clear(Block),clear(To),on(Block,From)]):-
    block(Block), %Block to be moved
    object(To), %'To' is a block or a place
    To\=Block, %Block cannot be moved to itself
    object(From), %'From' is a block or a place
    From\=To, %Move to new position
    Block\=From. %Block not moved from itself

%adds(Action,Relationships): Action establishes Relationships
adds(move(X,From,To),[on(X,To),clear(From)]).

%deletes(Action,Relationships): Action destroys Relationships
deletes(move(X,From,To),[on(X,From),clear(To)]).

object(X):- %X is an object if
place(X) %X is a place
; %or
block(X). %X is a block
%A blocks world
block(a).
block(b).
block(c).
place(1).
place(2).
place(3).
place(4).
%A state in the blocks world
%
% c
% a b
% = = = =
%place 1 2 3 4
state1([clear(2),clear(4),clear(b),clear(c),on(a,1),on(b,3),on(c,a)]).

plan(State,Goals,[],State):-satisfied(State,Goals).
plan(State,Goals,Plan,FinalState):-append(PrePlan,[Action|PostPlan],Plan),
    selects(State,Goals,Goal),
    achieves(Action,Goal),
    can(Action,Condition),
    plan(State,Condition,PrePlan,MidState1),
    apply(MidState1,Action,MidState2),
    plan(MidState2,Goals,PostPlan,FinalState).


satisfied(State,[]).
satisfied(State,[Goal|RestOfGoals]):-member(Goal,State),
    satisfied(State,RestOfGoals).

selects(State,Goals,SubGoal):-member(SubGoal,Goals),
    not(member(SubGoal,State)).

achieves(Action,Goal):-adds(Action,AddList),
    member(Goal,AddList).

apply(State,Action,NewState):-deletes(Action,DeleteList),
    deletes2(State,DeleteList,State1),!,
    adds(Action,AddList),
    append(AddList,State1,NewState).

deletes2([],_,[]).
deletes2([X|L1],L2,Diff):-member(X,L2),!,
    deletes2(L1,L2,Diff).
deletes2([X|L1],L2,[X|Diff]):-deletes2(L1,L2,Diff).
