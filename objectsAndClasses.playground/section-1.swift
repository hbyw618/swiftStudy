// Playground - noun: a place where people can play

import UIKit



// Use class followed by the class's name to create a class. A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class.Likewise, method and function declarations are written the same way.


class Shape{
    var numberOfSides = 0
    
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}


// Create an instance of a class by putting parentheses after the class name.


var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()



// Using init to create initializer.
// Subclasses include their superclass name after their class name, separated by a colon. There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.
class NamedShape{
    
    //Every property needs a value assigned -- either in its declaration or in the initializer
    var numberOfSides: Int = 0
    var name:String
    
    init(name:String){
        // self is used to distinguish the name property from the name argument to the initializer.
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    //Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.
    
}


// Methods on a subclass that override the superclass's implementation are marked override--overriding a method by accident, without override, is detected by the compiler as an error.The compiler also detects methods with override that don't actually override any methods in the superclass.


class Square: NamedShape{
    
    var sideLength:Double
    init(sideLength:Double, name:String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    
    func area() -> Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
    
}


let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


// Properties can have a getter and a setter.
class EquilateralTriangle:NamedShape{
    var sideLength: Double = 0.0
    
    /*
    3 steps:
    1.Setting the value of properties that the subclass declares.
    2.Calling the superclass's initializer
    3.Changing the value of properties defined by the superclass. Any Additional setup work that uses the methods, getters or setters can also be done at this point.
*/
    init(sideLength:Double, name:String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter:Double {
        get{
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
    
    
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: " a triangle")

triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength



// If you don't need to compute the property but still need to provide code that is run before and after setting a new value, use willSet and didSet.

class TriangleAndSquare{
    var triangle:EquilateralTriangle {
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square:Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    
    
    init(size:Double, name:String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
    
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")

triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "large square")
triangleAndSquare.triangle.sideLength


// Methods on classes have one important difference from functions.Parameter names in functions are used only within function, but parameters names in methods are also used when you call the method( except for the first parameter). By default , a method has the same name for its parameters when you call it and within the method itself. You can specify a second name, which is used inside the method.

class Counter{
    var count:Int = 0
    func incrementBy(amount:Int, numberOfTimes times:Int){
        count += amount * times
    }
}

var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)


// When working with optional values, you can write ? before operations like methods, properties, and subscripting. If the value before the ? is nil, evertything after the ? is ignored and the value of the whole expression is nil. Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value. In both case, the value of the whole expression is an optional value.

let optionalSquare:Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength




