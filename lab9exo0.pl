:-use_module(library(lists)).

find_solution:-initial_state(Initial),goal_state(Goal),
    write('== Starting Search =='),nl,solution([[Initial]],Goal,StateList),
    length(StateList,Len),Transitions is Len -1,
    format('~n** FOUND SOLUTION of length ~p **',[Transitions]),nl,
    showlist(StateList).

solution(StateLists,Goal,StateList):-member(StateList,StateLists),
    last(StateList,Last),equivalent_states(Last,Goal),
    report_progress(StateLists,final).

solution(StateLists,Goal,StateList):-report_progress(StateLists,ongoing),
    extend(StateLists,Extensions),solution(Extensions,Goal,StateList).

extend(StateLists,ExtendedStateLists):-
    setof(ExtendedStateList,StateList^Last^Next^(member(StateList,StateLists),
                                                 last(StateList,Last),
                                                 transition(Last,Next),
                                                 legal_state(Next),
                                                 no_loop_or_loopcheck_off(Next,
                                                                          StateLists),
                                                 append(StateList,[Next],ExtendedStateList)),
          ExtendedStateLists).

no_loop_or_loopcheck_off(_,_):-loopcheck(off),!.
no_loop_or_loopcheck_off(Next,StateLists):- \+(already_reached(Next,StateLists)).
%% Check whether State (or some equivalent state) has already been
%% reached in any state list in StateLists.
already_reached(State,StateLists):-member(StateList,StateLists),member(State1,StateList),
    equivalent_states(State,State1).

showlist([]).

showlist([H|T]):-write(H),nl,showlist(T).

report_progress(StateLists,Status):-length(StateLists,NS),member(L,StateLists),length(L,N),
    Nminus1 is N-1,write('Found '),write(NS),write(' states reachable in path length '),write(Nminus1),nl,
    (Status=ongoing->(write('Computing extensions of length : '),write(N),nl);true).

loopcheck(off).
initial_state(1).
goal_state(9).
equivalent_states(X,X). % States are equivalent only if identical.
transition(X,Y):-Y is 2*X. % Doubling the number is a possible transition.
transition(X,Y):-Y is X-1. % Subtracting one is a possible transition.
legal_state(_). % Any state is legal.















