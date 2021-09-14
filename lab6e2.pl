exercice2([Om1,Anm1,Cig1],[Om2,Anm2,Cig2],[Om3,Anm3,Cig3]):-
   Om1=anglais,
   member(Anm1,[chien,chat,lapin]),
   member(Anm2,[chien,chat,lapin]),
   member(Anm3,[chien,lapin]),
   Anm1\=Anm2,Anm2\=Anm3,Anm1\=Anm3,
   member(Om2,[espagnol,russe]),
   member(Om3,[espagnol,russe]),
   member(Cig1,[kent,lm,marlboro]),
   member(Cig2,[kent,lm,marlboro]),
   member(Cig3,[kent,lm,marlboro]),
   Om2\=Om3,
   Cig1\=Cig2,Cig1\=Cig3,Cig2\=Cig3,
   (check_animal(Om2,Anm2) ; check_animal(Om3,Anm3)),
   (check_cigar(Om1,Cig1) ; check_cigar(Om2,Cig2) ; check_cigar(Om3,Cig3)),
   (check_right(Anm1,Cig2) ; check_right(Anm2,Cig3) ; check_right(Anm1,Cig3)).

check_animal(russe,lapin).
check_cigar(espagnol,kent).
check_right(chat,marlboro).
