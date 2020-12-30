### Styel Guide
https://github.com/raywenderlich/swift-style-guide#constants
https://github.com/matteocrippa/awesome-swift#style-guides
https://github.com/vsouza/awesome-ios

```java
//Text file name HelloWorld.java
public class HelloWorld {
  // main() is the method
  public static void main (String[] arfs)
    //Prints "Hello World" in the terminal window.
    System.out.pritn("Hello World");
}
```

### SWIFT XIB from hirerichy 기본틀로써 작용
```java
@IBAction func showView(_ sender: Any) {
    let view = MyView(frame: self.view.frame)
    self.view.addSubview(view)
}

class XibView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit(){
        guard let xibName = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last else { return }
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}


class MyView2: XibView { // 내 커스텀 뷰
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
```

 
### swift CONDITIONAL & LOOP STATEMENT
#### ANATOMY OF CONDITIONAL STATEMENT
> IF Statement
```java
  if (x>y) { // x > y is the boolean expression
   //Sequence of statements
   x = y;
  } 
```

> IF-ELSE STATEMENT
```java
   if (BOOLEAN EXPRESSION) { 
   //Sequence of statements
   } else {
   //Sequence of statements
   }
```

> NESTED IF STATEMENT
```java
   if (BOOLEAN EXPRESSION) { 
   //Sequence of statements
   } else if {
   //Sequence of statements
   }
   .
   .
   .
   else {
   //Sequence of statements
   }
```

>SWITCH STATEMENT
```java
  switch (VARIABLE TO EVALUATE ITS VALUE) {
    case value: Statement; break;
    ...
    ...
    ...
    default: Statement; break;
  }
```
**Example:**
```java
  int month = 8;
        String monthString;
        switch (month) {
            case 1:  monthString = "January";
                     break;
            case 2:  monthString = "February";
                     break;
            case 3:  monthString = "March";
                     break;
            case 4:  monthString = "April";
                     break;
            case 5:  monthString = "May";
                     break;
            case 6:  monthString = "June";
                     break;
            case 7:  monthString = "July";
                     break;
            case 8:  monthString = "August";
                     break;
            case 9:  monthString = "September";
                     break;
            case 10: monthString = "October";
                     break;
            case 11: monthString = "November";
                     break;
            case 12: monthString = "December";
                     break;
            default: monthString = "Invalid month";
                     break;
        }
```

#### ANATOMY OF A LOOP  STATEMENT
>FOR LOOP STATEMENT
```java
  for (declare and initialize a loop control variable; loop-continuation condition/s; increment or decrement of the variable of control)
  {
    //Statement
  }
``` 
**Example:**
```java  
  for (int i = 0; i <= n; i++) {
     System.out.println(i);
  }
```
> WHILE LOOP STATEMENT
```java
    while(condition){  //till condition will be true.
    //code to be executed 
    }
```
**Example:**
```java
  //Initialization is a separate statement
  int power = 1;

  while ( power <= 10/2 ) // power <= n/2 is an example of the loop-continuation condition
  {
    System.out.println(power);
  }
```

> DO-WHILE LOOP STATEMENT

```java
  do{ //always run one time even if condition would be false
    //Statement
  } while(loop-continuation condition);
```

**Example:**
```java
    int i=1;  
    do{  
      System.out.println(i);  
      i++;  
    }while(i<=10); 
```

### ARRAY
> ARRAY DECLARATION

```java
    int[]           ai;        // array of int
    short[][]       as;        // array of array of short
    short           s,         // scalar short
                    aas[][];   // array of array of short
    Object[]        ao;        // array of Object
    Collection<?>[] ca;  // array of Collection of unknown type
```

> DECLARATION OF ARRAY VARIABLE

```java
  Exception ae[]  = new Exception[3];
  Object aao[][]  = new Exception[2][3];
  int[] factorial = { 1, 1, 2, 6, 24, 120, 720, 5040 };
  char ac[]       = { 'n', 'o', 't', ' ', 'a', ' ',
                      'S', 't', 'r', 'i', 'n', 'g' };
  String[] aas    = { "array", "of", "String", };
```

### ACCESS MODIFIERS

1. defualt(No keyword required) 
2. private
3. public
4. protected 

