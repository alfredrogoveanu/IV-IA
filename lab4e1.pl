rev([],[]).
rev([X|R],L):-rev(R,L2),append(L2,[X],L).
%rev([],[]).
%rev([X|R],[L|X]):-rev(R,L).
