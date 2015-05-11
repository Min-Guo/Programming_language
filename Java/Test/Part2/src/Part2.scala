
class A  extends Ordered[A] {
  var a : Int = 0
  def this(value: Int) = {
    this();
    this.a = value;
  }
  def compare(that: A) = this.a - that.a
}

class B extends A {
  var b : Int = 0
  var c: Int = 0
  def sum(that: B) = that.c + that.b
}

class C[+T] (g: Int => T){
  def  apply (x: Int) : T = g(x)
}

abstract class Tree[T <: Ordered[T]] {
  def insert(x:T):Tree[T]
}

case class Leaf[T <: Ordered[T]] (v: T) extends Tree[T] {
  override def insert(x: T): Tree[T] = {
    if (this.v < x) {
      return Node[T](x, Leaf(v), Empty())
    } else {
      return Node[T](v, Leaf(x), Empty())
    }
  }
}
case class Node[T <: Ordered[T]] (v: T, l:Tree[T], r:Tree[T]) extends Tree[T] {
  override def insert(x:T): Tree[T] = {
    if (this.v < x) {
      this.r.insert(x)
    } else {
      this.l.insert(x)
    }
  }
}
case class Empty[T <: Ordered[T]]() extends Tree[T] {
  override def insert (x:T): Tree[T] = {
    return Leaf(x)
  }
}


object Part2 {
  def main(args: Array[String]) {

  }
}