### NON ACCESS MODIFIERS

1. static 
2. final 
3. transient
4. abstract
5. synchronized
6. volatile 

## Object Oriented Programming (OOPs) Concept :clipboard:

### OBJECT

```java
  //Declare a variable, object name
  String s;

  //Invoke a contructor to create an object
  s = new String ("Hello World");

  //Invoke an instance method that operates on the object's value
  char c = s.chartAt(4);
```
> INSTANCE VARIABLES

```java
  public class Charge {
    //Instance variable declarations
    private final double rx, ry;
    private final double q;
  }
```

### METHODS

```java
  public static double sum (int a, int b) { //double is the return type, sum is the method's name, a and b are two arguments of type int;
    int result; //local variable
    result = a + b;
    return result;//return statement;
  }
```

### CLASS DECLARATION
```java
class MyClass {
    // field, constructor, and 
    // method declarations
}
```
**Example:**

```java
    public class Bicycle {
        // the Bicycle class has
        // three fields
        public int cadence;
        public int gear;
        public int speed;
        // the Bicycle class has
        // one constructor
        public Bicycle(int startCadence, int startSpeed, int startGear) {
            gear = startGear;
            cadence = startCadence;
            speed = startSpeed;
        }
        // the Bicycle class has
        // four methods
        public void setCadence(int newValue) {
            cadence = newValue;
        }   
        public void setGear(int newValue) {
            gear = newValue;
        }   
        public void applyBrake(int decrement) {
            speed -= decrement;
        }  
        public void speedUp(int increment) {
            speed += increment;
        }
}
```
>DECLARING CLASSESS IMPLEMENTATING AN INTERFACE AND EXTENDING PARENT CLASS
```java
class MyClass extends MySuperClass implements YourInterface {
    // field, constructor, and
    // method declarations
}
```
* MyClass is a subclass of MySuperClass and that it implements the YourInterface interface.

> CONSTRUCTORS
* A class contains constructors that are invoked to create objects from the class blueprint.
* Constructor declarations look like method declarations—except that they use the name of the class and have no return type
* Each and every class has defualt No-args constructor.


```java
  public class Bicycle{
      
      private int gear;
      private int cadence;
      private int speed;
     
      public Bicycle(int startCadence, int startSpeed, int startGear) { //args-constructor
        gear = startGear;
        cadence = startCadence;
        speed = startSpeed;
      }

      public Bicycle(){//No-args constructor
        super();
      }
  }
```

### POLYMORPHISM
* Polymorphism is the concept where an object behaves differently in different situations.
*  There are two types of polymorphism 
    1. compile time polymorphism 
    2. runtime polymorphism.

#### 1. Compile Time Polymorphism
* Compile-time polymorphism is achieved by method overloading.
* method overloading is creating multiple method with methods name is same and arguments are different. 
```java
  public class Circle {

    public void draw(){
      System.out.println("Drwaing circle with default color Black and diameter 1 cm.");
    }

    public void draw(int diameter){ //method draw() overloaded.
      System.out.println("Drwaing circle with default color Black and diameter"+diameter+" cm.");
    }

    public void draw(int diameter, String color){ //method draw() overloaded.
      System.out.println("Drwaing circle with color"+color+" and diameter"+diameter+" cm.");
    }
  }
```
#### 2. Run Time Polymorphism
* Run-time polymorphism is achieved by method overriding.
* Runtime polymorphism is implemented when we have an **“IS-A”** relationship between objects.
* method overriding is the subclass has to override the superclass method.
```java
    public interface Shape {

	    public void draw();
    }
```
```java
    public class Circle implements Shape{

      @Override
      public void draw(){
        System.out.println("Drwaing circle");
      }

    }
```
```java
    public class Square implements Shape {

      @Override
      public void draw() {
        System.out.println("Drawing Square");
      }

    }
```
* `Shape` is the superclass and there are two subclasses `Circle` and `Square`
* Below is an example of runtime polymorphism.
```java
    Shape sh = new Circle();
    sh.draw();

    Shape sh1 = getShape(); //some third party logic to determine shape
    sh1.draw();
```

### INHERITANCE

