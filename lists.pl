% myAppend(InputList1, InputList2, OutputList)

%% myAppend([], SecondList, OutputList) :-
%%     SecondList = OutputList.
%% myAppend([Head|Tail], SecondList, OutputList) :-
%%     OutputList = [Head|Rest],
%%     myAppend(Tail, SecondList, Rest).

myAppend([], SecondList, SecondList) :- true.
myAppend([Head|Tail], SecondList, [Head|Rest]) :-
    myAppend(Tail, SecondList, Rest).

% TODO: go through queries and trace
