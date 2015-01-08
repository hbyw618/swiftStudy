// Playground - noun: a place where people can play

import UIKit

// Write a name inside angle brackets to make a generic function or type

class Item{
    
}

func repeat<Item>(item:Item, times:Int) -> [Item]{
    var result = [Item]()
    for i in 0..<times  {
        result.append(item)
    }
    return result
}

repeat("knock",4)



// You can make generic forms of functions and methods, as well as classes, enumerations, and structures.

enum OptionalValue<T> {
    case None
    case Some(T)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)


// Use where after the type name to specify a list of requirements.

func anyCommonElements <T, U where T:SequenceType, U:SequenceType, T.Generator.Element:Equatable, T.Generator.Element == U.Generator.Element> (lhs:T, rhs:U) -> Bool{
    for lhsItem in lhs{
        for rhsItem in rhs{
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1, 2, 3], [3])

// In the simple cases, you can omit where and simply write the protocol or class name after a colon, Writing < T:Equatable> is the same as writing <T where T:Equatable>.



