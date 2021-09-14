move((K,M),[N|Ns],[N|Ns1]):-K>1,K1 is K-1,move((K1,M),Ns,Ns1).
move((1,N),[N|Ns],Ns).
move((1,M),[N|Ns],[N1|Ns]):-M<N,N1 is N-M.
initialize(nim,[1,3,5,7],opponent).
play(Game,Result):-initialize(Game,Position,Player),display_game(Position,Player),
    play(Position,Player,Result).
play(Position,Player,Result):-game_over(Position,Player,Result),!,announce(Result).
play(Position,Player,Result):-choose_move(Position,Player,Move),
    move(Move,Position,Position1),display_game(Position1,Player),
    next_player(Player,Player1),!,play(Position1,Player1,Result).
choose_move(Position,opponent,Move):-write(['Please make move (pile,matches)']),
    nl,read(Move),legal(Move,Position).
choose_move(Ns,computer,Move):-unsafe(Ns,Sum),safe_move(Ns,Sum,Move).
choose_move(Ns,computer,(1,1)):-safe(Ns).
nim_sum([N|Ns],Bs,Sum):-binary(N,Ds),nim_add(Ds,Bs,Bs1),nim_sum(Ns,Bs1,Sum).
safe_move(Piles,NimSum,Move) :-
safe_move(Piles,NimSum,1,Move).
safe_move([Pile|Piles],NimSum,K,(K,M)) :-
binary(Pile,Bs),
can_zero(Bs,NimSum,Ds,0),
decimal(Ds,M).
safe_move([Pile|Piles],NimSum,K,Move) :-
K1 is K+1,
safe_move(Piles,NimSum,K1,Move).
