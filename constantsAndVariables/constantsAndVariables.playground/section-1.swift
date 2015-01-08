// Playground - noun: a place where people can play

import UIKit


// value of constant cannot be changed once it set, whereas a variable can be set to a different value in the future.


// * Declaring Constant and Variables

// Declare constants with the let keyword
let maximumNumberOfLoginAttempts = 10
// Declare variables with the var keyword
var currentLoginAttempt = 0

// Declare multiple constants or variables on a single line.

var x = 0.0, y = 0.0, z = 0.0



// * Type Annotation

var welcomeMessage: String


// define multiple relatd variables of the same type on a single line, separated by commas.
var red,green,blue:Double


// If you provide an initial value for a constant or variable at the point that it is defined, Swift can always infer the type to be used for that constant or variable.

// Constant and variable names can contain almost any characters, including Unicode characters:

let 你好 = "你好世界"

// Invalid characters: white space/ mathematical symbols/ private-use Unicode code points/ line- and box-drawing characters.
// Can not begin with a number.
// If you need to name a variable with same name as reserved keyword, surround the keyword with back ticks(`) when using it as a name.


// * Printing Constants and Variables

var friendlyWelcome = "Hello"

println(friendlyWelcome)


// Swift uses string interpolation to include the name of a constant or variable as a placeholder in a longer string, and to prompt Swift to replace it with the current value of that constant or variable. Wrap the name in parentheses and excape it with a backslash before the opening parenthesis:

println("The current value of friendlyWelcome is \(friendlyWelcome)!")


// * Comments


// this is a comment

/* 
this is also a comment,
but written over multiple lines
*/

/*
this is the start of the first multiline comment,
/*this is the second, nested multiline comment*/
this is the end of the first multiline comment
*/



// * Semicolons

// Swift does not require you to write a semicolon after each statement, although you can do so if you wish. Semicolons are required if you want to write multiple separate statements on a single line.

let cat = "cat"; println(cat)

// * Integers

// Integers are whole numbers with no fractional component

// Access the minimum and maximum values of each integer type with its min and max properties

let minValue = UInt8.min // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max // maxValue is equal to 255, and is of type UInt8



// Swift provides an Int type

// On 32-bit platform, Int is the same size as Int32.
// On 64-bit platform, Int is the same size as Int64.


// UInt

// Swift also provides an unsigned integer type, UInt, which has the same size as the current platform's native word size:

// On a 32-bit platform, UInt is the same size as UInt32.
// On a 64-bit platform, UInt is the same size as UInt64.

// Double represents a 64-bit floating-point number, has a precision of at leat 15 decimal digits, always choosed when type inference.
// Float represents a 32-bit floating-point number, the precision as title as 6 decimal digits.


// * Type Safety and Type Inference.

// Type inference enables a compiler to deduce the type of particular expression automatically when it compiles your code.

let meaningOfLife = 42

let pi = 3.14159
// pi is infered to be of type Double

let anotherPi = 3 + 0.14159
// another pi is also interred to be of type Double




// * Numeric Literals

// Integer literals can be written as:
/*
# A decimal number, with no prefix
# A binary number, with a 0b prefix
# A octal number, with a 0o prefix
# A hexadecimal number, with a 0x prefix
*/

// all those declaration is number 17
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11



// For decimal Numbers with an exponent of exp, the base number is multiplied by 10 ** exp

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1

// For hexadecimal numbers with an exponent of exp, the base number is multiplied by 2 ** exp
let hexadecimalDouble = 0xC.3p0

// padding with extra zeroes and can contain underscores to help with readability.
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


// * Nummeric Type Conversion
// Integer Conversion
// Int8 :-128 ~ 127
// Uint8: 0 ~ 255
// A number that will not fit into a constant or variable of a sized integer type is reported as an error.

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1


// You must opt in to numeric type conversion on a case-by-case basis.
let twoThousand:UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


// SomeType(ofInitialValue) is the default way to call the initailizer of a Swift type and pass in an initial value.



// * Integer and Floating-Point Conversion

// Conversions between integer and floating point numberic types must be explicit:


let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine


let piInteger:Int = Int(pi2)



// * Type Aliases

