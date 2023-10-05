# append([1, 2], [3, 4])
#  ==> Cons(1, append([2], [3, 4]))
#  ==> Cons(1, Cons(2, append([], [3, 4])))
#  ==> Cons(1, Cons(2, [3, 4]))
#  ==> Cons(1, Cons(2, Cons(3, Cons(4, Nil()))))
def append(list1, list2):
    if isinstance(list1, Nil):
        return list2
    else:
        rest = append(list1.tail, list2)
        return Cons(list1.head, rest)
    
