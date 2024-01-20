def myNumber():
    yield 0
    yield 1
    yield 2

def makePair():
    for a in myNumber():
        for b in myNumber():
            yield (a, b)

# gen:
#  -Input: Depth Bound
#  -Output: AST
def gen(depth):
    yield Variable("x")
    yield Variable("y")
    if depth > 0:
        for e1 in gen(depth - 1):
            for e2 in gen(depth - 1):
                yield Call(e1, e2)
            
