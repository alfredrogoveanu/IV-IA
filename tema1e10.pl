interval(D1,D2,L):-split_string(D1,"-","",E1),split_string(D2,"-","",E2),
    cast_number(E1,R2),cast_number(E2,R3),L is R3 - R2.
cast_number([H|T],X1):-atom_number(H,X),get_first(T,R1),month_day(R1,Y),X1 is X + Y.
get_first([H1|T1],H1).
month_day(A,0):-A = "janvier",!.
month_day(A,31):-A = "fevrier",!.
month_day(A,59):-A = "mars",!.
month_day(A,90):-A = "avril",!.
month_day(A,120):-A = "mais",!.
month_day(A,151):-A = "juin",!.
month_day(A,181):-A = "juillet",!.
month_day(A,212):-A = "aout",!.
month_day(A,243):-A = "septembre",!.
month_day(A,273):-A = "octobre",!.
month_day(A,304):-A = "novembre",!.
month_day(A,334):-A = "decembre".
