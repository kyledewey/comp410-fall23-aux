def nat():
    yield 0
    for m in nat():
        yield m + 1

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
        
