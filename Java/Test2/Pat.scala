
//This code introduces generic classes and methods, as well
//as traits (interfaces).

trait CanCompare[E] {  //like a Java interface, but allows code
def <(other: E): Boolean

  //any class extending CanCompare[E] and implementing < will automatically
  //have >, >=, and <= defined using these definitions.
  def >(other: E) = !(<(other)) && !=(other)
  def >=(other: E) = !(<(other))
  def <=(other: E) = <(other)) || ==(other)
}


//Here, the Tree classes are generic, parameterized by a type variable
//T which can range over any type.
abstract class Tree[T] extends CanCompare[Tree[T]]

case class Node[T](v:T, l:Tree[T], r:Tree[T]) extends Tree[T]

case class Leaf[T](v:T) extends Tree[T]

case class Empty[T]() extends Tree[T]

object Pat {

  //The compiler is smart enough to realize that myTree is a Node[Int]
  //(which is also a Tree[Int]
  val myTree = Node(3,Leaf(4),Node(5,Leaf(6),Empty()))

  //The compiler is smart enough to realize that myTree is a Node[String]
  //(which is also a Tree[String]
  val yourTree = Node(" three ",Leaf(" four "),Node(" five ",
    Leaf(" six "),Empty()))

  def printTree[T](t: Tree[T]) {
    t match {
      case Node(v,l,r) => print("( "); printTree(l); print(v); printTree(r);
        print(" )");
      case Leaf(v) => print(v);
      case Empty() => ();
    }
  }

  //The compiler knows that the first use of printTree below is really printTree[Int]
  //and the second one is printTree[String]
  def main(args: Array[String]) { printTree(myTree);
    printTree(yourTree);
    println() }
}
/**
 * Created by Min on 5/7/15.
 */

