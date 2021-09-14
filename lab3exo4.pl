dupliquer_effacer([],[]).
dupliquer_effacer([Y|R],R1):-member(Y,R),dupliquer_effacer(R,R1).
dupliquer_effacer([Y|R],[Y|R1]):-not(member(Y,R)),dupliquer_effacer(R,R1).
