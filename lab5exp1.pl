start:-write('Input the string ='),read(C),
    explode(C,L),no_vowels(L,R),
    write('The number of vowels is ='),write(R),nl,
    list_vowels(L,P),write('The list of voewls is ='),write(P).
explode(X,R):-name(X,L),cod_litera(L,R).
cod_litera([],[]).
cod_litera([H|T],[H1|T1]):-name(H1,[H]),cod_litera(T,T1).
vocala(I):-member(I,[a,e,i,o,u]).
no_vowels([],0).
no_vowels([X|L],N):-vocala(X),no_vowels(L,M),N is M+1,!.
no_vowels([X|L],N):-no_vowels(L,N).
list_vowels([],[]).
list_vowels([H|T],[H|R]):-vocala(H),list_vowels(T,R).
list_vowels([H|T],R):-list_vowels(T,R).
