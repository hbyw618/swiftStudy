// Playground - noun: a place where people can play

import UIKit



// * Assignment Operator

let b = 10
var a = 5
a = b

let (x, y) = (1, 2)


x
y


// * Arithmetic Operators

1 + 2
5 - 3
2 * 3
10.0 / 2.5


// * Reminder Operator

9 % 4
-9 % 4
8 % 2.5

// Increment and Decrement Operators

var i = 0
++i

var a2 = 0
let b2 = ++a2

let c  = a2++


// * Unary Minus Operator

let three = 3
let minusThree = -three
let plusTree = -minusThree

// * Unary Plus Operator
let minusSix = -6
let alsoMinusSix = +minusThree // alsoMinusSix equals -6



// Nil coalescing Operator

// The nil coalescing operator unwraps an optioanl a if it contains a value, or returns a default value b if a is nil.

// is shorthand for the code below: a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName:String? //defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName


// * Range Operators

// Closed range operator(a...b) defines a range that runs from a to b, and includes the values a and b.
for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}

// The half-open range operator(a..< b) defines a range that runs from a to b, but does not include b.

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    println("Person \(i+1) is called \(names[i])")
}

// * Logical Operators (ignored)

