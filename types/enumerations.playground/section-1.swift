// Playground - noun: a place where people can play

import UIKit


// * Enumerations
// Enumerations in Swift are much more flexible, and do not have to provide a value for each member of the enumeration. If a value (known as a "raw" value) is provided for each enumeration member, the value can be a string, a character, or a value of any integer or floating-point type.

// Alternatively, enumeration members can specify associated values of any type to be stored along with each different member value, much as  unions or variants do in other languages. You can define a common set of related members as part of one enumeration, each of which has a different set of values of appropriate types associated with it.

// Enumerations in Swift are first-class types in their own right. They adopt many features traditionally supported only by classes, such as computed properties to provide additional information about the enumeration's current value, and instance methods to provide functionality related to the values the enumeration represents. Enumerations can also define initializers to provide an initial member value; can be extended to expand their functionality beyond their original implementation; and can conform to protocols to provide standard functionality.



// * Enumeration Syntax
// You introduce enumerations with the enum keyword and place their entire definition within a pair of braces:

enum SomeEnumeration {
    // enumeration definition goes here
}



// The values defined in an enumeration are the member values of that enumeration. The case keyword indicates that a new line of member values is about to be defined.


enum CompassPoint {
    case North
    
    case South
    
    case East
    
    case West
    
}

// Unlike C and Objective-C, Swift enumeration members are not assigned a default integer value when they are created. Instead, the different enumeration members are fully-fledged values in their own right, with an explicitly-defined type of CompassPoint.


// Multiple member values can appear on a single line, separated by commas:

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
    
}


// The type of directionToHead is inferred when it is initialized with one of the possible values of CompassPoint.

var directionToHead = CompassPoint.West

directionToHead = .East

// * Matching Enueration Values with a Switch Statement

directionToHead = .South
switch directionToHead {
case .North:
    println("Lots of planets have a north")
case .South:
    println("Watch out for penguins")
case .East:
    println("Where the sun rises")
case .West:
    println("Where the skies are blue")
}

// A switch statement must be exhaustive when considering an enumeration's members.


// * Associated Values
// You can define Swift enumerfations to store associated values of any given type, and the value types can be different for each member of the enumeration if needed. Enumerations similar to these are known as discriminated unions, tagged unions, or variants in other programming languages.


enum Barcode {
    
    // This definition does not provide any actual Int or String values - it just defines the type of associated values that Barcode constants and variables can store when they are equal to Barcode.UPCA or Barcode.QRCode.
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}


var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")


// The associated values can be extracted as part of the switch statement, You extract each associated value as a constant ( with the let prefix) or a variable ( with the var prefix ) for use within the switch case's body.
switch productBarcode{
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    println("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
    
case .QRCode(let productCode):
    println("QR Code: \(productCode).")
}

// If all of the associated values for a enumeration member are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the member name, for brevity:
switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    println("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
    println("QR Code: \(productCode).")
}


// * Raw values
// As an alternative to associated values, enumeration members can come prepopulated with default values ( called raw values ), which are all of the same type.



// Here, the raw values for an enumeration called ASCIIControlCharacter are defined to be of type Character, and are set to some of the more common ASCII control characters.
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    
    case LineFeed = "\n"
    
    case CarriageReturn = "\r"
}

// The raw value for a particular enumeration member is always the same. Associated values are set when you create a new constant or variable based on one of the enumeration's members, and can be different each time you do so.


// Raw values can be strings, characters, or any of the integer or floating-point number types. Each raw value must be unique within its enumeration declaration. When integers are used for raw values, they auto-increment if no value is specified for some of the enumeration members.

enum Planet2:Int{
    // Auto-incrementation means that Planet.Venus has raw value of 2, and so on.
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

Planet2.Venus.rawValue


// Initializing from a Raw Value

let possiblePlanet = Planet2(rawValue: 7)

// Not all posible Int values will find a matching planet, however. the raw value initializer will always returns an optional enumeration member.

possiblePlanet?.rawValue

let positionToFind = 9

// Use optional binding to try to access a planet with a raw value of 9.
if let somePlanet = Planet2(rawValue: positionToFind){
    switch somePlanet {
    case .Earth:
        println("Mostly harmless")
    default:
        println("Not a safe place for humans")
    }
}else {
    println("There isn't a planet at position \(positionToFind)")
}

