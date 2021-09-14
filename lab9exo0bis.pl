moveFamily(Name,Max,Moves,Time):-getList(Name,People),moveSouth(People,[],Moves,Time),Time=<Max.

getList(Name,List):-family(Name,List).

moveSouth(North,South,[X+Y|Moves],New):-member(X/T1,North),member(Y/T2,North),X\=Y,Big is max(T1,T2),
    select(X/T1,North,List2),select(Y/T2,List2,NewNorth),
    moveNorth(NewNorth,[X/T1,Y/T2|South],Moves,Time),New is Time+Big.
moveSouth([],_,[],0).

moveNorth(North,South,[X|Moves],New) :-
  member(X/T1,South), select(X/T1,South,NewSouth),
  moveSouth([X/T1|North],NewSouth,Moves,Time), New is Time + T1.
moveNorth([],_,[],0).

family(four, [unu/1,doi/2,trei/5,patru/10]).
