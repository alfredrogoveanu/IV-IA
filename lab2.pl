longeurpaire([]).
longeurimpaire([X]).
longeurpaire([X|R]):-longeurimpaire(R).
longeurimpaire([X|R]):-longeurpaire(R).
