height(nil,0).
height(t(S,_,D),I):-height(S,I11),height(D,I12),I is max(I11,I12) + 1.
