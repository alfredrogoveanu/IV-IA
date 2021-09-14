diviser([],[],[]).
diviser([X],[X],[]).
diviser([X,Y|R],[X|Listeven],[Y|Listodd]):-diviser(R,Listeven,Listodd).
