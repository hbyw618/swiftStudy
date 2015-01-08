// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

println("Hello,world!")

var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

// Values are never implicitly converted to another types.

let label = "The width is "
let width = 94
let widthLabel = label + String(width)


// Simpler way to include values in strings: Write the value in parentheses, and write a backslash(\)before the parentheses.

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// Arrays and dictionaries

var shoppingList = ["catfish","water","tulips", "bluepaint"]
shoppingList[1] = "bottle of water"


println(shoppingList)

var occupations = [
    "Malcolm":"Captain",
    "Kaylee": "Mechanic",
]

shoppingList = []
//
occupations = [:]


// Switchs

let individualScores = [75,43,103,87,12]

var teamScore = 0
for score in individualScores{
    if (score > 50 ) {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

teamScore

// optinonal values

var optionalString: String? = "Hello"
optionalString = nil

var optionalName:String? = "John Appleseed"
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello, \(name)"
}


// Swiches supports any kind of data and a wide variety of comparison operations

let vegetable = "red papper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
    // no explicit break out,the statements will go out the scope.
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes in soup."
}


// Iterate a dictionary

let interestingNumbers = [
    "Prime":[2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Square":[1,4,9,16,25],
]

var largest = 0
for(kind,numbers) in interestingNumbers{
    
    for number in numbers{
        if number > largest{
            largest = number
        }
    }
    
}


largest


// While loop

var n = 2
while n < 100 {
    n = n * 2
}

n

var m = 2
do {
    m = m * 2
} while m < 100

m


// Keep an index in a loop--either by using ..< to make a range of indexes or by writing an explicit initialization, condition, and increment.

var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}

firstForLoop

var secondForLoop = 0

for var i=0; i < 4; i++ {
    secondForLoop += i
}

secondForLoop


//Use ..< to make a range that omits its upper value, and use ... to make a range that includes both values.


















