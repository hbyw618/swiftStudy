//: Playground - noun: a place where people can play

import UIKit



// * Protocols

// A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol doesn’t actually provide an implementation for any of these requirements—it only describes what an implementation will look like. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
// Protocols can require that conforming types have specific instance properties, instance methods, type methods, operators, and subscripts.

protocol SomeProtocol {
    // protocol definition goes here
}
protocol SomeProtocol2 {
    // protocol definition goes here
}

// Custom types state that they adopt a particular protocol by placing the protocol’s name after the type’s name, separated by a colon, as part of their definition. Multiple protocols can be listed, and are separated by commas:

struct SomeStruct : SomeProtocol, SomeProtocol2 {
    // structure definition goes here
}

// If a class has superclass, list the superclass name before any protocol it adopts, followed by a comma:

class SomeClass:AnyObject, SomeProtocol,SomeProtocol2 {
    
}



// * Property Requirements
// A protocol can require any conforming type to provide an instance property or type property with a particular name and type. The protocol doesn’t specify whether the property should be a stored property or a computed property—it only specifies the required property name and type. The protocol also specifies whether each property must be gettable or gettable and settable.

// If a protocol requires a property to be gettable and settable, that property requirement cannot be fulfilled by a constant stored property or a read-only computed property.”

// Property requirements are always declared as variable properties, prefixed with the var keyword. Gettable and settable properties are indicated by writing { get set } after their type declaration, and gettable properties are indicated by writing { get }.”

protocol SomeProtocol3 {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable:Int { get }
}


// Always prefix type property requirements with the static keyword when you define them in a protocol. This rule pertains even though type property requirements can be prefixed with the class or static keyword when implemented by a class:

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName:String
}

let john = Person(fullName: "John Appleseed")


class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil){
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}


var ncc1701 = Starship(name: "Enterprise",prefix:"USS")

ncc1701.fullName



// * Method Requirements
//Protocols can require specific instance methods and type methods to be implemented by conforming types. These methods are written as part of the protocol’s definition in exactly the same way as for normal instance and type methods, but without curly braces or a method body. Variadic parameters are allowed, subject to the same rules as for normal methods. Default values, however, cannot be specified for method parameters within a protocol’s definition.

// As with type property requirements, you always prefix type method requirements with the static keyword when they are defined in a protocol. This is true even though type method requirements are prefixed with the class or static keyword when implemented by a class:

protocol SomeProtocol4 {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}


class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
println("Here's a random number: \(generator.random())")
println("And another random number: \(generator.random())")



// * Mutating Method Requirements


// For instance methods on value types (that is, structures and enumerations) you place the mutating keyword before a method’s func keyword to indicate that the method is allowed to modify the instance it belongs to and/or any properties of that instance.
// If you define a protocol instance method requirement that is intended to mutate instances of any type that adopts the protocol, mark the method with the mutating keyword as part of the protocol’s definition. This enables structures and enumerations to adopt the protocol and satisfy that method requirement.
// NOTE: If you mark a protocol instance method requirement as mutating, you do not need to write the mutating keyword when writing an implementation of that method for a class. The mutating keyword is only used by structures and enumerations.

protocol Toggable {
    mutating func toggle()
}


enum OnOffSwitch:String, Toggable {
    case Off = "Off", On = "On"
    mutating func toggle() {
        switch self{
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}


var lightSwitch = OnOffSwitch.Off
lightSwitch.rawValue
lightSwitch.toggle()
lightSwitch.rawValue
lightSwitch.toggle()
lightSwitch.rawValue


// * Initializer Requirements
// Protocols can require specific initializers to be implemented by conforming types. You write these initializers as part of the protocol’s definition in exactly the same way as for normal initializers, but without curly braces or an initializer body:

protocol SomeProtocol5 {
    init( someParameter: Int)
}

// * Class Implementations of Protocol Initializer Requirements

//You can implement a protocol initializer requirement on a conforming class as either a designated initializer or a convenience initializer. In both cases, you must mark the initializer implementation with the required modifier:

class SomeClass5: SomeProtocol5 {
    required init( someParameter:Int) {
        // Implementation goes here
    }

}

// “The use of the required modifier ensures that you provide an explicit or inherited implementation of the initializer requirement on all subclasses of the conforming class, such that they also conform to the protocol.


// NOTE: You do not need to mark protocol initializer implementations with the required modifier on classes that are marked with the final modifier, because final classes cannot be subclassed.
