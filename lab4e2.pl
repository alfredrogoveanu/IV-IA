substitution(X,Y,[],[]).
substitution(X,Y,[H|R],[Y|R1]):-X=H,substitution(X,Y,R,R1).
substitution(X,Y,[H|R],[H|R1]):-X\=H,substitution(X,Y,R,R1).
