isCold(ice_cream).
isCold(salad).
isCold(water).

isFood(pizza, warm).
isFood(burger, warm).
isFood(burrito, warm).
isFood(ice_cream, cold).
isFood(salad, cold).
isFood(water, cold).

likesPizza(alice).

aliceLikes(pizza).
aliceLikes(burger).
aliceLikes(burrito).
aliceLikes(yogurt).

bobLikes(pizza).
bobLikes(burger).

servedWarm(pizza).
servedWarm(burger).
servedWarm(burrito).

% likes(Person, Food).
likes(alice, pizza).
likes(alice, burger).
likes(alice, burrito).
likes(alice, yogurt).
likes(bob, pizza).
likes(bob, burger).
likes(bob, salad).
likes(bob, milk).
likes(bill, Food) :-
    servedWarm(Food).
likes(janet, F) :-
    likes(alice, F),
    likes(bob, F).
%% likes(mel, X) :-
%%     X = yogurt; likes(janet, X).
likes(mel, yogurt).
likes(mel, X) :-
    likes(janet, X).

listFoods :-
    isFood(X, warm),
    writeln(X),
    fail.

isBetween0And10(11).
isBetween0And10(X) :-
    X >= 0,
    X =< 10. % <=
%% isBetween0And10(X) :-
%%     X > 0,
%%     X < 10.

%% isBetween0And10ButNot5(X) :-
%%     X >= 0,
%%     X < 5.
%% isBetween0And10ButNot5(X) :-
%%     X > 5,
%%     X =< 10.

isBetween0And10ButNot5(X) :-
    isBetween0And10(X),
    X \== 5.
