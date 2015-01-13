// Playground - noun: a place where people can play

import UIKit

// * Collection types

// Arrays and dictionaries in Swift are always clear about the types of values and keys that they can store, this means that you cannot insert a value of the wrong type in to an array or dictionary by mistake.
// Behind the scenes, Swift's array and dictionary types are implemented as generic collections.

// * Mutability of Collections

// If you assign an array or a dictonary to a variable, the collection that is created will be mutable. This means that you can change( or mutate) the collection after it it created by adding, removing, or change items in the collection. Conversely, if you assign an array or a dictionary to a constant, that array or dictionary is immutable, and its size and contents cannot be changed.

var shoppingList: [String] = ["Eggs", "Milk"]
var shopingListInShort = ["Eggs","Milk"]

// * Accessing and Modifying an Array
println("The shopping list contains \(shopingListInShort.count) items.")

if shopingListInShort.isEmpty {
    println("The shopping list is empty.")
}else {
    println("The shopping list is not empty.")
}


shoppingList.append("Flour")
shoppingList+=["Baking Powder"]
shoppingList+=["Chocolate Spread", "Butter"]



var firstItem = shoppingList[0]


shoppingList[0] = "Six eggs"

// Use subscript syntax to chage a range of values at once, even if the replacement set of values has a different length than the range you are replacing
shoppingList[0...1] = ["Bananas", "Apples"]

// You can't use subscript syntax to append a new item to the end of an array.
shoppingList.insert("Maple Syrup", atIndex: 0)

// Removes and returns the removed item.
let mapleSyrup = shoppingList.removeAtIndex(0)

// Any gaps in an array are closed when a item is removed.
shoppingList

let last = shoppingList.removeLast()

// Iterating over an Array

for item in shoppingList{
    println(item)
}

for (index, item) in enumerate(shoppingList){
    println("The item index is \(index) and the Item is \(item)")
}


// * Creating and Initializing an Array
// You can create an empty array of a certain type(without setting any inital values) using initializer syntax:

var someInts = [Int]()

println("someInts is of type [Int] with \(someInts.count) items.")


// If the context already provides type information, such as a function argument or an already typed variable or constant, you can create an empty array with an empty array literal, which is written as []

someInts.append(3)
someInts = []

// Create an array of certain size with all of its values set to a provided default value. You pass the initializer the number of items to be added to the new array(called count) and a default value of the appropriate type(called repeatedValue):

var threeDoubles  = [Double](count: 3, repeatedValue: 0.0)


// Create a new array by adding together two existing arrays of compatible type with the addition operator (+).
var anotherThreeDoubles = [Double](count:3, repeatedValue:2.5)

var sixDoubles = threeDoubles + anotherThreeDoubles




// * Dictionaries

// A dictionary is a container that stores multiple values of the same type. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary. Unlike items in a array, items in a dictionary do not have a specified order. You use a dictionary when you need to look up values based on their identifier, in much the same way that a real-world dictionary is used to look up the definition for a particular word.

// In Swift the type of keys and values always made clear, either through an ecplicit type annotation or through type inference.



// Dictionary Type Shorthand Syntax

// The type of a Swift dictionary is written in full as Dictionary<Key,Value>, where Key is the type of value that can be used as a dictionary key, and Value is the type of value that dictionary stores for those keys.
// You can also write the type of a dictionary in short hand forms as [Key:Value]


// Dictionary Literals

var airports: [String:String] = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]

// As with arrays, you don't have to write the type of dictionary if you're initializing it with a dictonary literal whose keys and values have consitent types.

var airportsInShort = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]

// Accessing and Modifying a Dictionary
// You access and modify a dictionary through its methods and properties, or by suing subscript syntax.
println("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    println("The airports dictionary is empty.")
}else{
    println("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

// The updateValue(forKey:) method sets a value for a key if none exists, or updates the value if that key already exists.This method returns the old value after performing an update, and it requires a optional value as parameter.

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    println("The old value for DUB was \(oldValue).")
}
// It is possible to request a key for which no value exists, a dictionary's subscript returns an optional value of the dictionary's value type.

if let airportName = airports["DUB"]{
    println("The name of the airport is \(airportName).")
}else{
    println("The airport is not in the airports dictionary.")
}


// Remove items
airports["APL"] = "Apple International"
airports["APL"] = nil
// Alternatively ,remove a key=value pair from a dictionary with the removeValueForKey method.This method removes the key=value pair if it exists and returns the removed value, or returns nil if no value existed:
if let removedValue = airports.removeValueForKey("DUB"){
    println("The removed airport's name is \(removedValue)")
} else {
    println("The airports dictionary does not contain  a value for DUB.")
}

// Iterate over a Dictionary

for (airportCode, airportName) in airports {
    println("\(airportCode): \(airportName)")
}

for airportCode in airports.keys{
    println("Airport code: \(airportCode)")
}

for airportName in airports.values{
    println("Airport name: \(airportName)")
}


// If you need to use a dictionary's keys or values with anAPI that takes an Array instance, initialize a new array with the keys or values property:

// The order in which keys, values and key-value pairs are retrieved when iterating over a dictionary is not specified.
let airportCodes = [String](airports.keys)

let airportNames = [String](airports.values)

// Creating a empty Dictionary

var nameOfIntegers = [Int:String]()

// If the context already provides type information, you can create an empty dictionary with an empty dictionary literal ,which is written as [:] (a colon inside a pair of square brackets):

nameOfIntegers[16] = "Sixteen"
nameOfIntegers = [:]

// Atype must be hashable in order to be used as a dictionary's key type. All of Swift's basic types (such as String, Int, Double, and Bool) are hashable by default, and all of these types can be used as the keys of a dictionary. Enumeration member values without associated values are also hashable by default.



// You can use your own custom types as dictionary key types by making them conform to the Hashable protocol from Swift's standard library. Types that conform to the Hashable protocol must provide a gettable Int property called hashValue, and must also provide an implementation of the "isequal" operator(==). The value returned by a type's hashValue property is not required to be the same across different executions of the same programs, or in different programs.

