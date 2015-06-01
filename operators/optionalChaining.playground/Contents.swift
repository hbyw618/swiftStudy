//: Playground - noun: a place where people can play

import UIKit


// * Optional Chaining

/*Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil. If the optional contains a value, the property, method, or subscript call succeeds; if the optional is nil, the property, method, or subscript call returns nil. Multiple queries can be chained together, and the entire chain fails gracefully if any link in the chain is nil.
Optional chaining in Swift is similar to messaging nil in Objective-C, but in a way that works for any type, and that can be checked for success or failure.


* Optional Chaining as an Alternative to Forced Unwrapping

You specify optional chaining by placing a question mark (?) after the optional value on which you wish to call a property, method or subscript if the optional is non-nil. This is very similar to placing an exclamation mark (!) after an optional value to force the unwrapping of its value. The main difference is that optional chaining fails gracefully when the optional is nil, whereas forced unwrapping triggers a runtime error when the optional is nil.

To reflect the fact that optional chaining can be called on a nil value, the result of an optional chaining call is always an optional value, even if the property, method, or subscript you are querying returns a non-optional value. You can use this optional return value to check whether the optional chaining call was successful (the returned optional contains a value), or did not succeed due to a nil value in the chain (the returned optional value is nil).

Specifically, the result of an optional chaining call is of the same type as the expected return value, but wrapped in an optional.
*/

class Person3 {
    var residence: Residence3?
    
}

class Residence3 {
    var numberOfRooms = 1
}


let john3 = Person3()

// optional Unwrapping cause error when chaining access
// let roomCount = john.residence!.numberOfRooms
if let rootCount = john3.residence?.numberOfRooms {
    println("Jone's residence has \(rootCount) room(s)")
}else{
    println("Unable to retrieve the number of rooms.")
}

john3.residence = Residence3()
if let rootCount = john3.residence?.numberOfRooms {
    println("Jone's residence has \(rootCount) room(s)")
}else{
    println("Unable to retrieve the number of rooms.")
}




// * Defining Model Classes for Optional Chaining
// You can use optional chaining with calls to properties, methods, and subscripts that are more than one level deep. This enables you to drill down into subproperties within complex models of interrelated types, and to check whether it is possible to access properties, methods, and subscripts on those subproperties.

class Person4 {
    var residence: Residence4?
}


class Residence4 {
    var rooms = [Room4?](count: 16, repeatedValue: nil)
    var numberOfRooms:Int {
        return rooms.count
    }
    
    subscript( i : Int ) -> Room4? {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        println("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address4?
}

class Room4 {
    
    let name:String
    init(name:String) {
        self.name = name
    }
    
}

class Address4 {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
            
        }
    }
}


let john4 = Person4()

if let roomCount =  john4.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}




let someAddress = Address4()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"

// This will safely fail because the residence is null
john4.residence?.address = someAddress



if let someAddress = john4.residence?.address?.street {
    println("\(someAddress)")
}

john4.residence = Residence4()

john4.residence?.address = someAddress


// Now it works and returns the street name.
if let someAddress = john4.residence?.address?.street {
    println("\(someAddress)")
}

// * “Calling Methods Through Optional Chaining
// You can use optional chaining to call a method on an optional value, and to check whether that method call is successful. You can do this even if that method does not define a return value.
// functions and methods with no return type have an implicit return type of Void.
// If you call this method on an optional value with optional chaining, the method’s return type will be Void?, not Void, because return values are always of an optional type when called through optional chaining.

if john4.residence?.printNumberOfRooms() != nil {
    println("It was possible to print the number of rooms.")
} else {
    println("It was not possible to print the number of rooms.")
}


// Any attempt to set a property through optional chaining returns a value of type Void?, which enables you to compare against nil to see if the property was set successfully:”

if (john4.residence?.address = someAddress) != nil {
    println("It was possible to set the address.")
} else {
    println("It was not possible to set the address.")
}


// * Accessing Subscripts Through Optional Chaining
// You can use optional chaining to try to retrieve and set a value from a subscript on an optional value, and to check whether that subscript call is successful.”


// When you access a subscript on an optional value through optional chaining, you place the question mark before the subscript’s braces, not after. The optional chaining question mark always follows immediately after the part of the expression that is optional.”


var rooms = [Room4?](count: 16, repeatedValue: nil)
rooms.count
rooms.append(Room4(name: "x"))

rooms.count


rooms[0]=nil
rooms[0]

john4.residence?[0] = Room4(name: "Bathroom")
var a = 0

if let firstRoomName = john4.residence?[0]?.name {
    println("The first room name is \(firstRoomName).")
} else {
    println("Unable to retrieve the first room name.")
}

var testScores = ["Dave":[86, 82, 84], "Bev":[79, 94, 81]]

testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72

testScores




// * Linking Multiple Levels of Chaining”
// If the type you are trying to retrieve is not optional, it will become optional because of the optional chaining.
// If the type you are trying to retrieve is already optional, it will not become more optional because of the chaining.”

if let johnStreet = john4.residence?.address?.street{
    println("John's street name is \(johnStreet)")
} else {
    println("Unable to retrieve the address.")
}



// * Chaining on Methods with Optional Return Values

// You can also use optional chaining to call a method that returns a value of optional type, and to chain on that method’s return value if needed.

if let buildingIdentifier = john4.residence?.address?.buildingIdentifier() {
    println("John's building identifier is \(buildingIdentifier)")
}


if let beginsWithThe = john4.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        println("John's building identifier begins with \"The\"")
    } else {
        println("John's building identifier does not begins with \"The\"")
    }
}
