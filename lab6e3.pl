exercice3([Nom1,Nat1,Sport1],[Nom2,Nat2,Sport2],[Nom3,Nat3,Sport3]):-
    member(Nom1,[michael,simon,richards]),
    member(Nom2,[michael,simon,richards]),
    member(Nom3,[michael,simon,richards]),
    Nom1\=Nom2,Nom1\=Nom3,Nom2\=Nom3,
    member(Nat1,[australia,france,america]),
    member(Nat2,[australia,france,america]),
    member(Nat3,[australia,france,america]),
    Nat1\=Nat2,Nat1\=Nat3,Nat2\=Nat3,
    Sport1=cricket,
    member(Sport2,[basketball,tennis]),
    member(Sport3,[basketball,tennis]),
    Sport2\=Sport3,
    (check_sport(Nom2,Sport2);check_sport(Nom3,Sport3)),
    (check_country(Nom1,Nat1);check_country(Nom2,Nat2);check_country(Nom3,Nat3)),
    (check_ord1(Nom1,Nat2);check_ord1(Nom1,Nat3);check_ord1(Nom2,Nat3)),
    (check_ord2(Nom1,Sport2);check_ord2(Nom1,Sport3);check_ord2(Nom2,Sport3)).

check_sport(michael,basketball).
check_country(simon,france).
check_ord1(michael,america).
check_ord2(simon,tennis).
