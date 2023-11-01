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

% sum([1, 2, 3])
% ===> 1 + sum([2, 3])
% ===> 1 + (2 + sum([3]))
% ===> 1 + (2 + (3 + sum([])))
% ===> 1 + (2 + (3 + 0))
sum([], 0).
%sum([A], A).
sum([Head|Tail], Sum) :-
    sum(Tail, TailSum),
    %writeln(TailSum),
    Sum is Head + TailSum.

% sumAllAccum([1, 2, 3], 0)
% ==> sumAllAccum([2, 3], 1)
% ==> sumAllAccum([3], 3)
% ==> sumAllAccum([], 6)
% ==> 6
sumAllAccum([], A, A).
sumAllAccum([H|T], A, Sum) :-
    NewA is A + H,
    sumAllAccum(T, NewA, Sum).

% sumAllAccum([1, 2, 3])
% ==> sumAllAccum([1, 2, 3], 0)
sumAllAccum(List, Sum) :-
    sumAllAccum(List, 0, Sum).

% betterLength([a, b, c])
% ==> 1 + betterLength([b, c])
% ==> 1 + (1 + betterLength([c]))
% ==> 1 + (1 + (1 + betterLength([])))
% ==> 1 + (1 + (1 + 0))
%% betterLength([], 0).
%% betterLength([_|T], Len) :-
%%     betterLength(T, TailLen),
%%     Len is TailLen + 1.
betterLength(List, Length) :-
    betterLength(List, 0, Length).

% betterLength: List, RunningSum, ListLength
betterLength([], Sum, Result) :-
    Sum = Result.
betterLength([_|T], Sum, Result) :-
    (nonvar(Result) -> (Sum < Result); true),
    NewSum is Sum + 1,
    betterLength(T, NewSum, Result).

% Node* current = head;
% int length = 0;
% while (current != NULL) {
%   length++;
%   current = current->next;
% }
% return length;

% tree ::= leaf | node(tree, value, tree)
% numNodes: Tree, NumberOfNodes
numNodes(leaf, 0).
numNodes(node(Left, _, Right), Sum) :-
    numNodes(Left, LeftNodes),
    numNodes(Right, RightNodes),
    Sum is LeftNodes + RightNodes + 1.

% numNodesTailrec: [Node], Sum, Result
numNodesTailrec([], Sum, Sum).
numNodesTailrec([leaf|Rest], Sum, Result) :-
    numNodesTailrec(Rest, Sum, Result).
numNodesTailrec([node(Left, _, Right)|Rest], Sum, Result) :-
    NewSum is Sum + 1,
    numNodesTailrec([Left, Right|Rest], NewSum, Result).

numNodesTailrec(Node, Sum) :-
    numNodesTailrec([Node], 0, Sum).

sublist([], []).
sublist([H|T], [H|L2]) :-
    % choose to put element in output list
    sublist(T, L2).
sublist([_|T], L2) :-
    % choose to ignore the element; don't put
    % it in the output list
    sublist(T, L2).


myReverse(List, X) :-
    myReverse(List, [], X).

myReverse([], A, A).
myReverse([Head|Tail], A, X) :-
    myReverse(Tail, [Head|A], X).

% def reverse[A](input: List[A], accum: List[A]): List[A] = {
%   input match {
%     case head :: tail => reverse(tail, head :: accum)
%     case Nil => accum
%   }
% }
