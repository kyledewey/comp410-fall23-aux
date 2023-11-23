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
}
