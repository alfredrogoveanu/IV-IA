%[State,Predecessor,G,H,F].

%Queue Abstract Data Type
%emptyq(+Q) - tests if the queue is empty
%emptyq(-Q) – initializes the queue

emptyq([]). % enqueue(+El, +Q, -QNew) adds an element in the queue

enqueue(El,[],[El]).
enqueue(El,[X|Rest],[X|R1]):-enqueue(El,Rest,R1).

%dequeue(-El, +Q, -QNew) deletes an element from the queue

dequeue(El,[El|R],R).

%Priority Queue (the queue is sorted ascendingly with
%respect to the key F1)

inspq(El,[],[El]).
inspq(El,[X|Rest],[El,X|Rest]):- precedes(El,X),!.
inspq(El,[X|Rest],[X|R1]):-inspq(El,Rest,R1).

precedes([_,_,_,_,F1],[_,_,_,_,F2]):-F1<F2.

rezastar(Si,Goal):-emptyq(Open),emptyq(Closed),
    heuristic(Si,Goal,H),inspq([Si,nil,0,H,H],Open,Open1),
    astar(Open1,Closed,Goal).

astar(Open,_,_):-emptyq(Open),!,write('No solution'),nl.
astar(Open,Closed,Goal):-dequeue([S,Pred,_,_,_],Open,_),
    S=Goal,
    write('Solution found'),nl,
    writepath([S,Pred,_,_,_],Closed).
astar(Open,Closed,Goal):-dequeue([S,Pred,G,H,F],Open,RestOpen),
    inspq([S,Pred,G,H,F],Closed,Closed1),
    (bagof([Next,H1],(successor(S,Next),
                        heuristic(Next,Goal,H1)),LSucc),
     !,G1 is G+1,update_all(S, G1, LSucc, RestOpen, Closed1, OpenR, ClosedR);
    OpenR=RestOpen, ClosedR=Closed1),
    astar(OpenR, ClosedR, Goal).

%heuristic(Si,Goal,Goal).
%heuristic([Sh|St],Goal,H):-.

heuristic(st(east,MX,CX,_,_),Sfin,H):-final(Sfin),Ne is MX+CX,
    (Ne\=0,!,H is Ne-1;H=0).
heuristic(st(west,_,_,MY,CY),Sfin,H):-final(Sfin),Ne is MY+CY,
    (Ne\=0,!,H is Ne+1;H=0).

update_all(_,_,[],Open,Closed,Open,Closed):-!.
update_all(State,G,[[S,H]|Rest],Open,Closed,OpenR,ClosedR):-
    update(State,G,[S,H],Open,Closed,Open1,Closed1),
    update_all(State,G,Rest,Open1,Closed1,OpenR,ClosedR).

update(State,G,[S,H],Open,Closed,OpenR,Closed):-
    member([S,Pred,G1,_,_],Open),!,
    (G1=<G,OpenR=Open,!;F is G+H,elim([S,Pred,G1,_,_],Open,Open1),
     inspq([S,State,G,H,F],Open1,OpenR)).
update(State,G,[S,H],Open,Closed,OpenR,ClosedR):-
    member([S,Pred,G1,_,_],Closed),!,
    (G1=<G,ClosedR=Closed,OpenR=Open,!;F is G+H,
     elim([S,Pred,G1,_,_],Closed,ClosedR),
     inspq([S,State,G,H,F],Open,OpenR)).
update(State,G,[S,H],Open,Closed,OpenR,Closed):-F is G+H,
    inspq([S,State,G,H,F],Open,OpenR).

writepath([S,nil,_,_,_],_):-show(S),nl.
writepath([S,Pred,_,_,_],Closed) :-member([Pred,P,_,_,_],Closed),
    writepath([Pred,P,_,_,_],Closed),show(S),nl.

show(S):-write(S).

elim(_,[],[]).
elim(X,[X|Rest],Rest):-!.
elim(X,[Y|Rest],[Y|Rest1]):-elim(X,Rest,Rest1).

% Initial State
initial(st(east,3,3,0,0)).

% Final State
final(st(west,3,3,0,0)).

% Opposite Sides
opposite(east,west).
opposite(west,east).

% safe(+NoMissionaries, +NoCannibals) – safe state
safe(0,_).
safe(X,Y):-X>0,X>=Y.

% Transitions between states, succ(+CurrentState, -NextState)
% move two missionaries
successor(st(X,MX,CX,MY,CY),st(Y,MY1,CY,MX1,CX)):-opposite(X,Y),
    modify(2,MX,MY,MX1,MY1),
    safe(MX1,CX),safe(MY1,CY).

% move two cannibals
successor(st(X,MX,CX,MY,CY),st(Y,MY,CY1,MX,CX1)):-opposite(X,Y),
    modify(2,CX,CY,CX1,CY1),safe(MX,CX1),safe(MY,CY1).

% move one missioner and one cannibal
successor(st(X,MX,CX,MY,CY),st(Y,MY1,CY1,MX1,CX1)):-opposite(X,Y),
    modify(1,MX,MY,MX1,MY1),modify(1,CX,CY,CX1,CY1),
    safe(MX1,CX1),safe(MY1,CY1).

% move one missioner
successor(st(X,MX,CX,MY,CY),st(Y,MY1,CY,MX1,CX)):-opposite(X,Y),
    modify(1,MX,MY,MX1,MY1),safe(MX1,CX),safe(MY1,CY).

% move one cannibal
successor(st(X,MX,CX,MY,CY),st(Y,MY,CY1,MX,CX1)):-opposite(X,Y),
    modify(1,CX,CY,CX1,CY1),safe(MX,CX1),safe(MY,CY1).

% modify(+HowMany, +NoInit1, +NoInit2, -NoRes1, -NoRes2)
modify(N,NX,NY,NX1,NY1):-NX>=N,NX1 is NX-N,NY1 is NY+N.

solution:-nl,initial(Si),final(Sfin),rezastar(Si,Sfin).




