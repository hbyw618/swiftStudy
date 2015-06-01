//: Playground - noun: a place where people can play

import UIKit

// * Extensions

// Extensions add new functionality to an existing class, structure, or enumeration type. This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling). Extensions are similar to categories in Objective-C. (Unlike Objective-C categories, Swift extensions do not have names.)

/*
Extensions in Swift can:

1) Add computed properties and computed type properties
2) Define instance methods and type methods
3) Provide new initializers
4) Define subscripts
5) Define and use new nested types
6) Make an existing type conform to a protocol

NOTE: Extensions can add new functionality to a type, but they cannot override existing functionality.

*/


// * Extension Syntax


/*

Declare extensions with the extension keyword:

extension SomeType {
// new functionality to add to SomeType goes here
}
An extension can extend an existing type to make it adopt one or more protocols. Where this is the case, the protocol names are written in exactly the same way as for a class or structure:

extension SomeType: SomeProtocol, AnotherProtocol {
// implementation of protocol requirements goes here
}
*/


// * Computed Properties

// Extensions can add computed instance properties and computed type properties to existing types.

// Extensions can add new computed properties, but they cannot add stored properties, or add property observers to existing properties.

extension Double {
    var km: Double { return self * 1_000.0 }
    var m:Double { return self }
    var cm:Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}


let oneInch = 25.4.mm

let threeFeet = 3.ft

let aMarathon = 42.km + 195.m


// * Initializers
// Extensions can add new initializers to existing types. This enables you to extend other types to accept your own custom types as initializer parameters, or to provide additional initialization options that were not included as part of the type’s original implementation.
// Extensions can add new convenience initializers to a class, but they cannot add new designated initializers or deinitializers to a class. Designated initializers and deinitializers must always be provided by the original class implementation.
// NOTE: If you use an extension to add an initializer to a value type that provides default values for all of its stored properties and does not define any custom initializers, you can call the default initializer and memberwise initializer for that value type from within your extension’s initializer.This would not be the case if you had written the initializer as part of the value type’s original implementation, as described in Initializer Delegation for Value Types.


struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

// Because the Rect structure provides default values for all of its properties, it receives a default initializer and a memberwise initializer automatically.

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))


extension Rect {
    init(center:Point, size:Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin:Point(x: originX, y: originY), size:size )
    }
}


let centerRect = Rect(center: Point(x: 4.0, y: 4.0) , size:Size(width:3.0,height:3.0))



// NOTE:If you provide a new initializer with an extension, you are still responsible for making sure that each instance is fully initialized once the initializer completes.



// * Methods
// extensions can add new instance methods and type methods to existing types. The following example adds a new instance method called repetitions to the Int type:

extension Int {
    // function has no parameters and does not return a value
    func repetitions( task: () -> () ) {
        for _ in 0 ..< self {
            task()
        }
    }
}


3.repetitions({println("Hello")})


3.repetitions {
    println("Goodbye")
}



// * Mutating Instance Method

// Instance methods added with an extension can also modify (or mutate) the instance itself. Structure and enumeration methods that modify self or its properties must mark the instance method as mutating, just like mutating methods from an original implementation.

extension Int {
    mutating func square() {
        self = self * self
    }
}


var someInt = 3
someInt.square()



// * Subscripts
// “Extensions can add new subscripts to an existing type. 

extension Int {
    subscript(var digitIndex:Int  ) -> Int{
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }
        return ( self / decimalBase ) % 10
    }
}


746381295[0]
746381295[1]
746381295[2]
746381295[3]
746381295[4]
746381295[5]
746381295[6]
746381295[7]
746381295[8]
746381295[9]


// * Nested Types
// Extensions can add new nested types to existing classes, structures and enumerations:

extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind:Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        case let x where x < 0:
            return .Negative
        default:
            return .Negative
        }
    }
}


func printIntegerKinds(numbers:[Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            println("- ")
        case .Zero:
            println("0 ")
        case .Positive:
            println("+ ")
        }
    }
    print("\n")
}




printIntegerKinds([3, 19, -27, 0, -6, 0, 7])


// NOTE: number.kind is already known to be of type Int.Kind. Because of this, all of the Int.Kind member values can be written in shorthand form inside the switch statement, such as .Negative rather than Int.Kind.Negative.

