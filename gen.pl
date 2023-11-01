genOp(plus_op).
genOp(minus_op).
genOp(mult_op).
genOp(div_op).

% bounded-exhaustive search
genExp(integerExp(Int)) :-
    between(0, 2, Int).
genExp(opExp(Left, Op, Right)) :-
    genExp(Left),
    genOp(Op),
    genExp(Right).
