separer([],[],[]).
separer([X|R],[X|Listpos],Listneg):-X>=0,separer(R,Listpos,Listneg).
separer([X|R],Listpos,[X|Listneg]):-X<0,separer(R,Listpos,Listneg).
