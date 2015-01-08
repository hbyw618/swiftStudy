// Playground - noun: a place where people can play

import UIKit


// Use protocol to declare a protocol

protocol ExampleProtocol{
    var simpleDescription: String{get}
    mutating func adjust()
}

// Classes enumerations, and structures can all adop protocols.


class SimpleClass: ExampleProtocol{
    var simpleDescription:String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += " Now 100% adjusted";
    }
}

var a = SimpleClass()
a.adjust()


struct SimpleStructure: ExampleProtocol{
    var simpleDescription:String = "A simple structure"
    
    // Notice the use of mutating keyword in the declaration of SimpleStructure to make a method that modifies the structure. A class does not need any of its methods marked as mutating because methods on a class can always modify the class.
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}


var b = SimpleStructure()
b.adjust()

let bDescription = b.simpleDescription


// Use extension to add functionality to an existing type. Such as methods and computed properties.You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.


extension Int: ExampleProtocol {
    var simpleDescription:String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

7.simpleDescription



//