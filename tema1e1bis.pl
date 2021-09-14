est_triple(A,B,C):-D is C*C - A*A - B*B, D=0.
pythagore(A,B,C):-member(A,[1,2,3,4,5,6,7,8,9,10]),member(B,[1,2,3,4,5,6,7,8,9,10]),
    member(C,[1,2,3,4,5,6,7,8,9,10]),est_triple(A,B,C).
