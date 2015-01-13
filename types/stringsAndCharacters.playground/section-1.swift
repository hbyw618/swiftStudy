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


// * Every instance of Swift's Character type represents a single grapheme cluster. A extended grapheme cluster is a sequence of one or more Unicode scalars that ( when combined) produce a single human-readable character.
let eAcute: Character = "\u{E9}" //"é"
let combiner:Character = "\u{301}" //"́"
let combinedEAcute: Character = "\u{65}\u{301}"

// Extended grapheme cluster are a flexible way to represent many complex script character as a single Character value.

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"


// Extended grapheme clusters enable scalars for enclosing marks( suck as COMBINING ENCLOSING CIRCLE, or U+20DD) to enclose other Unicode scalars as part of a single Character value.
let enclosedEacute: Character = "\u{E9}\u{20DD}"


// Unicode scalars for regional indicator symbols can be combined in pairs to make a single Character value, such as this combination of REGIONAL INDICATOR SYMBOL LETTER U(U+1F1FA) and REGIONAL INDICATOR SYMBOL LETTER S(U+1F1F8):

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"



// * Counting Characters

// To retrieve a count of the Character values in a string,call the global countElements function and pass in a string as the function's sole parameter:
let unusualMenagerie = "Koala, Snail, Penguin, Dromedary"
println("unusualMenagerie has \(countElements(unusualMenagerie)) characters")


// Note that Swift's use of extended grapheme cluster for Character values means that string concatenation and modification may not always affect a string's character count.


var word  = "cafe"

println("the number of characters in \(word) is \(countElements(word))")

word += "\u{301}" // COMBINING ACUTE ACCENT, U+0301

println("The number of characters in\(word) is \(countElements(word))")

// The number of characters in a string cannot be calculated without iterating through the string to determine its extended grapheme cluster boundaries.
// Note also that the character count returned by countElements is not always the same as the length property of an NSString that contains the same characters. The length of an NSString is based on the number of 16-bit code units within the string's UTF-16 representation and not the number of Unicode extended grapheme clusters within the string. To reflect this fact, the length property from NSString is called utf16Count when it is accessed on a Swift String value.

// * Comparing Strings

// * String and Character Euquality

// String and character equality is checked with the "equal to " operator(==) and the "not equal to" operator(!=)

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."

if quotation == sameQuotation {
    println("These, two strings are considered equal")
}

// Two string values( or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent.Extended grapheme clusters are canonically equivalent if they have the same liguistic meaning and appearance, even if they are composed from different Uincode scalars behind the scenes.

let eAuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAuteQuestion == combinedEAcuteQuestion{
    println("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA{
    println("These two character are not equivalent")
}


let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1"){
        ++act1SceneCount
    }
}



var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet{
    if scene.hasSuffix("mansion"){
        ++mansionCount
    }else if scene.hasSuffix("cell"){
        ++cellCount
    }
    
}


// * Unicode Representations of Strings