// Type aliases define an alternative name for an existing type.

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0

// * Booleans

let orangesAreOrange = true
let turnipsAreDelicious = false


if turnipsAreDelicious {
    println("Mmm, tasty turnips!")
}else{
    println("Eww, turnips are horrible.")
}

// Swift's type safety prevents non-Boolean values from being substituted for Bool.

/*
let i = 1
if i {
    // this example will not compile and will report an error
}
*/


let i = 1
if i == 1{
    // This example will compile successfully
}


// * Tunples
// Tuples group multiple values into a single compound value. The values within a tuple can be any type and do not have to be of the same type of each other.

let http404Error = (404, "Not Found")


// You can decompose a tuple's contents into separate constants or variables.

let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")
println("The status message is \(statusMessage)")


// if you only need some of the tuple's values ignore parts of tuple with an undersocre(_) when you decompose the tuple.

let (justTheStatusCode, _) = http404Error
println("The status code is \(justTheStatusCode)")

// Access the individual element values using index starting at zero:
println("The status code is \(http404Error.0)")
println("The status message is \(http404Error.1)")

// You can name the individual elements in a tuple when the tuple is defined:
let http200Status = (statusCode: 200, description:"OK")

println("The status code is \(http200Status.statusCode)")
println("The status message is \(http200Status.description)")



// * Optionals

let possibleNumber = "123"
let convertedNumber = possibleNumber.toInt()
// convertedNumber is inferred to be of type "Int?" or "optional Int". The question mark indicates that the value it contains is optional.


// * nil

// You set an optinal variable to valueless state by assigning it the special value nil:

var serverResponseCode:Int? = 404
serverResponseCode = nil
// nil cannot be used with nonoptional values.If you defined an optional constant or variable without providing a default value, the constant or variable is automatically set to nil for you.

var surveyAnswer:String?

// In Objective-C, nil is a pointer to nonexistent object.In Swift, nil is a pointer-- it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.


// * If Statement and Forced Unwrapping.

// test optionals
if convertedNumber != nil {
    println("convertedNumber contains some integer value.")
}

// Once you're sure that the optional does contain a value, you can access its underlying value by adding an exclamation mask(!) to the end of the optional's name.

if convertedNumber != nil {
    println("convertedNumber has an integer value of \(convertedNumber).")
}

// * Optional Binding
// Use optional binding to find out whether an optianl contains a value, and if so, to make that value available as a temporary constant or variable. Optional binding can be used with if and while statements to check for a value inside an optional, and to extract that value into a constant or variable, as part of a single action.

if let actualNumber = possibleNumber.toInt(){
    // You can use both constants and variables with optional binding.
    
    // If the conversion is successful, the actualNumber constant becomes available for use within the first branch of the if statement, It already been initialized with the value contained within the optional, and so there is no need to use the ! suffix to access its value.
    println("\(possibleNumber) has an integer value of \(actualNumber).")
}else{
    println("\(possibleNumber) cound not be converted to an integer.")
}


// * Implicitly Unwrapped Optionals
// Your write an implicitly unwrapped optional by placing an exclamation mark(String!) rather than a question mark(String?) after the type that you want to make optional.
// An implicitly unwrapped optional is a normal optional behind the scenes, but can also be used like a nonoptional value, without the need to unwrap the optional value each time it is accessed.


let possibleString:String? = "An optional String."
let forceString:String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString:String = assumedString //no need for an exclamation mark

// You can think of an implicitly unwrapped optional as giving permission for the optional to be unwrapped automatically when ever it is used.
// If you try to access an implicitly unwrapped optional when it does not contain a value, you will trigger a runtime error.

// You can still treat an implicitly unwrapped optional like a normal optional, to check if it contains a value:

if assumedString != nil {
    println(assumedString)
}


// You can also use an implicitly unwrapped optional with optional binding, to check and unwrap its value in a single statement:
if let definiteString = assumedString{
    println(definiteString)
}




// * Assertions

// You can trigger an assertion in your code to end code execution and to provide an opportunity to debug the cause of the absent or invalid value.

// If the condition evaluates to false, code execution ends, and your app is terminated.
let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")
//assert(age >= 0)

