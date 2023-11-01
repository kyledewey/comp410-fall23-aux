def genOp():
    num = randomIntBetween(0, 3)
    if num == 0:
        return PlusOp()
    elif num == 1:
        return MinusOp()
    elif num == 2:
        return MultOp()
    elif num == 3:
        return DivOp()

def genExp():
    num = randomIntBetween(0, 1)
    if num == 0:
        return IntegerExp(randomIntBetween(0, 100))
    elif num == 1:
        return OpExp(genExp(), genOp(), genExp())
    