* Inheritance is the mechanism of code reuse. 
* The object that is getting inherited is called the superclass and the object that inherits the superclass is called a subclass.
* We use `extends` keyword in java to implement inheritance from class.
* We use `implements` keyword in java to implement inheritance from interface.

```java
    public class Superclass{
      // methods and fields
    }
```
```java
    public interface Superinterface{
      // methods and fields
    }
```
```java
    public class Subclass extends Superclass implements Superinterface{
      // methods and fields
    }
```

### Abstraction

* Abstraction is the concept of hiding the internal details and describing things in simple terms.
* Abstraction can be achieved by two ways.
  1. Abstract Class
  2. Interface
  
#### 1. Abstract Class
* An abstract class must be declared with an `abstract` keyword.
* It can have abstract and non-abstract methods.
* It cannot be instantiated.
* It can have constructors and static methods also.
* It can have final methods which will force the subclass not to change the body of the method.

```java
    abstract class Flower{
        abstract String Smell(); //abstract method.
        String Oil(){  // non-abstract method. 
           System.out.println("Flower Oil is good.");
         }
    }

    public class Lily extends Flower{
        private String Smell(){ // implementation of abstarct method.
          System.out.println("Lily smell's lovender.");
        }
    }
```

#### 2. Interface
* Interface is a blueprint of a **class**.
* It can have only abstract methods. [Except Java 8 and next versions.]
* Since Java 8, we can have **default and static** methods in an interface.


```java
    interface print{  
        void printPaper();  
    }  
    public class A4 implements print{  
        public void printPaper(){
          System.out.println("A4 Page Printed. ");
        }  
    }
```

### Encapsulation

* Encapsulation is used for access restriction to class members and methods.
* Encapsulation is the technique used to implement abstraction in OOP.
* As in encapsulation, the data in a class is hidden from other classes, so it is also known as **data-hiding**.
* Encapsulation can be achieved by Declaring all the variables in the class as private and writing public methods in the class to set and get the values of variables.
* Best example of Encapsulation is POJO (Plain-Java-Object-Class).
  
 ```java
    public class User {
        private String username;
        private String password;

        public String getUsername() {
          return username;
        }

        public void setUsername(String username) {
          this.username = username;
        }

        public String getPassword() {
          return password;
        }

        public void setPassword(String password) {
          this.password = password;
        }
    }
 ```
  

## ADVANCE DATA TYPE
* **STACK DATA TYPE**

```java
  public class Stack<Item> implements Iterable <Item>

  Stack()   //create an empty stack
  boolean isEmpty() //return if the stack empty
  void push(Item item) // push an item onto the stack
  Item pop() //return and remove the item that was inserted most recently
  int size() //number of item on stack
```

* **QUEUE DATA TYPE**

```java
  public class Queue<Item> implements Iterable<Item>

  Queue()  //create an emptyh queue
  boolean isEmpthy()  //return if the queue empthy
  void enqueue(Item item) // insert an item onto queue
  Item dequeue()  //return and remove the item that was inserted least recently
  int size() //number of item on queue
```

* **ITERABLE**

```java
//import Iterator
import java.util.Iterator;

public class Queue<Item> implements Iterable <Item> { 

//FIFO queue
  private Node first;
  private Node last;
  private class Node {
    Item item;
    Node next;
  }

  public void enqueue (Item item)
  ...

  public Item dequeue()
  ...

}
```

* **SYMBOL TABLE DATA TYPE**

```java
  public class ST<Key extends Comparable<Key>, Value>

  ST()  //create and empty symbol table
  void put(Key key, Value val)  //associate val with key
  Value get(Key key)  //value associated with key
  void remove(Key key) //remove key (and its associated value)
  boolean contains (Key key)  //return if there is a value associated with key
  int size()  //number of key-value pairs
  Iterable<Key> keys()  // all keys in the symbol table
```

* **SET DATA TYPE**

```java
  public class SET<Key extends Comparable<Key>> implements Iterable<Key>
  SET() //create an empthy set
  boolean isEmpthy()  //return if the set is empthy
  void add (Key key)  //add key to the set
  void remove(Key key)  //remove key from set
  boolean contains(Key key) //return if the key is in the set
  int size() //number of elements in set
```
