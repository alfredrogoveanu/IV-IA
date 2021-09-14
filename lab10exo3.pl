substitute_everything(_,_,[],[]).
substitute_everything(New,Old,[Old|T],[New|T2]):-substitute_everything(New,Old,T,T2).
substitute_everything(New,Old,[H|T],[H|T2]):-dif(H,Old),substitute_everything(New,Old,T,T2).
