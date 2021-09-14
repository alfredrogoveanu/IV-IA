op_not(0,1).
op_not(1,0).
op_or(V1,V2,0):-Sum is V1 + V2,Sum=0,!.
op_or(V1,V2,1):-Sum is V1 + V2,Sum>0.
op_and(V1,V2,R):-V1 = V2,op_or(V1,V2,R),!.
op_and(V1,V2,R):-V1 \= V2,op_or(V1,V2,R1),op_not(R1,R).
op_xor(V1,V2,R):-op_not(V1,R1),op_not(V2,R2),
    op_and(V1,R2,R3),op_and(R1,V2,R4),op_or(R3,R4,R).
op_nor(V1,V2,R):-op_or(V1,V2,R1),op_not(R1,R).
op_nand(V1,V2,R):-op_and(V1,V2,R1),op_not(R1,R).
