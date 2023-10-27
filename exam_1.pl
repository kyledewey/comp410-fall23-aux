element(gallium).
element(chlorine).

meltingPoint(water, 0).
meltingPoint(gallium, 30).
meltingPoint(chlorine, -102).

boilingPoint(water, X) :-
    meltingPoint(water, MP),
    X is MP + 100.
boilingPoint(gallium, 2400).
boilingPoint(chlorine, -34).

% f(N, M, Output)
%% f(N, M, 0) :-
%%     N = 0; M = 0.
f(0, _, 0).
f(_, 0, 0).
f(1, M, M) :-
    M \== 0.
f(N, M, Result) :-
    N > 1,
    %M \== 0,
    (M < 0; M > 0),
    NMinusOne is N - 1,
    f(NMinusOne, M, Temp),
    Result is Temp + M.
