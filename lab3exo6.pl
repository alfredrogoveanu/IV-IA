drapel([X,Y,Z]):-member(X,[blanc,jaune,rouge,vert,bleu]),member(Y,[jaune,vert]),member(Z,[blanc,jaune,rouge,vert,bleu]),X\=Y,X\=Z,Y\=Z.
