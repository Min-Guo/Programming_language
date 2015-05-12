
class A(a:Int)  extends Ordered[A] {
  var x  = a
  def sum = x
  def compare(that: A) = this.sum - that.sum
  override def toString() = "A<" + x + ">"
}

class B(b:Int, c: Int) extends A(b)  {
  var y = b
  var z = c
  override def sum = z + y
  override  def toString() = "B<" + y + "," + z + ">"
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
       Node[T](v, Empty(), Leaf(x))
    } else {
       Node[T](x, Empty(), Leaf(v))
    }
  }
}
case class Node[T <: Ordered[T]] (v: T, l:Tree[T], r:Tree[T]) extends Tree[T] {

  override def insert(x:T): Tree[T] = {
    if (this.v < x) {
      Node[T](v, l, r.insert(x))
    } else {
      Node[T](v, l.insert(x), r)
    }
  }
}
case class Empty[T <: Ordered[T]]() extends Tree[T] {
  override def insert (x:T): Tree[T] = {
     Leaf(x)
  }
}


object Part2 {
  def applyTo10(c: C[A]) = c.apply(10)
  def main(args: Array[String]) {
    test()
  }
  def printTree(t: Tree[A]) {
    t match {
      case Node(v, l, r) => print("(");
        printTree(l);
        print(v);
        printTree(r);
        print(")");
      case Leaf(v) => print(v);
      case Empty() => ();
    }
  }
  def test() {
    val c1 = new C((x:Int) => new A(x))
    println(c1.apply(3))

    val c2 = new C((x:Int) => new B(x+1, x+2))
    println(c2.apply(3))

    println(applyTo10(c1))
    println(applyTo10(c2))  //relies on covariant subtyping


    var t1: Tree[A] = Empty()
    t1 = t1.insert(new A(4))
    t1 = t1.insert(new A(3))
    t1 = t1.insert(new B(4,1))
    t1 = t1.insert(new A(2))
    printTree(t1)
  }

}

