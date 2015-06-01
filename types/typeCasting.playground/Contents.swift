//: Playground - noun: a place where people can play

import UIKit

// * Type Casting


// Type casting in Swift is implemented with the is and as operators. You can also use type casting to check whether a type conforms to a protocol.

// You can use type casting with a hierarchy of classes and subclasses to check the type of a particular class instance and to cast that instance to another class within the same hierarchy.

class MediaItem {
    var name: String
    init(name:String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name:String, director:String){
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// The type of the library array is inferred by initializing it with the contents of an array literal.

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name:"Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]


// * Checking Type

// Use the type check operator (is) to check whether an instance is of a certain subclass type. The type check operator returns true if the instance is of that subclass type and false if it is not.


var movieCount = 0

var songCount = 0


for item in library {
    if item is Movie {
        ++movieCount
    }else if item is Song{
        ++songCount
    }
}

println("Media library contains \(movieCount) movies and \(songCount) songs.")


// * Downcasting
// A constant or variable of a certain class type may actually refer to an instance of a subclass behind the scenes. Where you believe this is the case, you can try to downcast to the subclass type with a type cast operator (as? or as!).”

// Because downcasting can fail, the type cast operator comes in two different forms. The conditional form, as?, returns an optional value of the type you are trying to downcast to. The forced form, as!, attempts the downcast and force-unwraps the result as a single compound action.

// Use the conditional form of the type cast operator (as?) when you are not sure if the downcast will succeed. This form of the operator will always return an optional value, and the value will be nil if the downcast was not possible. This enables you to check for a successful downcast.

// Use the forced form of the type cast operator (as!) only when you are sure that the downcast will always succeed. This form of the operator will trigger a runtime error if you try to downcast to an incorrect class type.


for item in library {
    if let movie = item as? Movie {
        println("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        println("Movie: \(song.name), by \(song.artist)")
    }
    
}


// * Type Casting for Any and AnyObject

// Swift provides two special type aliases for working with non-specific types:
// AnyObject can represent an instance of any class type.
// Any can represent an instance of any type at all, including function types.


// * AnyObject

// When working with Cocoa APIs, it is common to receive an array with a type of [AnyObject], or “an array of values of any object type”. This is because Objective-C does not have explicitly typed arrays.
// You can use the forced version of the type cast operator (as) to downcast each item in the array to a more specific class type than AnyObject, without the need for optional unwrapping.

let someObjects:[AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name:"Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
    
]

// Because this array is known to contain only Movie instances, you can downcast and unwrap directly to a non-optional Movie with the forced version of the type cast operator (as!):


for object in someObjects {
    let movie = object as! Movie
    println("Movie:'\(movie.name)', dir.\(movie.director)")
}

// For an even shorter form of this loop, downcast the someObjects array to a type of [Movie] instead of downcasting each item:

for movie in someObjects as! [Movie] {
    println("Movie: '\(movie.name), dir.\(movie.director)'")
}


// * Any

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name:String) -> String in "Hello, \(name)"})


// You can use the is and as operator in a switch statement's case to discover the specific type of a constant or variable that is known only to be of type Any or AnyObject.

for thing in things {
    switch thing{
    case 0 as Int:
        println("zero as an Int")
    case 0 as Double:
        println("zero as a Double")
    case let someInt as Int:
        println("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        println("a positive double value of \(someDouble)")
    case is Double:
        println("some other double value that I don't want to print")
    case let someString as String:
        println("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        println("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        println("a movie called '\(movie.name)', dir.\(movie.director)")
    case let stringConverter as String -> String:
        println(stringConverter("Michael"))
    default:
        println("something else")
        
    }
}

// The cases of a switch statement use the forced version of the type cast operator (as, not as?) to check and cast to a specific type. This check is always safe within the context of a switch case statement.



// * Nested Types

// Enumerations are often created to support a specific class or structure’s functionality. Similarly, it can be convenient to define utility classes and structures purely for use within the context of a more complex type. To accomplish this, Swift enables you to define nested types, whereby you nest supporting enumerations, classes, and structures within the definition of the type they support.
// To nest a type within another type, write its definition within the outer braces of the type it supports. Types can be nested to as many levels as are required.


struct BlackjackCard {
    
    
    // nested Suit enumeration
    enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    
    // nested Rank enumeration
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        
        case Jack, Queen, King, Ace
        
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
                
            }
        }
        
    }
    
    // BlackjackCard properties and methods
    let rank: Rank, suit:Suit
    
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        
        if let second = rank.values.second {
            output += " or \(second)"
        }
        
        return output
    }
    
    
}



let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)

println("theAceOfSpades:\(theAceOfSpades.description)")



// * Referring to Nested Types
//To use a nested type outside of its definition context, prefix its name with the name of the type it is nested within:”

let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue


