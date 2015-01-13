// Playground - noun: a place where people can play

import UIKit


// Swift provides two kinds of loop that perform a set of statements a certain number of times:
// 1. The for-in loop performs a set of statements for each item in a range, sequence, collection, or progression.
// 2. The for loop performs a set of statements until a specific condition is met, typically by incrementing a counter each time the loop ends.


// * For loops

for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}

// If you don't need each value from the range, you can ignore the values by using an underscore in place of a variable name:

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}

println("\(base) to the power of \(power) is \(answer)")

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    println("Hello, \(name)")
}

let numberOfLegs = ["spider":8, "ant":6, "cat": 4]

for (animalName,legCount) in numberOfLegs {
    println("\(animalName)s have \(legCount) legs")
}

for character in "Hello" {
    println(character)
}


// Swift supports traditional C -style for loops and doesnt need parentheses around the entire "initialization; condition; increment" block

for var index = 0; index < 3; ++index {
    println("index is \(index)")
}


// * While Loops
let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue:0)

board[03] = +8; board[06] = +11; board[09] = +09; board[10] = +02;
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08;

var square = 0
var diceRoll = 0

while square < finalSquare {
    // roll the dice
    if ++diceRoll == 7 { diceRoll = 1}
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}

println("Game over")


// * Conditional Statements
// Swift provides two ways to add conditional branches to your code, known as the if statement and the switch statement.
var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else {
    println("It's not that cold. Wear a t-shirt.")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    println("It's very code. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86{
    println("It's really warm. Don't forget to wear sunscreen.")
} else {
    println("It's not that cold. Wear a t-shirt")
}


// * Swich

// Every switch statement must be exhaustive. That is, every possible value of the type being considered must be matched by one of the switch cases. If it is not appropriate to provide a switch case for every possible value, you can define a default catch-all case to cover any values that are not addressed explicitly. This catch-all case is indicated by the keyword default, and must always appear last.

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    println("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    println("\(someCharacter) is a consonant")
default:
    println("\(someCharacter) is not a vowel or a consonant")
}


// switch statements in Swift do not fall through the bottom of each case and into the next one by default.

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a":
    // if no break, it will report a runtime error.
    break
    
case "A" :
    println("The letter A")
default:
    println("Not the letter A")
}

// Multiple matches for a single switch case can be separated by commas, and can be written over multiple lines if the list is long:
switch anotherCharacter{
case "a","A":
    println("The character is A or a.")
default:
    println("The character is not A or a.")
}


// *  Range matching
// Values in switch can be checked for their inclusion in a range.

let count = 3_000_000_000_000

let countedThings = "stars in the Milky Way"
var naturalCount: String

switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...10:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of"
case 1000...999_999:
    naturalCount = "thousands of"
default:
    naturalCount = "millions and millions of"
}

println("There are  \(naturalCount) \(countedThings).")

// * Tuples
// You can use tuples to test multiple values in the same wtich statement. Each element of the tuple can be tested against a different value or range of values. Alternatively, use the underscore(_) identifier to match any possible value.


let somePoint = (1,1)
switch somePoint {
case (0, 0):
    println("(0, 0) is at the origin")
case (_, 0):
    println("(\(somePoint.0), 0) is on the x-axis" )
case (0,_):
    println("(0, \(0,somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    println("(\(somePoint.0), \(somePoint.1)) is inside the box.")
default:
    println("(\(somePoint.0), \(somePoint.1)) is outside the box.")
}

// * Value Bindings
// A switch case can bind the value or values it matches to temporary constants or variables.
let anotherPoint = (2, 0)
switch anotherPoint {
    
    // Use let keyword, but they could have been declared as variables instead, with the var keyword.
case( let x, 0):
    println("on the x-axis with an x value of \(x)")
case (0, let y):
    println("on the y-axis with a y value of \(y)")
    // Note that this switch statement does not have a default case. The final case, case let(x, y) declares a tuple of two placeholder constants that can match any value. As a result, it matches all possible remaining values, and a default case is not needed to make the switch statement exhausive.
case (let (x,y)):
    println("somewhere else at (\(x), \(y))")
}


// * Where
// A switch case can use a where clause to check for additional conditions.

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
    // These constants are used as part of a where clause, to create a dynamic filter.
case let (x, y ) where x == y:
    println("(\(x), \(y)) is on the line x == y")
case let (x, y ) where x == -y:
    println("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    println("(\(x), \(y)) is just some arbitrary point")
}


// * Control transfer Statements

// * Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}

println(puzzleOutput)


// * break
let numberSymbol: Character = "三"

var possibleIntegerValue: Int?

switch numberSymbol {
case "1", "一":
    possibleIntegerValue = 1
case "2","二":
    possibleIntegerValue = 2
case "3", "三":
    possibleIntegerValue = 3
case "4", "四":
    possibleIntegerValue = 4
default:
    break
}


if let integerValue = possibleIntegerValue {
    println("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    println("An integer value could not be found for \(numberSymbol).")
}


// Fallthrough
// Swift switch statements are much more concise and predictable than their counterparts in C, and thus they avoid executing multiple switch cases by mistake. You can opt in to this behavior on a case by case basis with the fallthrough keyword.

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " aprime number, and also"
    fallthrough
default:
    description += " an integer."
}
println(description)


// * Labeled Statement
// It is sometimes useful to be explicit about which loop or switch statement you want a break statement to terminate. You can mark a loop statement or switch statement with a statement label, and use this label with the break statement or continue statement to end or continue the executioin of the labeled statement.


let finalSquare2 = 25
var board2 = [Int](count: finalSquare + 1, repeatedValue: 0)
board2[03] = +08; board2[06] = +11; board2[09] = +09; board2[10] = +02
board2[14] = -10; board2[19] = -11; board2[22] = -92; board2[24] = -08

var square2 = 0
var diceRoll2 = 0

gameLoop: while square2 != finalSquare2 {
    if ++diceRoll2 == 7 { diceRoll2 = 1 }
    switch square2 + diceRoll2 {
    case finalSquare2:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare2:
        //diceRoll will move us beyoond the final square, so roll again
        continue gameLoop
    default:
        //this is a valid move, so find out its effect
        square2 += diceRoll2
        square2 += board2[square2]
    }
}

println("Game over!")
