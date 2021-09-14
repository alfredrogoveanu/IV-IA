expression(A,E1):-split_string(A," ","",E),detect_implies(A,I1),I1=0,start(E,E1,I1,0),!.
expression(A,E1):-split_string(A," ","",E),detect_implies(A,I1),I1=1,start(E,E2,I1,0),start(E2,E1,0,0).
start([],[],_,_).
start([H|T],[X|L],0,0):-atom_string(H1,H),neg(H1,X,0),start(T,L,0,0),!.
start([H|T],[X|L],1,R):-R=0,atom_string(H1,H),neg(H1,X,R1),start(T,L,1,R1),!.
start([H|T],[H1|L],1,R):-atom_string(H1,H),start(T,L,1,R),R=1.
neg(X2,X4,P):-split_string(X2,"(",")",X3),get_head(X3,X4),get_head2(X3,X5),
    X2\=or,X2\=and,X2\=implies,sub_string(X2,B1,L1,A1,'not('),B1=0,!.
neg(X1,X2,P):-string_concat('not(',X1,X3),string_concat(X3,')',X2),
    X1\=or,X1\=and,X1\=implies.
neg(or,and,P).
neg(and,or,P).
neg(implies,or,P):-P is 1.
transform(and,or,0).
get_head([M|M1],M2):-get_head2(M1,M2).
get_head2([N|N1],N).
detect_implies(S,1):-atom_string(S1,S),sub_string(S1,B1,L1,A1,'implies'),B1>0,!.
detect_implies(S,0).
