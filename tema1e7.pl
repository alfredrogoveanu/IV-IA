process(L,LT,RT):-split(L,LL,RL),term(LL,LT),term(RL,RT),LT=:=RT.
term([X],X).
term(L,T):-split(L,LL,RL),term(LL,LT),term(RL,RT),binterm(LT,RT,T).
binterm(LT,RT,LT+RT).
binterm(LT,RT,LT-RT).
binterm(LT,RT,LT*RT).
binterm(LT,RT,LT/RT):-RT=\=0.
split(L,L1,L2):-append(L1,L2,L),L1=[_|_],L2=[_|_].
equation(L):-process(L,LT,RT),writef('%w=%w\n',[LT,RT]),fail.
equation(_).
