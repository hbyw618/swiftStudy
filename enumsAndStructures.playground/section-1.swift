// Playground - noun: a place where people can play

import UIKit


//Use enum to create an enumeration, enumeration can have methods associated with them.
enum Rank: Int{
    case Ace = 1
    case Two, Three, Five, Six, Seven,Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String{
        switch self{
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "King"
        default:
            return String(self.rawValue)
        }
    }
    
    
}


let ace = Rank.Ace

let aceRawValue = ace.rawValue


//Use the init?(rawValue:)initializer to make an instance of an enumeratioin from a raw value
if let convertedRank = Rank(rawValue: 3){
    let threeDescription = convertedRank.simpleDescription()
}

// The member values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn't a meaningful raw value, you don't have to provide one.

enum Suit{
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() ->String{
        switch self{
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}


let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()


// Notice the two ways that the Hearts member of the enumeration is referred to above: When assigning a value to the hearts constant, the enumeration member Suit.Hearts is referred to by its full name because the constant doesn't have an explicit type specified. Inside the switch, the enumeration member is referred to by the abbreviated form .Hearts because the value of self is already know to be a suit. You can use the abbreviated from anytime the value's type is already known.


// Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.

struct Card{
    var rank: Rank
    var suit:Suit
    func simpleDescription() ->String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank:.Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// An instance of an enumeration member can have values associated with the instance.Associated values and raw values are different: The raw value of the enumeration is the same for all of its instances, and you provide the raw value when you define the enumeration.



enum ServerResponse{
    case Result(String,String)
    case Error(String)
}

let success = ServerResponse.Result("6.00 am", "8:09 pm" )
let failure = ServerResponse.Error("Out of cheese.")


var serverResponse:String?



switch success{
case let .Result(sunrise, sunset):
    serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    serverResponse = "Failure... \(error)"
}

serverResponse!






