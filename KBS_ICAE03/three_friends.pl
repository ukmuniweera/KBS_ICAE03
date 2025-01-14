friends(S):-
    S=[p(_, _, _, 1),p(_, _, _, 2),p(_, _, _, 3)],
    member(p(bill, _, _, _),S),
    member(p(_, _, zurich, _),S),
    member(p(_, _, bern, RB),S),
    member(p(michael, doctor, _, RM),S),RM<RB,
    member(p(_, officer, _, RO),S),
    member(p(daniel, _, basel, RD),S),RD<RO,
    member(p(_, sport_teacher, _, 1),S).
    