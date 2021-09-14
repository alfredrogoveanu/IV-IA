move((K,M),[N|Ns],[N|Ns1]):-K>1,K1 is K-1,move((K1,M),Ns,Ns1).

move((1,N),[N|Ns],Ns).
move((1,M),[N|Ns],[N1|Ns]):-M<N,N1 is N-M.

initialize(nim,[1,3,5,7],opponent).

display_game(Position,Player):-write(Position),nl,write(Player),nl.

play(Game,Result):-initialize(Game,Position,Player),
    display_game(Position,Player),play(Position,Player,Result).
play(Position,Player,Result):-game_over(Position,Player,Result),!,
    announce(Result).
play(Position,Player,Result):-choose_move(Position,Player,Move),
    move(Move,Position,Position1),display_game(Position1,Player),
    next_player(Player,Player1),!,play(Position1,Player1,Result).

choose_move(Position,opponent,Move):-write(['Please make move (pile,matches)']),
    nl,read(Move),legal(Move,Position).

choose_move(Ns,computer,Move):-unsafe(Ns,Sum),safe_move(Ns,Sum,Move).
choose_move(Ns,computer,(1,1)):-safe(Ns).

nim_sum([N|Ns],Bs,Sum):-binary(N,Ds),nim_add(Ds,Bs,Bs1),nim_sum(Ns,Bs1,Sum).

safe_move(Piles,NimSum,Move):-safe_move(Piles,NimSum,1,Move).
safe_move([Pile|Piles],NimSum,K,(K,M)):-binary(Pile,Bs),can_zero(Bs,NimSum,Ds,0),
    decimal(Ds,M).
safe_move([Pile|Piles],NimSum,K,Move):-K1 is K+1,safe_move(Piles,NimSum,K1,Move).

can_zero([],NimSum,[],0):-zero(NimSum).
can_zero([B|Bs],[0|NimSum],[C|Ds],C):-can_zero(Bs,NimSum,Ds,C).
can_zero([B|Bs],[1|NimSum],[D|Ds],C):-D is 1-B*C,C1 is 1-B,
    can_zero(Bs,NimSum,Ds,C1).

game_over(board(0,N,0,N),Player,draw):-pieces(K),N=:=6*K,!.
game_over(board(H,K,Y,L),Player,Player):-pieces(N),K>6*N, !.
game_over(board(H,K,Y,L),Player,Opponent):-pieces(K),L>6*N,
    next_player(Player,Oponent).

pieces(6).
next_player(computer,opponent).
next_player(opponent,computer).
announce(oponent):-writeln(['You won ! Congrats ']).
announce(computer):-writeln(['I won ']).
announce(draw):-writeln(['Draw ']).

legal((K,N),Position):-mmember(K,Position,M),N=<M.
mmember(N,[X|Xs],X).
mmember(N,[H|Xs],Y):-N>1,N1 is N-1,mmember(N1,Xs,Y).
%mmember(N,[X|Xs],Y):-N1,N1 is N-1,mmember2(N1,Xs,Y).
%mmember(N,[H|Hs],K):-N>1,!,N1 is N-1,mmember(N1,Hs,K).
%mmemeber(1,[H|Hs],H).

legal([N|Ns]):-0<N,N<7,legal(ns).
legal([]).
zero([0,0,0,0,0,0]).
zero([]).
zero([0|Zs]):-zero(Za).
binary(1,[1]).
binary(N,[D|Ds]):-N>1, D is N mod 2,N1 is N/2,binary(N1,Ds).
decimal(Ds,N):-decimal(Ds,0,1,N).
decimal([],N,T,N).
decimal([D|Ds],A,T,N):-A1 is A+D+T,T1 is T*2,decimal(Ds,A1,T1,N).












