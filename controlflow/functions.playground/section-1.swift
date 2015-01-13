// Playground - noun: a place where people can play

import UIKit


// Swift's unified function syntax is flexible enough to express anything from a simple C-style function with no parameter names to a complex Objective-C style method with local and external parameter names for each parameter. Parameters can provide default values to simplify function calls and can be passed as in-out parameters, which modifiy a passed variable once the function has completed its execution.
// Every function in Swift has a type, consisting of the function's parameter types and return type.

// When you define a function, you can optionally define one or more named, typed values that the function takes as input (known as parameters), and/or a type of value that the unction will pass back as ouput when it is done( known as its return type).

func sayHello (personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

println(sayHello("Anna"))

// * Function Parameters and Return Values

// Function parameters and return values are extremely flexible in Swift. You can define anything from a sinple utility function with a single unnamed paramter to a complex function with expressive parameter names and different parameter options.


// * Multiple Input Parameters

func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}

println(halfOpenRangeLength(1, 10))

func sayHelloWorld() -> String {
    return "Hello, world"
}

println(sayHelloWorld())


// * Without Return Values

func sayGoodBye(personName:String) {
    println("Goodbye, \(personName)")
}

sayGoodBye("Dave")


// Functions without a defined return type return a special value of type Void. This is simply an empty tuple, in effect a tuple with zero elements, which can be written as ().

// Functions with Multiple Return Values
// You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.

func minMax(array:[Int]) -> (min:Int, max:Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}


let bounds = minMax([8, -6, 2, 109, 3, 71])

// Because the tuple's member values are named as part of the function's return type, they can be accessed with dot syntax to retrieve the minimum and maximum found values:
println("in is \(bounds.min) and max is \(bounds.max)")



// * Optional Tuple Return Types
// If the tuple type to be returned from a function has the potential to have "no value" for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil.

// * Function Parameter Names
func someFunction(parameterName: Int){
}


// * External Parameter Names
// If you want users of your function to provide parameter names when they call your function, define an external parameter name for each parameter, in addition to the local parameter name. You write an external parameter name before the local parameter name it supports, separated by a space:

func someFunction( externalParameterName localParameterName: Int) {
    localParameterName
    
}


// If you provide an external parameter name for a parameter, that external name must always be used when you call the function.
someFunction(externalParameterName: 1)



// Consider using external parameter names whenever the purpose of function's arguments would be unclear to someone reading your code for the first time.

// * Shorthand External Parameter Names
// If you want to provide an external parameter name for a function parameter, and the local parameter name is already an appropriate name to use, you do not need to write the same name twice for that parameter. Instead, write the name once, and prefix the name with a hash symbol(#). This tells Swift to use that name as both the local parameter name and the external parameter name.

func containsCharacter(#string:String, #characterToFind: Character) -> Bool {
    for character in string{
        if character == characterToFind {
            return true
        }
    }
    return false
}


let containsAVee = containsCharacter(string: "aardvark", characterToFind:"v")



// * Default Parameter Values
// You can define a default value for any parameter as part of a function's definition. If a default value is defined, you can omit that parameter when calling the function.

// Place parameters with default values at the end of a function's list. This ensures that all calls to the function use the same order for their non-default arguments, and makes it clear that the same function is being called in each case.
func join(string s1: String, toString s2:String, withJoiner joiner:String = " " ) -> String {
    return s1 + joiner + s2
}


join(string:"hello", toString:"world",withJoiner: "-")

join(string: "hello", toString: "world")


// * External Names for Parameters with Default Values
// In ost cases , it is useful to provide (and therefore require) an eternal name for any parameter iwth a default value. This ensures that the argument for that parameter is clear in purpose if a value is provided when the function is called.
// To make this process easier, Swift provides an automatic external name for any parameter that has a default value. The automatic external name is the same as the local name, as if you had written a hash symbol before the local name in your code.

func join(s1:String, s2:String, joiner:String = " " ) -> String {
    return s1 + joiner + s2
}

join("hello","world", joiner: "-" )


