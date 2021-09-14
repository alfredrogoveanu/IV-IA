start:-write(' Input the formula (ex: [p, and, [not, q]]) = '),read(Formula),write(' Input the variables list '),read(Lvar),table(Formula, Lvar).

wellformed([]).
wellformed(Formula):-(verif_not(Formula);verif_and(Formula);verif_var(Formula)),Formula\=[].

verif_var([H|T]):-member(H,[p,q,r]),wellformed(T).

verif_not([H|T]):-H = 'not',wellformed(T).
verif_and([H|T]):-wellformed(H),get_and(T).
get_and([H|T]):-H = 'and',wellformed(T),T \= [].

verif_or([H|T]):-wellformed(H),get_or(T).
get_or([H|T]):-H = 'or',wellformed(T).

table(Formula,Lvar):-del('not',Formula,List1),
    del('and',List1,List2),del('or',List2,List3),check_var(Lvar,List3),
    wellformed(Formula).

check_var(L1,L2):-maplist(check(L2),L1).
check(L,X):-member(X,L).

del(E,L,L).
del(E,[E|T],T).
del(E,[H|T],[H|T2]):-delete(E,T,T2),true.







