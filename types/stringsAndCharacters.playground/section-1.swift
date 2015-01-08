// Playground - noun: a place where people can play

import UIKit

// A string is an orderd collection of characters. Every string is composed of encoding-independent Unicode characters, and provides support of accessing those characters in various Unicode representations. 

// Swift's String type is bridged seamlessly to Foundation's NSString class. the entire NSString API is available to call on any String value you create. You can also use a String value with any API that requires an NSString instance.


let someString = "Some string literal value"
var emptyString = ""
var anotherEmptyString = String()

anotherEmptyString.isEmpty

if emptyString.isEmpty{
    println("Nothing to see here")
}


// * String Mutability

// You indicate whether a particular String can be modified(or mutated) by assigning it to a variable or a constant

var variableString = "Horse"
variableString += " and carriage"

/*
below is an error:

let constantString = "Highlander"
constantString += " and another Highlander"
*/

// Swift's String type is a value type. the String value is copied when it is passed to a function or method, or when it is assigned to a constant or variable.


// Swift's String type represents a collection of Character values in a specified order.


for character in "dog" {
    print(character)
}



// Create a stand-alone Character constant or variable from a single-character string literal

let yenSign:Character = "$"


let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)



// * Unicode Scalars
// Swift's native String type is built from Unicode scalar values. A Unicode scalar is unique 21-bit number for a character or modifier.

// A Unicode scalar is any Unicode code point in the range U+0000 to U+D7FF inclusive or U+E000 to U+10FFFF inclusive. Unicode scalars do not include the Unicode surrogate par code points, which are the code points in the range U+D800 to U+DFFF inclusive.


let wiseWord = "\"Imagination is more important than knowledge\" - Einstein"

let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "u{1F496}"
