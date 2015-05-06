import javax.xml.ws.AsyncHandler;
import java.util.ArrayList;
import java.util.Comparator;



class A implements Comparable<A>, Addable<A>{

    Integer x;

    public A(Integer args){
        this.x = args;
    }


    public int compareTo (A a) {
       return this.x.compareTo(a.x);
    }

    public A plus (A a) {
        return new A(this.x + a.x);
    }
}


class B extends A {
    B (Integer x) {
        super(x);

    }

}

interface Addable <T> {
    public T plus (T t) ;
}


class MyList<T extends Comparable<T> & Addable<T> > extends ArrayList<T>  implements Comparable<MyList<T>>, Addable<MyList<T>> {

    T z;

    public MyList (T args) {
        this.z = args;
    }

    public T sum (MyList<T> list) {
        T sum = z;
        for (int i =0; i <= list.size() - 1; i++) {
            sum = sum.plus(list.get(i));
        }
        return sum;
    }

    public int compareTo(MyList<T> list) {
        return sum(this).compareTo(sum(list));
    }

    public MyList<T> plus (MyList<T> list) {
        return new MyList<T>(this.z.plus(list.z));
    }

}



public class Part1 {
    public  static void main(String[] args) {
        test();

    }

    public  static void insertIntoMyList (A z, MyList<A> L) {
        L.add(z);
    }

    public static void test() {
        MyList<A> m1 = new MyList<A>(new A(0));
        MyList<A> m2 = new MyList<A>(new A(0));
        for(Integer i = 1; i <= 5; i++) {
            insertIntoMyList(new A(i),m1);
            insertIntoMyList(new B(i),m2);
        }

        insertIntoMyList(new A(6),m2);
        System.out.println("m1 = " + m1);
        System.out.println("m2 = " + m2);
        int result = m1.compareTo(m2);
        String s = (result < 0) ? "less than" : (result == 0) ? "equal to" : "greater than";
        System.out.println("m1 is " + s + " m2");
        System.out.println("m1 + m2 = " + m1.plus(m2));
    }
}
