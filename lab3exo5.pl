sub([],_).
sub([X|R],[Y|L]):-member(X,[Y|L]),sub(R,L).
