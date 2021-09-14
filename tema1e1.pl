go:-repeat,read_and_check(N,Type),write(N),write(' is '),write(Type),nl,N=:=100.
read_and_check(N,T):-write('Enter next number: '),read(N),check(N,T).
check(N,even):-R is N mod 2,R=0.
check(N,odd):-R is N mod 2,R=1.
