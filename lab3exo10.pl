chiffresenmots(1):-write(un),nl.
chiffresenmots(2):-write(deux),nl.
chiffresenmots(3):-write(trois),nl.
chiffresenmots(4):-write(quatre),nl.
chiffresenmots(5):-write(cinq),nl.
chiffresenmots(6):-write(six),nl.
chiffresenmots(7):-write(sept),nl.
chiffresenmots(8):-write(huit),nl.
chiffresenmots(9):-write(neuf),nl.
chiffresenmots(N):-integer(N),L is mod(N,10),K is div(N,10),chiffresenmots(K),chiffresenmots(L).

%chiffresenmots(mod(N,10)).

%;chiffresenmots(div(integer(N),10)).
