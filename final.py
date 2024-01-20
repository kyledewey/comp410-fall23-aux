def isName():
    yield from ["alice", "bob", "janet", "bill"]
    # yield "alice"
    # yield "bob"
    # yield "janet"
    # yield "bill"

def naturalNumber():
    yield 0
    for nMinusOne in naturalNumber():
        yield nMinusOne + 1

def naturalNumberV2():
    value = 0
    while True:
        yield value
        value += 1

class Nil:
    def __init__(self):
        pass

class Cons:
    def __init__(self, head, tail):
        self.head = head
        self.tail = tail

def selectElement(inputList):
    # while isinstance(inputList, Cons):
    #     yield inputList.head
    #     inputList = inputList.tail
        
    # selectElement([Head|_], Head).
    if isinstance(inputList, Cons):
        yield inputList.head

    # selectElement([_|Tail], Element) :-
    #   selectElement(Tail, Element).
    if isinstance(inputList, Cons):
        # yield selectElement(inputList.tail)
        for element in selectElement(inputList.tail):
            yield element
        # yield from selectElement(inputList.tail)


class Leaf:
    def __init__(self):
        pass

class Node:
    def __init__(self, left, value, right):
        self.left = left
        self.value = value
        self.right = right

def treeElement(t):
    # if isinstance(t, Node):
    #     yield t.value
    #     yield from treeElement(t.left)
    #     yield from treeElement(t.right)

    # treeElement(node(_, Value, _), Value).
    if isinstance(t, Node):
        yield t.value

    # treeElement(node(Left, _, _), Value) :-
    #   treeElement(Left, Value).
    if isinstance(t, Node):
        for value in treeElement(t.left):
            yield value

    # treeElement(node(_, _, Right), Value) :-
    #   treeElement(Right, Value).
    if isinstance(t, Node):
        for value in treeElement(t.right):
            yield value
        