// You can opt out of this behavior by writing an underscore(_) instead of an explicit external name when you define the parameter.However, external names for parameters with default values are preferred.

func join(s1:String, s2:String,withJoiner _joiner:String = " ") -> String {
    return s1 + _joiner + s2
}

join("hello", "world",withJoiner: "-")



// * Variadic Parameters
// A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write variadic parameters by inserting three period characters(...) after the parameter's type name.

// The values of a variadic parameter are made available within the function's boody as an array of the appropriate type.


func arithmeticMean(numbers: Double ...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)

arithmeticMean(3, 9.25, 18.75)

// A function may have at most one variadic parameter, and it must always appear last in the parameter list.

// If your function has one or more parameters with a default value, and also has a variadic parameter, place the variadic parameter after all the defaulted parameters at the very end of the list.


// Constant and variable Parameters

// Funcition parameters are constant by default. Trying to chage the value of a function from within the body of that function result in a compile-time error. This means that you can't change the value of a parameter by mistake.

// Variable parameters are available as variables rather than as constants, and give a new modifiable copy of the parameter's value for your function to work with.

func alignRight ( var string: String, count: Int, pad: Character) -> String {
    let amountToPad = count - countElements(string)
    if amountToPad < 1 {
        return string
    }
    
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    
    return string
}


let originalString = "hello"
let paddedString = alignRight(originalString, 10, "-")

originalString



// In-Out parameters
// If you want a function to modify a parameter's value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.

// You write an in-out parameter by placing the inout keyword at the start of its parameter definition. An in-out parameter has a value that is passed in to function, is modified by the function, and is passed back out of the function to replace the original value.

// You can only pass a variable as the argument for an in-out parameter. You can not pass a constant or a literal value as the argument. You place an ampersand ( & ) directly before a variable's name when you pass it as an argument to an inout parameter, to indicate that it can be modified by the function.

func swapTwoInts(inout a:Int, inout b:Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
someInt
anotherInt

// In-out parameters are an alternative way for a function to have an effect outside of the scope of its function body.

// * Function Types

// Every function has a specific function type, made up of the parameter types and the return type of the function.


// (Int, Int) -> Int

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}


// () -> (),return Void, which is equivalent to an empty tuple in Swift.
func printHelloWord() {
    println("Hello, world")
}

// * Using function types
// You use function types just like any other types in Swift. For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable:

var mathFunction: (Int, Int) -> Int = addTwoInts

println("Result: \(mathFunction(2,3)).")

// A different function with the same matching type can be assigned to the same variable, in the same way as for non-function types:
mathFunction = multiplyTwoInts
println("Result: \(mathFunction(2,3))")

// You can leave Swift to infer the function type when you assign a function to a constant or variable:

let anotherMathFunction = addTwoInts



// * Function Types as Parameter Types
// You can use a function type such as (Int, Int) -> Int as a parameter type for another function. This enables you to leave some aspects of a function's implementation for the function's caller to provide when the function is called.
func printMathResult(mathFunction:(Int,Int) -> Int, a: Int, b:Int) {
    println("Result: \(mathFunction(a,b))")
}

printMathResult(addTwoInts, 3, 5)



// * Function Types as Return Types
// You do this by writing a complete function type immediately after the return arrow( -> ) of the returning function.

func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards:Bool ) -> (Int) ->Int {
    return backwards ? stepBackward:stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)


println("Couting to zero:")
while currentValue != 0 {
    println("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}



// * Nested functions
// You can also define function inside the bodies of other functons, known as nested functions.

// Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope.


func chooseStepFunction2(backwards:Bool) -> (Int) -> Int {
    
    func stepForward(input:Int) -> Int {return input + 1 }
    
    func stepBackward(input:Int) -> Int {return input - 1 }
    
    return backwards ? stepBackward :stepForward
        
    
}


var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction2(currentValue > 0)
while currentValue2 != 0 {
    println("\(currentValue2)...")
    currentValue2 = moveNearerToZero2(currentValue2)
}