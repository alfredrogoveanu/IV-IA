analyse([],_).
analyse(LExp,PF):-atomic_list_concat(LExp,Exp),
    atom_to_term(Exp,Term,_),
    parse1(Term,PF).
parse1(Term,PF):-Term=..[PF].
parse1(Term,[Op,Left,Right]):-Term=..[Op,TLeft,TRight],
    parse1(TLeft,Left),
    parse1(TRight,Right).
evpf([*,A,B],Res):-evpf(A,Res1),evpf(B,Res2),Res is Res1*Res2.
evpf([/,A,B],Res):-evpf(A,Res1),evpf(B,Res2),Res is Res1/Res2.
evpf([+,A,B],Res):-evpf(A,Res1),evpf(B,Res2),Res is Res1+Res2.
evpf([-,A,B],Res):-evpf(A,Res1),evpf(B,Res2),Res is Res1-Res2.
evpf(N,N):-number(N).
evaluation(L,Res):-analyse(L,RL),evpf(RL,Res),!.
