merge(Liste1,[],Liste1).
merge([],Liste2,Liste2).
merge([X|R],[Y|S],[Y|Liste]):-X>Y,merge([X|R],S,Liste).
merge([X|R],[Y|S],[X|Liste]):-X<Y,merge(R,[Y|S],Liste).
merge([X|R],[Y|S],[X|Liste]):-X=Y,merge(R,S,Liste).
