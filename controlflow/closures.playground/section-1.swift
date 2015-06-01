// Playground - noun: a place where people can play

import UIKit

// Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to to lambdas in other programming languages.

// Closures can capture and store references to any constant and variables from the context in which they are defined.This is known as closing over those constants and variables, hence the name "closures". Swift handles all of the memory management of capturing for you.

// Global and nested functions, as introduced in Functions, are actually special cases of closures. Closures take one of three forms:
// 1. Global functions are closures that have a name and do not capture any values.
// 2. Nested functions are closures that have a name and can capture values from their enclosing function.
// 3. Closure expressions are unamed closures written in a lightwright syntax that can capture values from their surrounding context.

// Swift's closure expressions have a clean, clear style, with optimizations that encourage brief, clutter-free syntax in common scenarios. These optimizations include:
// 1. Inferring parameter and return value types from context
// 2. Implicit returns from single-expression closures
// 3. Shorthand argument names
// 4. Trailing closure syntax

// * Closure expression

/*

{ ( parameters ) -> return type in

statements


}

Closure expression syntax can use constant parameters, variable parameters, and inout parameters. Default values cannot be provided. Variadic parameters can be used if you name the variadic parameter and place it last in the parameter list. Tuples can also be used as parameter types and return types.

*/
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

var reversed = sorted(names, backwards)

reversed = sorted(names, {(s1:String, s2:String) -> Bool in

    return s1 > s2
})


// * Inferring Type From Context
// Because the sorting closure is passed as an argument to a function, Swift can infer the types of its parameters and the type of the value it returns from the type of the sorted function's second parameter. This parameter is expecting a function of type (String, String ) -> Bool. This means that the (String, String) and Bool types do not need to be written as part of the closure expression's definition. Because all of the type can be inferred, the return arrow ( -> ) and the parentheses around the names of the parameters can also be omitted:


reversed = sorted(names, {s1, s2 in return s1 > s2})

// It is always possible to infer the parameter types and return type when passing a closure to a function as an inline closure expression. As a result, you never need to write an inline closure in its fullest form when the closure is used as a function argument.


// * Implicit Returns from Single-Expression Closures

// Single-expression closures can implicitly return the result of their single expression by omitting the return keyword from their declaration.

var ascend = sorted(names,{ s1, s2 in (s1 < s2)})



// * Shorthand Argument Names
// Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure's arguments by the names $0, $1, $2, and so on. You can omit the closure's argument list from its definition, and the number and type of the shorthand argument names will be inferred from the expected function type. The in keyword can also be omitted, because the closure expression is made up entirely of its body:

// The official code does not work, we need convert the $0 to remove the ambiguous error.
// reversed = sorted(names, {$0 as String  > $1})

// In new Xcode it works now
reversed = sorted(names, {$0  > $1})


// * Operator Functions
// There's actually an even shorter way to write the closure expression above. Swift's String type defines its string-specific  implementation of the greater-than ( > ) as a function that has two parameters of type String, and returns a value of type Bool. This exactly matches the function type needed for the sorted function's second parameter. Therefore, you can simply pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation:

reversed = sorted(names, >)

// * Trailing Closures
// If you need to pass a closure expression to a function as the function's final argument and the closure expression is long, it can be useful to write it as a trailing closure instead. A trailing closure is a closure expression that is written outside of (and after) the parentheses of the function call it supports:



func someFunctionThatTakesAClosure(closure: () -> () ){
    // function body goes here.
}

// Here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure({
})

// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure(){
    
}



// If a closure expression is provided as the function's only argument and you provide that expression as a trailing closure, you do not need to write a pair of paraentheses() after the function's name when you call the function.

someFunctionThatTakesAClosure{
    
}

reversed = sorted(names){
    return $0 > $1
}



let digitNames = [0:"Zero", 1:"One", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6: "Six", 7:"Seven", 8: "Eight", 9:"Nine"]

let numbers = [16, 58, 510]

let strings = numbers.map{
    (var number)-> String in
    var output = ""
    while number > 0{
        output = digitNames[number % 10]! + output
        number/=10
    }
    
    return output

}


strings



// * Capturing Values
// A closure can capture constants and variables from the surrounding context in which it is defined. The closure can then refer to and modify the values of those constants and variables from within its body, even if the original scope that defined the constants and variables no loger exists.

// In Swift, the simplest form of a closure that can capture values is a nested function, written within the body of another function. A nested function can capture any of its outer function's arguments and can also capture any constants and variables defined within the outer function.


func makeIncrementor(forIncrement amount:Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        // refers to runningTotal and amount parameter.Capturing the existing values of runningTotal and amount from its surrounding fuction and using them within its own function body.
        
        // Swift determines what should be captured by reference and what should be copied by value, and handles all memory management involved in disposing of runningTotal when it is no longer needed by the increment function.
        
        // Because it does not modify amount, incrementor actually captures and stores a copy of the value stored in amount. This value stores along with the new increment function.Because it modifies the runningTotal variable each time it is called, incrementor captures a reference to the current runningTotal variable, and not just a copy of its initial value. Capturing a reference ensures that runningTotal does not disappear when the call to makeIncrementor ends, and ensures that runningTotal will continue to be available the next time that the incrementor function is called.
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}


let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
println(incrementByTen())

let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()
incrementBySeven()
incrementBySeven()
println(incrementBySeven())



// Note: If you assign a closure to a property of a class instance, and the closure captures that instance by referring to the instance or its members, you will create a strong reference cycle between the closure and the instance. Swift uses capture lists to break these strong reference cycles.


// * Closures Are Reference Types.

// Whenever you assign a function or a closure to a constant or a variable, you are actually setting that constant or variable to be a reference to the function or closure.This also means that if you assign a closure to two different constant or variables, both of those constants or variables will refer to the same closure.
