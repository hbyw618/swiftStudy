// Playground - noun: a place where people can play

import UIKit


// Use func to declare a function
func greet(name:String, day:String) -> String{
    return "Hello \(name), today is \(day)."
}

greet("bob", "Tuesday")

//Use a tuple to make a compound value

func calculateStatistics(scores:[Int]) -> (min:Int,max:Int,sum:Int){
var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max{
            max = score
        } else  if score < min{
            min = score
        }
        
        sum += score
    }
    
    return (min,max, sum)
    
}


var statistics = calculateStatistics([5,3, 100, 3, 0])


// elements of tuple can be reffered to either by name or by number.
statistics.sum
statistics.2


// functions can also take a variable number of arguments, collecting them into an array.

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers
    {
        sum += number
    }
    
    return sum
}

sumOf()
sumOf(42,597,12)


//functions can be nested. Nested functions have access to variables that were declared in the outer function.

func returnFifteen() -> Int{
    var y = 10
    func add() {
        y+=5
    }
    
    add()
    return y
}

returnFifteen()


// Functions are a first-class type.This means that a function can return another function as its value.

func makeIncrement() -> (Int -> Int){
    func addOne(number:Int) -> Int{
        return 1 + number
    }
    return addOne
}


var increment = makeIncrement()
increment(7)



// Functions can take another function as one of its arguments.

func hasAnyMatches(list:[Int], condition:Int->Bool)->Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}


func lessThanTen(number:Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)



//Functions are actually a special case of closures:The code of a closure has access to things like variables and functions that were available in the scope where the closure was created,even if the closure is in a different scope when it is executed.

// You can write a closure without a name by surrounding code with braces({}).Use in to separate the arguemnts and return type from the body.

var numerMap = numbers.map({
    (number:Int)->Int in
    let result = 3 * number
    return result

})

numerMap


// You have several options for writing closures more concisely. When a closure's type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.

let mappedNumbers = numbers.map({number in 3 * number })

mappedNumbers


// You can refer to parameters by number instead of by name. A closure passed as the last argument to a function can appear immediately after the parentheses.


let sortedNumbers = sorted(numbers){$0>$1}
sortedNumbers



