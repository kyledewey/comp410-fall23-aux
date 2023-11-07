genOp(plus_op).
genOp(minus_op).
genOp(mult_op).
genOp(div_op).

% bounded-exhaustive search
% genExp: Bound (Int), Exp
genExp(_, integerExp(Int)) :-
    between(0, 2, Int).
genExp(Bound, opExp(Left, Op, Right)) :-
    Bound > 0,
    NewBound is Bound - 1,
    genExp(NewBound, Left),
    genOp(Op),
    genExp(NewBound, Right).

dividesByZero(opExp(_, div_op, integerExp(0))).

    
exp(_, true).
exp(_, false).
exp(N, if(E1, E2, E3)) :-
    N > 0,
    N1 is N - 1,
    exp(N1, E1),
    exp(N1, E2),
    exp(N1, E3).

% type of left, op, type of right, result
op(int, plus, int, int).
op(bool, and, bool, bool).
op(int, lt, int, bool).

% typecheck - Exp, Type
typecheck(number(_), int).
typecheck(true, bool).
typecheck(false, bool).
typecheck(binop(Left, Op, Right), ResultType) :-
    op(LeftType, Op, RightType, ResultType),
    typecheck(Left, LeftType),
    typecheck(Right, RightType).
%% typecheck(binop(Left, plus, Right), int) :-
%%     typecheck(Left, int),
%%     typecheck(Right, int).
%% typecheck(binop(Left, and, Right), bool) :-
%%     typecheck(Left, bool),
%%     typecheck(Right, bool).
%% typecheck(binop(Left, lt, Right), bool) :-
%%     typecheck(Left, int),
%%     typecheck(Right, int).
