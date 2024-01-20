sealed trait Exp
case class Variable(name: String) extends Exp
case class Call(e1: Exp, e2: Exp) extends Exp

object Example {
  // nat(0).
  // nat(N) : -
  //   nat(M),
  //   N is M + 1.

  def nat(): Iterator[Int] = {
    Iterator(0) ++ nat().flatMap(m => Iterator(m + 1))
  }

  def foo(): Iterator[Int] = {
    // Iterator(1) ++ Iterator(2)
    Iterator(1, 2)
  }

  def bar(): Iterator[Int] = {
    // foo().flatMap(a =>
    //   Iterator(a + 1) ++ Iterator(a + 2))
    //
    // foo().flatMap(a =>
    //   Iterator(a + 1, a + 2).flatMap(b =>
    //     Iterator(b)))
    for {
      a <- foo()
      b <- Iterator(a + 1, a + 2)
    } yield b
  }

  // myNumber(0).
  // myNumber(1).
  // myNumber(2).
  def myNumber: Iterator[Int] = {
    // Iterator(0) ++ Iterator(1) ++ Iterator(2)
    Iterator(0, 1, 2)
  }

  // makePair(Result) :-
  //   myNumber(A),
  //   MyNumber(B),
  //   Result = pair(A, B).
  def makePair: Iterator[(Int, Int)] = {
    for {
      a <- myNumber
      b <- myNumber
    } yield (a, b)
    // myNumber().flatMap(a =>
    //   myNumber().flatMap(b =>
    //     Iterator((a, b))))
  }

  def gen(depth: Int): Iterator[Exp] = {
    val baseCases = Iterator(Variable("x"), Variable("y"))
    val recCase =
      if (depth > 0) {
        for {
          e1 <- gen(depth - 1)
          e2 <- gen(depth - 1)
        } yield Call(e1, e2)
      } else {
        Iterator()
      }
    baseCases ++ recCase
  }
}
