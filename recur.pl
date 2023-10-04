% fib(NumberInSequence, Result).

% fib(0) = 0
fib(0, 0).
% fib(1) = 1
fib(1, 1).
% fib(n) = fib(n - 1) + fib(n - 2), for n > 1
fib(N, X) :-
    N > 1,
    NOne is N - 1,
    NTwo is N - 2,
    fib(NOne, Y),
    fib(NTwo, Z),
    X is Y + Z.

% factorial: Input, Output
factorial(0, 1).
factorial(N, X) :-
    N > 0,
    N2 is N - 1,
    factorial(N2, R),
    X is R * N.

%% myBetween(A, B, X) :-
%%     A =< B,
%%     A = X.
myBetween(A, B, A) :-
    A =< B.
myBetween(A, B, X) :-
    A1 is A + 1,
    A1 =< B,
    myBetween(A1, B, X).

