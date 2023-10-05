% myAppend(InputList1, InputList2, OutputList)

%% myAppend([], SecondList, OutputList) :-
%%     SecondList = OutputList.
%% myAppend([Head|Tail], SecondList, OutputList) :-
%%     OutputList = [Head|Rest],
%%     myAppend(Tail, SecondList, Rest).

% tail recursion optimization
myAppend([], SecondList, SecondList).
myAppend([Head|Tail], SecondList, [Head|Rest]) :-
    myAppend(Tail, SecondList, Rest).

% sum1([1, 2, 3])
% ===> 1 + sum1([2, 3])
% ===> 1 + (2 + sum1([3]))
% ===> 1 + (2 + (3 + sum1([])))
% ===> 1 + (2 + (3 + 0))
sum1([], 0).
sum1([Head|Tail], Sum) :-
    sum1(Tail, TailSum),
    Sum is Head + TailSum.

% TODO: go through queries and trace
