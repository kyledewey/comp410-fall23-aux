# nat(0).
# nat(N) :-
#   nat(M),
#   N is M + 1.
def nat():
    print("before 0")
    yield 0
    print("after 0")
    for m in nat():
        print("start of loop")
        yield m + 1
        print("end of loop")

# ?- between(3, 5, X).
#    X = 3;
#    X = 4;
#    X = 5.
#
# between(Min, Max, Min) :-
#   Min =< Max.
# between(Min, Max, Result) :-
#   Min < Max,
#   NewMin is Min + 1,
#   between(NewMin, Max, Result).
def between(minBound, maxBound):
    for x in range(minBound, maxBound + 1):
        yield x
    # if minBound <= maxBound:
    #     yield minBound
    # if minBound < maxBound:
    #     for result in between(minBound + 1, maxBound):
    #         yield result

# tupleExample(tup(1, 2)).
# tupleExample(tup(3, 4)).
# tupleExample(tup(5, 6)).
def tupleExample():
    yield (1, 2)
    yield (3, 4)
    yield (5, 6)
    
def example():
    # for x, y in tupleExample():
    #     print(x)
    #     print(y)
    for tup in tupleExample():
        print(tup[0])
        print(tup[1])
        
