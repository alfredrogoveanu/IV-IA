max(X,Y,X):-X>=Y.
max(X,Y,Y):-X<Y.
maxliste([X],X).
maxliste([X|R],Maxliste):-maxliste(R,Maxliste1),max(X,Maxliste1,Maxliste).
