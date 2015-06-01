// Playground - noun: a place where people can play

import UIKit


// * Classes and Structures

// Classes and structures are general-purpose, flelxible constructs that become the building blocks of your program's code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.

// Swift does not require you to create separate interface and implementation files for custom classes and structures. In Swift, you define a class or a structure in a single file, and the external interface to that class or structure is automatically made available for other code to use.


// * Comparing Classes and Structures
// Classes and structures in Swift have many things in common. Both can

/*

1. Define properties to store values.
2. Define methods to provide functionality.
3. Define subscripts to provide access to their values using subscript syntax.
4. Define initializers to set up their inital state.
5. Be extended to expand their functionality beyond a default implementation.
6. Conform to protocols to provide standard functionality of a certain kind.


*/

/*
Classes have additional capabilities that structures do not:

1. Inheritance enables one class to inherit the characteristics of another.
2. Type casting enables you to check and interpret the type of a class instance at runtime.
3. Deinitializers enables an instance of a class to free up any resources it has assigned.
4. Reference counting allows more than one reference to a class instance.
*/


// * Definition Syntax
// You introduce classes with the class keyword and structures with the struct keyword. Both place their entire definition within a pair of braces:


class SomeClass{
    // class definition goes here
}

struct SomeStruct{
    // structure definition goes here
}


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}



// Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()


// Accessing Properties

println("The width of someResolution is \(someResolution.width).")

// You can drill down into sub-properties, such as the width property in the resolution property of a VideoMode:
println("The width of someVideoMode is \(someVideoMode.resolution.width).")

someVideoMode.resolution.width = 1280

println("The width of someVideoMode is now \(someVideoMode.resolution.width).")



// * Memberwise Initializers for Structure Types
// All structures have an automatically-generated member initializer, which you can use to initalize the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the memberwise initializer by name.

let vga = Resolution(width: 640, height: 480)
// Unlike structures, class instances do not receive a default memberwise initializer.

// * Structures and Enumerations Are Value Types
// * A value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
println("cinema is now \(cinema.width) pixels wide.")
println("hd is still \(hd.width) pixels wide.")




// The same behavior applies to enumerations:

enum CompassPoint {
    case North, South, East, West
}

var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East

if rememberedDirection == .West {
    println("The remembered direction is still .West.")
}

// * Class Are Reference Types

// Unlike value types, reference types are not copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used instead.

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEight = tenEighty
alsoTenEight.frameRate = 30.0

println("The frameRate property of tenEighty is now \(tenEighty.frameRate).")


// Note that tenEighty and alsoTenEighty are declared as constant, rather than variables. However, you can still chage tenEight.frameRate and alsoTenEighty.frameRate because the values of the tenEighty and alsoTenEighty constants themselves do not actually change.


// * Indetity Operators

// To find out if two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators: Identical to ( === ) Not Identical to ( !== )


if tenEighty === alsoTenEight {
    println("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

// (===) means that two constants or variables of class type refer to exactly the same class instance.
// (==) means that two instances are considered "equal" or "equivlent" in value, for some appropriate meaning of "equal", as defined by the type's designer.

// A Swift constant or variable that refers to an instance of some reference type is similar to a pointer in C, but is not a direct pointer to an address in memory, and does not require you to write an asterisk(*) to indicate that you are creating a reference. Instead, these references are defined like any other constant or variable in Swift.



// * Assignment and Copy Behavior for Strings, Arrays, and Dictionaries

// Swift's String, Array, and Dictionary types are implemented as structures. This means that strings, arrays, and dictionaries are copied when they are assigned to a new constant or variable, or when they are passed to a function or method. However, Swift only performs an actual copy behind the scenes when it is absolutely necessary to do so. Swift manages all value copying to ensure optimal performance, and you should not void assignment to try to preempt this optimization.

// This behavior is different from NSString, NSArray, and NSDictionary in Foundation, which are implemented as classes, not structures. NSString, NSArray, and NSDicionary instances are always assigned and passed around as a reference to an existing instance, rather than as a copy.


// * Properties

// Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate( rather than store ) a value. Computed properties are provided by classes, structures and enumerations. Stored properties are provided only by classes and structures.


// Stored and computed properties are usually associated with instances of a particular type. However, properties can also be associated with the type itself. Such properties are known as type properties.

// In addition, you can define property observers to monitor changes in a property's value, which you can respond to with custom actions. Property observers can be added to stored properties you define youself, and also to properties that a subclass inherits from its superclass.
// Stored Properties can be either variable stored properties (var) or constant stored properties (let).


struct FixedLenghRange {
    var firstValue:Int
    let length:Int
}


var rangeOfTreeItems = FixedLenghRange(firstValue: 0, length: 3)
rangeOfTreeItems.firstValue = 6
//rangeOfTreeItems.length = 10 this line can not be compiled.

// Stored Properties of Constant Structure Instances
// If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance's properties, even if they were declared as variable properties. The same is not true for classes, which are reference types.

// * Lazy Stored Properties
//  A lazy stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the lazy modifier before its declaration.
// You must always declare a lazy property as a variable ( with the var key ), because its initial value might not be retrieved until after instance initialzation completes. Constant properties must always have a value before initialization completes, and therefore cannot be declared as lazy.
// Lazy properties are useful when the initial value for a property is dependent on outside factors whose values are not known until after an instance's initialization is complete. Lazy properties are also useful when the initial value for a property requires complex computationally expensive setup that should not be performed unless or until it is needed.


class DataImporter{
    /*
    
    DataImporter is a class to import data from an external file.The class is assumed to take a non=trivial amount of time to initialize.
    */
    var fileName = "data.txt"
    // The DataImporter class would provide data importing functionality here
}

class DataManager{
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// The DataImporter instance for the importer property has not yet been created. It will been created when the importer property is first accessed.

println(manager.importer.fileName)

// * Stored Properties and Instance Variables

// If you have experience with Objective-C, you may know that it provides two ways to store values and references as part of a class instance. In addition to properties, you can use instance variables as a backing store for the values stored in a property.

// Swift unifies these concepts into a single property declaration. All about the property -- including its name,type, and memory management characteristics -- is defined in a single location as part of type's definition.

// * Computed Properties
// In addition to stored properties, structures, and enumerations can define computed properties, which do not actually store a value, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.


struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + ( size.width / 2 )
            let centerY = origin.y + ( size.height / 2 )
            return Point( x: centerX, y:centerY )
        }
        set(newCenter) {
            origin.x = newCenter.x - ( size.width / 2 )
            origin.y = newCenter.y - ( size.height / 2 )
        }
    }
}


var square = Rect(origin: Point(x:0.0, y:0.0), size: Size(width: 10.0, height: 10.0))

// The square variable's center property is then accessed through dot syntax ( square.center ) which causes the getter for center to be called, to retrieve the current property value.
let initialSquareCenter = square.center
// Setting the center property calls the setter for center, which modifies the x and y values of the stored origin property, and moves the square to its new position.
square.center = Point(x:15.0, y:15.0)

println("square.origin is now at (\(square.origin.x), \(square.origin.y))")


// * Shorthand Setter Declaration
// If a computed property's setter does not define a name for the new value to be set, a default name of newValue is used.

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let centerX = origin.x + ( size.width / 2)
            let centerY = origin.y + ( size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set{
            origin.x = newValue.x - ( size.width / 2)
            origin.y = newValue.y - ( size.height / 2)
        }
    }
}


// * Read-Only Computed Properties

// A computed property with a getter but no setter is known as read-only computed property. You must declare computed properties-- including read-only computed properties-- as variable properties with the var keyword.


// You can simplify the declaration of a read-only computed property by removing the get keyword and its braces:
struct Cuboid{
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double{
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
println("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


// * Property Observers
// Property observers observe and respond to changes in a property's value. Property observers are called every time a property's value is set, even if the new value is the same as the property's current value.

// You can add property observers to any stored properties you define, apart from lazy stored properties. You can also add property observers to any inherited property ( whether stored or computed ) by overriding the property within a subclass.

// You don't need to define property observers for non-overriden computed properties, because you can observe and respond to changes to their value from directly within the computed property's setter.

// You have the option to define either or both of these observers on a property:
/*

# willSet is called just before the value is stored.
# didSet is called immediately after the new value is stored.
*/


// If you implement a willSet observer, it is passed the new property value as a constant parameter. You can specify a name for this parameter as part of your willSet implementation. If you choose not to write the parameter name and parentheses within your implementation, the parameter will still be made available with a default parameter name of newValue. Similarly, if you implement a didSet observer, it will be passed a constant parameter containing the old property value. You can name the parameter if you wish, or use the default parameter name of the oldValue.

// willSet and didSet observers are not called when a property is set in an initializer before delegation takes place.


//# Design tips: It will be helpful using setter/getter observers for a chaining validation and event processing system inside the class.
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps){
            println("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                println("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360


// * Global and local variables
// Global variables are variables that are defined outside of any function, method, closure, or type context. Local variables are variables that are defined within a function, method, or closure context.

// You can define stored and computed variables in both global and local scope.

// Global constants and variables are always computed lazily, in a similar manner to Lazy Stored Properties. Unlike lazy stored properties, global constants and variables do not need to be marked with the lazy modifier.
// Local constants and variables are never computed lazily.


// * Type Properties
// You can also define properties that belong to the type itself, not to any one instance of that type. There will only ever to be one copy of these properties, no matter how many instances of that type you create. These kinds of properties are called type properties.

// * For value types, you can define stored and computed type properties. For classes, you can define computed type properties only.

// Stored type properties for value types can be variables or constants. Computed type properties are always declared as variable properties, in the same way as computed instance properties.

// Unlike stored instance properties, you must always give stored type properties a default value. This is because the type itself does not have an initializer that can assign a value to a stored type property at initialization time.


// * Type Property Syntax

// In C and Objective-C, you define static constants and variables associated with a type as global static variables. In Swift, however, type properties are written as part of the type's definition, within the type's outer curly braces, and each type property is explicitly scoped to the type it supports.

// You define type porperties for value types with the static keyword, and type properties for class types with the class keyword.



struct SomeStructure {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: Int {
        // return an Int value here
        return 0
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        // return an Int value here
        return 0
    }
}

class SomeClass1 {
    class var computedTypeProperty: Int {
        // return an Int value here
        return 0
    }
}

// * Querying and Setting Type Properties
// Type properties are queried and set with dot syntax, just like instance properties.

println(SomeClass1.computedTypeProperty)
println(SomeStructure.storedTypeProperty)
println(SomeStructure.storedTypeProperty)


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet{
            if currentLevel > AudioChannel.thresholdLevel{
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels{
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
        
    }
}


var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
println(leftChannel.currentLevel)
println(AudioChannel.maxInputLevelForAllChannels)



// * Methods
// Methods are functions that are associated with a particular type. Classes, structures, and enumerations can all define instance methods. Classes, structures, and enumerations can also define methods, which are associated with the type itself.

// * Instance Methods
class Counter {
    var count = 0
    func increment() {
        count++
    }
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()










// * Local and External Parameter Names for Methods
// Function parameters can have both a local name and an external name, the same is true for method parameters, because methods are just functions that are associated with a type.

// * Swift gives the first parameter name in a method a local parameter name by default, and gives the second and subsequent parameter names both local and external parameter names by default. This convention matches the typical naming and calling convention you will be familiar with from writing Objective-C methods, and makes for expressive method calls without need to qualify your parameter names. This default behavior effectively treats the method as if you had written a hash synbol(#) before the parameter

/*
class Counter3{
var count:Int = 0
func incrementBy(amount: Int, #numberOfTimes: Int) {

}
}
*/


// You don't need to define an external parameter name for the first argument value, because its purpose is clear from the function name incrementBy. The second argument, however, is qualified by an external parameter name to make its purpose clear when the method is called.


// * Modifying External Parameter Name Behavior for Methods
// You can either add an explicit external name yourself, or you can prefix the first parameter's name with a hash symbol to use the local name as external name too.
// Conversely, if you do not want to provide an external name for the second or subsequent parameter of a method, override the default behavior by using an underscore character(_) as an explicit external parameter name for that parameter.

class Testmethod {
    func abc(a:String,_ b: String,_ c:String){
        println( "\(a),\(b),\(c)")
    }
}


// * The self property
// Every instance of a type has an implicit property called self, which is exactly equivalent to the instance itself. In practice, you don't need to write self in your code very often. If you don't explicitly write self, Swift assumes that you are referring to a property or method of the current instance.


// * Modifying Value Types from Within Instance Methods

// Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.

// However, if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method. The method can then mutate its properties from within the method, and any changes that it makes are written back to the original structure when the method ends. The method can also assign a completely new instance to its implicit self property, and this new instance will replace the existing one when the method ends.

// You can opt in to this behavior by placing the mutating keyword before the func keyword for that method:

struct Point2{
    var x = 0.0, y = 0.0
    
    mutating func moveByX(deltaX : Double, _ deltaY:Double) {
        x += deltaX
        y += deltaY
    }
}


var somePoint = Point2( x:1.0, y:1.0 )
somePoint.moveByX(2.0, 3.0)
println( "The point is now at (\(somePoint.x), \(somePoint.y)) " )


// The mutating keyword is added to its definition to enable it to modify its properties.


// Note that you cannot call a mutating method on a constant of structure type, because its properties cannot be changed, even if they are variable properties.

let fixedPoint = Point2(x: 3.0, y: 3.0)
// fixedPoint.moveByX(2.0, 3.0)  //this will report an error


// * Assigning to self Within a Mutating Method

struct Point3{
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX:Double, _ deltaY:Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}


// Mutating methods for enumerations can set the implicit self parameter to be a different member from the same enumeration:


enum TriStateSwitch:String {
    case Off="Off", Low="Low", High="High"
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}


var ovenLight = TriStateSwitch.Low
ovenLight.rawValue
ovenLight.next()
ovenLight.rawValue
ovenLight.next()
ovenLight.rawValue



// * Type Methods
// You can also define methods that are called on the type itself. These kinds of methods are called type methods. You indicate type methods by writing the keyword static before the method's func keyword. Classes must also use the class keyword to allow subclasses to override the superclass's implementation of that method.

// Note: In Objective-C, you can defined type-level methods only for Objective-C classes. In Swift, you can define type-level methods for all classes, structures, and enumerations. Each type method is explicitly scoped to the type it supports.

// You call type method on the type using dot syntax.

class SomeClass2{
    class func someTypeMethod(){
        // type method implementation goes here
    }
}

SomeClass2.someTypeMethod()


// Within the body of a type method, the implicit self property refers to the type itself, rather than an instance of that type. For structures and enumerations, this meas that you can use self to disambiguate between type properties and type method parameters, just as you do for instance properties and instance method parameters. More generally, any unqualified method and property names that use within the body of a type method will refer to other type-level methods and properties. A type method can call another type method with the other method's name, without needing to prefix it with the type name.




struct LevelTracker {
    static var highestUnlockerLevel = 1
    static func unlockLevel(level:Int) {
        if level > highestUnlockerLevel {
            highestUnlockerLevel = level
        }
    }
    
    static func levelIsUnlocked(level:Int) -> Bool {
        return level <= highestUnlockerLevel
    }
    
    var currentLevel = 1
    mutating func advanceToLevel(level:Int) -> Bool{
        if LevelTracker.levelIsUnlocked(level){
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


class Player {
    var tracker = LevelTracker()
    let playerName : String
    func completedLevel(level:Int){
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init (name:String){
        playerName = name
    }
}


var player = Player(name:"Argyrios")
player.completedLevel(1)
println("highest unlocked level is now \(LevelTracker.highestUnlockerLevel)")



// * Subscripts

// Classes ,structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval.

// You can define multiple subscripts for a single type, and the appropriate subscript overload to use is selected based on the type of index value you pass to the subscript. Subscripts are not limited to a single dimension, and you can define subscripts with multiple input parameter to suit your custom type's needs.


// * Subscript Syntax

// You write subscript definitions with the subscript keyword, and specify one or more input parameters and a return type, in the same way as instance methods. Unlike instance methods, subscripts can be read-write or read-only.

class SubscriptDemo{
    subscript(index:Int) -> Int{
        get{
            // return an appropriate subscript value here
            return 1
        }
        set(newValue){
            // As with computed properties, you can choose not to specify the setter's (newValue) parameter. A default parameter called newValue is provided to your setter if you do not provide one yourself.
            // perform a suitable setting action here
        }
    }
    
    subscript(index:String) ->String?{
        //return an appropriate subscript value here.
        // As with read-only computed properties, you can drop the get keyword for read-only subscripts:
        return nil
    }
}


struct TimesTable{
    let multiplier:Int
    
    subscript(index:Int) -> Int{
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
println("six times three is \(threeTimesTable[6])")



// * Subscript Usage

// The exact meaning of "subscript" depends on the context in which it is used.

// Swift's Dictionary type implements its key-value subscripting as a subscript that takes and receives an optional type (eg. Int?).


// * Subscript Options
// Subscripts can take any number of input parameters, and these input parameters can be of any type. Subscripts can also return any type. Subscripts can use variable parameters and variadic parameters, but cannot use in-out parameters or provide default parameter values.
// A class or structure can provide as many subscript implementations as it needs, and the appropriate subscript to be used will be inferred based on the types of the value or values that are contained within the subscript braces at the point that the subscript is used. This definition of multiple subscripts is known as subscript overloading.

struct Matrix {
    let rows: Int, columns:Int
    var grid: [Double]
    
    init(rows:Int, columns:Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexIsValidForRow(row:Int, column:Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row:Int, column:Int) -> Double {
        get{
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[row * columns + column]
        }
        set{
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[row * columns + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

matrix[1,1]

// * Inheritance

// Classes in Swift can call and access methods, properties, and subscripts belonging to their superclass and can provide their own overriding versions of those methods, properties, and subscripts to refine or modify their behavior.”

// # Defining a Base Class

// Swift classes do not inherit from a universal base class. Classes you define without specifying a superclass automatically become base classes for you to build upon.


class  Vehicle {
    var currentSpeed = 0.0
    var description : String {
        return "traveling at \(currentSpeed) miles per hour."
    }
    
    func makeNoise(){
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}


let someVehicle = Vehicle()

println("Vehicle: \(someVehicle.description)")



// * Subclassing

// The subclass inherits characteristics from the existing class, which you can then refine.

class Bicycle : Vehicle {
    var hasBasket = false
}


let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0
println("Bicycle: \(bicycle.currentSpeed)")



class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()

tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0

println("Tandem: \(tandem.currentSpeed)")



// * Overriding

// A subclass can provide its own custom implementation of an instance method, type method, instance property, or subscript that it would otherwise inherit from a superclass. This is known overriding.

// To override a characteristic that would otherwise be inherited, you prefix your overriding definition with the override keyword.Any overrides without the override keyword are diagnosed as an error when your code is compiled.


// * Accessing Superclass Methods, Properties, and Subscripts

// When you provide a method, property, or subscript override for a subclass, it is sometimes useful to use the existing superclass implementation as part of your override.

// Where this is appropriate, you access the superclass version of a method, property, or subscript by using the super prefix:
/*

1) An overridden method name someMethod() can call the superclass version of someMethod() by calling super.someMethod() within the overriding method implementation.
2) An overridden property called someProperty can access the superclass version of someProperty as super.someProperty within the overriding getter or setter implementation.
3) An overridden subscript for someIndex can access the superclass version of the same subscript as super[someIndex] from within the overriding subscript implementation.
*/


// * Overriding Methods
class Train : Vehicle {
    override func makeNoise() {
        println( "Choo Choo" )
    }
}

let train = Train()


// * Overriding Properties
// You can override an inherited instance or class property to provide your own custom getter and setter for that property, or to add property observers to enable the overriding property to observe when the underlying property value changes.


// * Overriding Property Getters and Setters

// You can provide a custom getter ( and setter, if appropriate ) to override any inherited property, regardless of whether the inherited property is implemented as a stored or computed property at source. The stored or computed nature of an inherited property is not known by a subclass -- it only knows that the inherited property has a certain name and type. You must always state both the name and the type of the property you are overriding, to enable the compiler to check that your override matches a superclass property with the same name and type.

// You can present an inherited read-only property as a read-write property by providing both a getter and a setter in your subclass property override. You cannot, however, present an inherited read-write property as read-only property.

// Note: If you provide a setter as part of a property override, you must also provide a getter for that override. If you don't want to modify the inherited property's value within the overriding getter, you can simply pass through the inherited value by returning super.someProperty from the getter, where someProperty is the name of the property you are overriding.


class Car: Vehicle {
    var gear = 1
    override var description : String {
        return super.description + " in gear \(gear)"
    }
}


let car = Car()
car.currentSpeed = 25.0
car.gear = 3
println("Car: \(car.description)")



// * Overriding Property Observers
// You can use property overriding to add property observers to an inherited property. This enables you to be notified when the value of an inherited property changes, regardless of how that property was originally implemented.

// You cannot add property observers to inherited constant stored properties or inherited read-only computed properties. The value of these properties cannot be set, and so it is not appropriate to provide a willSet or didSet implementation as part of an override.
// Note also that you cannot provide both an overriding setter and an overriding property observer for the same property. If you want to observe changes to a property's name, and you are already providing a custom setter for that property, you can simply observe any value changes from within the custom setter.



class AutomaticCar : Car {
    override var currentSpeed : Double {
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
println("AutomaticCar: \(automatic.description)")


// * Preventing Overrides
// You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript's introducer keyword.


// Any attempt to override a final method, property, or subscript in a subclass is reported as a compile-time error. Methods, properties, or subscripts that you add to a class in an extension can also be marked as final within the extension's definition.

// You can mark an entire class as final by writing the final modifier before the class keyword in its class definition( final class ). Any attempt to subclass a final class is reported as a compile-time error.



// * Initialization
// Unlike Objective-C initializers, Swift initializers do not return a value.
// Instance of class types can also implement a deinitializer, which performs any custom cleanup just before an instance of that class is deallocated.


// * Setting Initial Values for Stored Properties

// Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. Stored properties cannot be left in an indeterminate state.
// Note: When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers.

// Initializers

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}


var f = Fahrenheit()

println("The default temperature is \(f.temperature) Fahrenheit")


// * Default Property Values
// If a property always takes the same initial value, provide a default value rather than a value within an initializer. The end result is the same, but the default value ties the property's initialization more closely to its declaration. It makes for shorter, clearer initializers and enables you to infer the type of the property from its default value. The default value also makes it easier for you to take advantage of default initializers and initializer inheritance.


// * Customizing Initialization

// * Initialization parameters

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsius = ( fahrenheit - 32.0 ) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}


let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)



// * Local and External Parameter Names
// As with function and method parameters, initalization parameters can have both a local name for use within the initializer's body and an external name for use when calling the initializer.

// Swift provides an automatic external name for every parameter in an initializer if you don't provide an external name yourself. This automatic external name is the same as the local name, as if you had written a hash symbol before every initialzation parameter.


struct Color {
    let red, green, blue : Double
    
    init(red: Double, green:Double, blue:Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double){
        red = white
        green = white
        blue = white
        
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// Note that it is not possible to call these initializers without using external parameter names. External names must always be used in an initializer if they are defined.

// let verGreen = Color(0.0, 1.0, 0.0)   //compile-time error

// * Initializer Parameters Without External Names

// If you do not want to use an external name for an initializer parameter, write an underscore(_) instead of an explicit external name for parameter to override the default behavior.


struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}


let bodyTemperature = Celsius2(37.0)



// * Optional Property Types

class SurveyQuestion {
    var text: String
    var response: String?
    init(text:String) {
        self.text = text
    }
    
    func ask() {
        println(text)
    }
}


let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."


// Assigning Constant Properties During Initialization
// You can assign a value to a constant property at any point during initialization, as long as it is set to a definite value by the time initialization finishes. Once a constant property is assigned, it can't be further modified.

// For class instances, a constant property can only be modified during initilization by the class that introduces it. it cannot be modified by a subclass.


class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        println(text)
    }
}
let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"


// * Default Initializers

// Swift provides a default initializer for any structure or base class that provides default values for all of its properties and does not provide at leat one initializer itself. The default initializer simply create a new instance with all of its properties set to their defalut values. Optional property will automatically receives a default value of nil.

// * Memberwize Initializers for Structure Types.

// Structure types automatically receive a memberwize initializer if they do not define any of their own custom initializers. Unlike a default initializer, the structure receives a memberwize initializer even if it has stored properties that do not have default values.


struct Size2 {
    var width = 0.0, height = 0.0
}


let twoByTwo = Size2(width: 2.0, height: 2.0)


// * Initializer Delegation for Value Types
// Initializers can call other initializers to perform part of an instance's initialization. This process, known as initializer delegation, avoids duplicating code across multiple initializers.

// Value types ( structures and enumerations ) do not support inheritance, and so their initializer delegation process is relatively simple, because they can only delegate to another iintializer that they provide themselves. Classes, however, can inherit from other classes, as described in Inheritance. This means that classes have additional responsibilities for ensuring that all stored properties they inherit are assigned a suitable value during initialization.

// For value types, you use self.init to refer to other initializers from the same value type when writing your own custom initializers. You can only call self.init from within an initializer.


struct Size4{
    var width = 0.0, height = 0.0
}

struct Point4{
    var x = 0.0, y = 0.0
}

struct Rect4 {
    var origin = Point4()
    var size = Size4()
    
    init() {}
    
    init(origin:Point4, size: Size4){
        self.origin = origin
        self.size = size
    }
    
    init( center: Point4, size:Size4) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point4 (x:originX, y: originY), size:size)
    }
}

let basicRect =  Rect4()
let originRect = Rect4(origin: Point4(x: 2.0, y: 2.0), size: Size4(width: 5.0, height: 5.0))
let centerRect = Rect4(center: Point4(x: 4.0, y: 4.0), size: Size4(width: 3.0, height: 3.0))



// * Class Inheritance and Initialization
// Swift defines two kinds of initializers for class types to help ensure all stored properties receive an initial value. These are known as designated initializers and convenience initializers.


// * Designated Initializers and Convenience Initializers
// Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.

// Every class must have at least one designated initializer.


// Convenience initializers are secondary, supporting initializers for a class. You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values. You can also define a convenience initializer to create an instance of that class for a specific use case or input value type.
// Create convenience initializers whenever a shortcut to a common initialization pattern will save time or make initialization of the class clearer in intent.

// * Syntax for Designated and Convenience Initializers


/*
Designated initializers for classes are written in the same way as simple initializers for value types:

init(parameters) {
statements
}
Convenience initializers are written in the same style, but with the convenience modifier placed before the init keyword, separated by a space:

convenience init(parameters) {
statements
}

*/


// * Initializer Delegation for Class Types

// 3 rules for delegation calls between initializers:
/*
1) A designated initializer must call a designated initializer from its immediate superclass.
2) A convenience initializer must call another initializer from the same class.
3) A convenience initializer must ultimately call a designated initializer.
*/

// A simple way to remember this is:
// ! Designated initializer must always delegate up.
// ! convenience initializers must always delegate accross.


// * Two-Phase Initialization
// Class initialization in Swift is a two-phase process. In the first phase, each stored property is assigned an initial value by the class that introduced it. Once the initial state for every stored property has been determined, the second phase begins, and each class is given the opportunity to customize its stored properties further before the new instance is considered ready for use.


// Swift’s compiler performs four helpful safety-checks to make sure that two-phase initialization is completed without error:

// Safety check 1
// A designated initializer must ensure that all of the properties introduced by its class are initialized before it delegates up to a superclass initializer.
// Safety check 2
// A designated initializer must delegate up to a superclass initializer before assigning a value to an inherited property. If it doesn’t, the new value the designated initializer assigns will be overwritten by the superclass as part of its own initialization.

// Safety check 3
// A convenience initializer must delegate to another initializer before assigning a value to any property (including properties defined by the same class). If it doesn’t, the new value the convenience initializer assigns will be overwritten by its own class’s designated initializer.

// Safety check 4
// An initializer cannot call any instance methods, read the values of any instance properties, or refer to self as a value until after the first phase of initialization is complete.”



// * Initializer Inheritance and Overriding

// Swift subclasses do not inherit their superclass initializers by default. Swift's approach prevents a situation in which a simple initializer from a superclass is inherited by a more specialized subclass and is used to create a new instance of the subclass that is not fully or correctly initialized.

// Note: Superclass initializers are inherited in certain circumstances, but only when it is safe and appropriate to do so.
// If you want a custom subclass to present one or more of the same initializers as its superclass, you can provide a custom implementation of those initializers within the subclass.

// When you write a subclass initializer that matches a superclass designated initializer, you are effectively providing an override of that designated initializer. Therefore, you must write the override modifier before the subclass's initializer definition. This is true even if you are overriding an automatically provided default initializer.
// Conversely, if you write a subclass initializer that matches a superclass convenience initializer, that superclass convenience initializer can never be called directly by your subclass, as per the rules described above in Initializer Delegation for Class Types. Therefore, your subclass is not (strictly speaking) providing an override of the superclass initializer. As a result, you do not write the override modifier when providing a matching implementation of a superclass convenience initializer.



class Vehicle2 {
    // Automatically receives a default initializer. The default initializer is always a designated initializer for a class.
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle2: Vehicle2 {
    override init() {
        // Calls the default initializer for the Vehicle2.
        super.init()
        numberOfWheels = 2
    }
}

let bicycle2 = Bicycle2()
println( "Bicycle: \(bicycle2.description)" )

// Note: Subclasses can modify inherited variable properties during initialization, but can not modify inherited constant properties.


// * Automatic Initializer Inheritance
// As mentioned above, subclasses do not inherit their superclass initializers by default. However, superclass initializers are automatically inherited if certain conditions are met. In practice, this means that you do not need to write initializer overrides in many common scenarios, and can inherit your superclass initializers with minimal effort whenever it is safe to do so.

/*
Assuming that you provide default values for any new properties you introduce in a subclass, the following two rules apply:

1) If your subclass doesn’t define any designated initializers, it automatically inherits all of its superclass designated initializers.

2) your subclass provides an implementation of all of its superclass designated initializers—either by inheriting them as per rule 1, or by providing a custom implementation as part of its definition—then it automatically inherits all of the superclass convenience initializers.”

These rules apply even if your subclass adds further convenience initializers.


Note: A subclass can implement a superclass designated initializer as a subclass convenience initializer as port of satisfying rule 2.
*/

class Food {
    var name:String
    init(name:String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name:"[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")


class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int){
        self.quantity = quantity
        super.init(name:name)
        
    }
    
    // provides an implementation of all of its superclass designated initializers
    override convenience init(name: String) {
        self.init(name:name, quantity: 1)
    }
}


let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name:"Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)



class ShoppingListItem: RecipeIngredient {
    // does not define an initializer to provide an initial value for purchased, automatically inherits all of the designated an convenience initializers from its superclass.
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "yes": "no"
        return output
    }
}


var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true

for item in breakfastList {
    println( item.description)
}



// * “Failable Initializers
//It is sometimes useful to define a class, structure, or enumeration for which initialization can fail. This failure might be triggered by invalid initialization parameter values, the absence of a required external resource, or some other condition that prevents initialization from succeeding.”


// You write a failable initializer by placing a question mark after the init keyword (init?).”
// You cannot define a failable and a nonfailable initializer with the same parameter types and names.”
// A failable initializer creates an optional value of the type it initializes. You write return nil within a failable initializer to indicate a point at which initialization failure can be triggered.

// Although you write return nil to trigger an initialization failure, you do not use the return keyword to indicate initialization success.

struct Animal {
    let species:String
    init? (species: String){
        if species.isEmpty{return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature{
    println("An animal was initialized with a species of \(giraffe)")
}

let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {
    println("The anonymous creature could not be initialized.")
}



// * Failable Initializers for Enumerations

// You can use a failable initializer to select an appropriate enumeration member based on one or more parameters. The initializer can then fail if the provided parameters do not match an appropriate enumeration member.


enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol:Character){
        
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
            
        }
    }
}


let fahrenheitUnit = TemperatureUnit(symbol: "F")
if (fahrenheitUnit != nil) {
    println("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")

if unknownUnit == nil {
    println("This is not a defined temperature unit, so initialization failed.")
}


// * Failable Initializers for Enumerations with Raw Values

// Enumerations with raw values automatically receive a failable initializer, init?(rawValue:), that takes a parameter called rawValue of the appropriate raw-value type and selects a matching enumeration member if one is found, or triggers an initialization failure if no matching value exists.

enum TemperatureUnit2: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit2 = TemperatureUnit2(rawValue: "F")

if fahrenheitUnit2 != nil {
    println("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit2 = TemperatureUnit2(rawValue: "X")
if unknownUnit2 == nil {
    println("This is not a defined temperature unit, so initialization failed.")
}


// * Failable Initializers for Classes

// A failable initializer for a value type ( that is , a structure or enumeration) can trigger an initialization failure at any point within its initializer implementation.

// For classes, however, a failable initializer can trigger an initialization failure only after all stored properties introduced by that class have been set to an initial value and any initializer delegation has taken place.

class Product {
    let name: String!
    init?(name:String){
        self.name = name
        if name.isEmpty {return nil}
    }
}

if let bowTie = Product(name: "bow tie"){
    println("The product's name is \(bowTie.name)")
}


// * Propagation of Initialization Failure
// A failable initializer of a class, structure, or enumeration can delegate across to another failable initializer from the same class, structure, or enumeration. Similarly, a subclass failable initializer can delegate up to a superclass failable initializer.
// In either case, if you delegate to another initializer that causes initialization to fail, the entire initialization process fails immediately, and no further initialization code is executed.

// Note: A failable initializer can also delegate to a nonfailable initializer. Use this approach if you need to add a potential failure state to an existing initialization process that does not otherwise fail.


class CartItem:Product {
    let quantity: Int!
    init?(name:String, quantity:Int) {
        self.quantity = quantity
        super.init(name: name)
        
        if quantity < 1 { return nil }
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    println("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}


if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    println("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    println("Unable to initialize zero shirts.")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    println("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    
    println("Unable to initialize one unnamed product")
}


// * Overriding a Failable Initializer
//You can override a superclass failable initializer in a subclass, just like any other initializer. Alternatively, you can override a superclass failable initializer with a subclass non-failable initializer. This enables you to define a subclass for which initialization cannot fail, even though initialization of the superclass is allowed to fail.”
// “Note that if you override a failable superclass initializer with a nonfailable subclass initializer, the subclass initializer cannot delegate up to the superclass initializer. A nonfailable initializer can never delegate to a failable initializer.


class Document {
    var name: String?
    init() {}
    
    init?(name:String){
        self.name = name
        if name.isEmpty {return nil}
    }
}


class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
    
}





// * The init! Failable Initializer
// You typically define a failable initializer that creates an optional instance of the appropriate type by placing a question mark after the init keyword (init?). Alternatively, you can define a failable initializer that creates an implicitly unwrapped optional instance of the appropriate type. Do this by placing an exclamation mark after the init keyword (init!) instead of a question mark.

// You can delegate from init? to init! and vice versa, and you can override init? with init! and vice versa. You can also delegate from init to init!, although doing so will trigger an assertion if the init! initializer causes initialization to fail.


// * Required Initializers

// Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer:

class SomeClass3 {
    required init(){
        println("init")
        // initializer implementation goes here
    }
}

// You must also write the required modifier before every subclass implementation of a required initializer, to indicate that the initializer requirement applies to further subclasses in the chain. You do not write the override modifier when overriding a required designated initializer:

class SomeSubClass: SomeClass3 {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}


// Note: You do not have to provide an explicit implementation of a required initializer if you can satisfy the requirement with an inherited initializer.


// * Setting a Default Property Value with a Closure or Function
// If a stored property’s default value requires some customization or setup, you can use a closure or global function to provide a customized default value for that property. Whenever a new instance of the type that the property belongs to is initialized, the closure or function is called, and its return value is assigned as the property’s default value.


/*
class SomeClass {
    let someProperty: SomeType = {
        return someValue
    }()
}
*/

// Note that the closure's end curly brace is followed by an empty pair of parentheses. This tells Swift to execute the closure immediately. If you omit these parentheses, you are trying to assign the closure itself to the property, and not the return value of the closure.

// Note: If you use a closure to initialize a property, remember that the rest of the instance has not yet been initialized at the point that the closure is executed. This means that you cannot access any other property values from within your closure, even if those properties have default values. You also cannot use the implicit self property, or call any of instance's methods.


struct Checkerboard {
    let boardColors : [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10{
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    
    func squareIsBlackAtRow(row:Int, column:Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}

let board = Checkerboard()
println(board.squareIsBlackAtRow(0, column: 1))
println(board.squareIsBlackAtRow(9, column: 9))




// * Deinitialization
// A deinitializer is called immediately before a class instance is deallocated. You write deinitializers with the deinit keyword, similar to how initializers are written with the init keyword. Deinitializers are only available on class types.

// Swift automatically deallocates your instances when they are no longer needed, to free up resources. Swift handles the memory management of instances through automatic reference counting (ARC), as described in Automatic Reference Counting.

// when you are working with your own resources, you might need to perform some additional clean-up yourself.

// Class definitions can have at most one deinitializer per class. The deinitializer does not take any parameters and is written without parentheses:

/*
deinit {
    // perform the deinitialization
}
*/

// “Deinitializers are called automatically, just before instance deallocation takes place. You are not allowed to call a deinitializer yourself. Superclass deinitializers are inherited by their subclasses, and the superclass deinitializer is called automatically at the end of a subclass deinitializer implementation. Superclass deinitializers are always called, even if a subclass does not provide its own deinitializer.

// Because an instance is not deallocated until after its deinitializer is called, a deinitializer can access all properties of the instance it is called on and can modify its behavior based on those properties (such as looking up the name of a file that needs to be closed).


// * Deinitializers in Action


struct Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCoinsToVend: Int ) -> Int {
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        
        return numberOfCoinsToVend
    }
    
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}



class Player1 {
    var coinsInPurse: Int
    init (coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}






var playerOne: Player1? = Player1(coins:100)

println("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
println("There are now \(Bank.coinsInBank) coins left in the bank" )

playerOne!.winCoins(2_000)
println("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
println("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil

println("PlayerOne has left the game")
println("The bank now has \(Bank.coinsInBank) coins")



// * Automatic Reference Counting

// ARC automatically frees up the memory used by class instances when those instances are no longer needed.

// Note: Reference counting only applies to instances of classes. Structures and enumerations are value types, not reference types, and are not stored and passed by reference.


// * How ARC Works
// Every time you create a new instance of a class, ARC allocates a chunk of memory to store information about that instance. This memory holds information about the type of the instance, together with the values of any stored properties associated with that instance.
// Additionally, when an instance is no longer needed, ARC frees up the memory used by that instance so that the memory can be used for other purposes instead. This ensures that class instances do not take up space in memory when they are no longer needed.

// However, if ARC were to deallocate an instance that was still in use, it would no longer be possible to access that instance’s properties, or call that instance’s methods. Indeed, if you tried to access the instance, your app would most likely crash.

// To make sure that instances don’t disappear while they are still needed, ARC tracks how many properties, constants, and variables are currently referring to each class instance. ARC will not deallocate an instance as long as at least one active reference to that instance still exists.

// To make this possible, whenever you assign a class instance to a property, constant, or variable, that property, constant, or variable makes a strong reference to the instance. The reference is called a “strong“ reference because it keeps a firm hold on that instance, and does not allow it to be deallocated for as long as that strong reference remains.”


class Person {
    let name:String
    init(name:String) {
        self.name = name
        println("\(name) is being initialized")
    }
    
    deinit {
        println("\(name) is being deinitialized")
    }
}


var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name:"John Appleseed")

// Because the new Person instance has been assigned to the reference1 variable, there is now a strong reference from reference1 to the new Person instance. Because there is at least one strong reference, ARC makes sure that this Person is kept in memory and is not deallocated.

// Assign the same Person instance to two more variables, two more strong references to that instance are established:

reference2 = reference1
reference3 = reference1

// If you break two of these strong references( including the original reference) by assigning nil to two of the variables, a single reference remains, and the Person instance is not deallocated:

reference1 = nil
reference2 = nil

// Until the third and final strong reference is broken, at which point it is clear that you are no longer using the Person instance:

reference3 = nil


// * Strong Reference Cycles Between Class Instances
// However, it is possible to write code in which an instance of a class never gets to a point where it has zero strong references. This can happen if two class instances hold a strong reference to each other, such that each instance keeps the other alive. This is known as a strong reference cycle.

// You resolve strong reference cycles by defining some of the relationships between classes as weak or unowned references instead of as strong references. 

class Apartment1 {
    let number : Int
    init(number : Int) { self.number = number }
    var tenant : Person1?
    deinit {println("Apartment #\(number) is being deinitialized")}
}




class Person1 {
    let name:String
    var apartment :Apartment1?
    init(name:String) { self.name = name}
    deinit { println("\(name) is being deinitialized")}
}


var john : Person1?
var number73: Apartment1?


john = Person1(name: "John Appleseed")
number73 = Apartment1(number: 73)

// linking these two instances creates a strong reference cycle between them.
john!.apartment = number73
number73!.tenant = john

// when you break the strong references held by the john and number73 variables, the reference counts do not drop to zero, and the instances are not deallocated by ARC:
john = nil
number73 = nil

// Note that neither deinitializer was called when you set these two variables to nil.



// * Resolving Strong Reference cycles Between Class Instances

// Weak and unowned references enable one instance in a reference cycle to refer to the other instance without keeping a strong hold on it. The instances can then refer to each other without creating a strong reference cycle.
// Use a weak reference whenever it is valid for that reference to become nil at some point during its lifetime. Conversely, use an unowned reference when you know that the reference will never be nil once it has been set during initialization.



// * “Weak References
// A weak reference is a reference that does not keep a strong hold on the instance it refers to, and so does not stop ARC from disposing of the referenced instance. This behavior prevents the reference from becoming part of a strong reference cycle. You indicate a weak reference by placing the weak keyword before a property or variable declaration.


// Use a weak reference to avoid reference cycles whenever it is possible for that reference to have “no value” at some point in its life. If the reference will always have a value, use an unowned reference instead.
// Weak references must be declared as variables, to indicate that their value can change at runtime. A weak reference cannot be declared as a constant.
// Because weak references are allowed to have “no value”, you must declare every weak reference as having an optional type. Optional types are the preferred way to represent the possibility for “no value” in Swift.
// Because a weak reference does not keep a strong hold on the instance it refers to, it is possible for that instance to be deallocated while the weak reference is still referring to it. Therefore, ARC automatically sets a weak reference to nil when the instance that it refers to is deallocated. You can check for the existence of a value in the weak reference, just like any other optional value, and you will never end up with a reference to an invalid instance that no longer exists.


class Person2 {
    let name:String
    init(name:String) { self.name = name }
    var aprtment: Apartment2?
    deinit { println("\(name) is being deinitialized")}
}

class Apartment2 {
    let number: Int
    init(number:Int) {self.number = number}
    // Use weak reference to break the cycle
    weak var tenant: Person2?
    deinit { println("Apartment #\(number) is being deinitialized")}
}

var john2: Person2?
var number732: Apartment2?

john2 = Person2(name: "John Appleseed" )
number732 = Apartment2(number: 73)

john2!.aprtment = number732
number732!.tenant = john2

john2 = nil

// Now the Apartment will has no tenant
number732!.tenant
number732 = nil



// * Unowned References
// Like weak references, an unowned reference does not keep a strong hold on the instance it refers to. Unlike a weak reference, however, an unowned reference is assumed to always have a value. Because of this, an unowned reference is always defined as a non-optional type. You indicate an unowned reference by placing the unowned keyword before a property or variable declaration.”

// Because an unowned reference is non-optional, you don’t need to unwrap the unowned reference each time it is used. An unowned reference can always be accessed directly. However, ARC cannot set the reference to nil when the instance it refers to is deallocated, because variables of a non-optional type cannot be set to nil.
// NOTE: If you try to access an unowned reference after the instance that it references is deallocated, you will trigger a runtime error. Use unowned references only when you are sure that the reference will always refer to an instance.

//Note also that Swift guarantees your app will crash if you try to access an unowned reference after the instance it references is deallocated. You will never encounter unexpected behavior in this situation. Your app will always crash reliably, although you should, of course, prevent it from doing so.”


class Customer {
    let name:String
    var card: CreditCard?
    init(name:String) {
        self.name = name
    }
    
    deinit { println("\(name) is being deinitialized")}
}




class CreditCard {
    let number: UInt64
    
    unowned let customer: Customer
    
    init(number:UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit { println("Card #\(number) is being deinitialized")}
}


var customer: Customer?
var creditCard:CreditCard?

customer = Customer(name: "John Appleseed")

// Customer instance now has a strong reference to the CreditCard instance, and the CreditCard instance has an unowned reference to the Customer instance.
creditCard = CreditCard(number: 1234_5678_9012_3456, customer: customer!)
customer!.card = creditCard

// When break the strong reference held by the customer variable, there are no strong reference to the Customer instance.

customer = nil
//creditCard!.customer  // This line will cause a crash because the customer is gone.

// Because there are no more references to the Customer instance, it is deallocated. After this happens, there are no more strong references to the CreditCard instance, and it too is deallocated.
creditCard = nil


// * Unowned References and Implicitly Unwrapped Optional Properties

// a situation where two properties, both of which are allowed to be nil, have the potential to cause a strong reference cycle. This scenario is best resolved with a weak reference.

// a situation where one property that is allowed to be nil and another property that cannot be nil have the potential to cause a strong reference cycle. This scenario is best resolved with an unowned reference.

// a third scenario, in which both properties should always have a value, and neither property should ever be nil once initialization is complete. In this scenario, it is useful to combine an unowned property on one class with an implicitly unwrapped optional property on the other class.This enables both properties to be accessed directly (without optional unwrapping) once initialization is complete, while still avoiding a reference cycle.


/*



class Country {
let name:String
let capitalCity: City!
init(name:String, capitalName:String){
self.name = name
self.capitalCity = City(name: capitalName, country: self)

// The initializer for Country cannot pass self to the City initializer until a new Conutry instance is fully initialized.To cope with this requirement, you declare the capitalCity property of Country as an implicitly unwrapped optional property, indicated by the exclamation mark at the end of its type annotation (City!). This means that the capitalCity property has a default value of nil. Because capitalCity has a default nil value, a new Country instance is considered fully initialized as soon as the Country instance sets its name property within its initializer. This means that the Country initializer can start to reference and pass around the implicit self property as soon as the name property is set. The Country initializer can therefore pass self as one of the parameters for the City initializer when the Country initializer is setting its own capitalCity property.
}
}

*/


class Country {
    let name:String
    var capitalCity: City!  // The playground run this statement buggy, and must change it to a var , the official example reports error.
    init(name:String, capitalName:String){
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name:String
    unowned let country:Country
    
    init(name:String, country:Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
println("\(country.name)'s capital city is called \(country.capitalCity.name)")




// * Strong Reference Cycles for Closures

//A strong reference cycle can also occur if you assign a closure to a property of a class instance, and the body of that closure captures the instance. This capture might occur because the closure’s body accesses a property of the instance, such as self.someProperty, or because the closure calls a method on the instance, such as self.someMethod(). In either case, these accesses cause the closure to “capture” self, creating a strong reference cycle.

//This strong reference cycle occurs because closures, like classes, are reference types. When you assign a closure to a property, you are assigning a reference to that closure. In essence, it’s the same problem as above—two strong references are keeping each other alive. However, rather than two class instances, this time it’s a class instance and a closure that are keeping each other alive.

//Swift provides an elegant solution to this problem, known as a closure capture list. ”

class HTMLElement {
    let name:String
    let text:String?
    
    // “The asHTML property is declared as a lazy property, because it is only needed if and when the element actually needs to be rendered as a string value for some HTML output target. The fact that asHTML is a lazy property means that you can refer to self within the default closure, because the lazy property will not be accessed until after initialization has been completed and self is known to exist.”
    
    lazy var asHTML:() -> String = {
        if let text = self.text {
            return "<\(self.name)> \(text) </\(self.name)>"
        }else {
            return "<\(self.name) />"
        }
    }
    
    
    init(name:String, text:String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit{
        println("\(name) is being deinitialized")
    }
}


var paragraph: HTMLElement? = HTMLElement(name:"p", text:"hello, world")

println(paragraph!.asHTML())
// The instance will not be deallocated.
paragraph = nil


// The instance’s asHTML property holds a strong reference to its closure. However, because the closure refers to self within its body (as a way to reference self.name and self.text), the closure captures self, which means that it holds a strong reference back to the HTMLElement instance. A strong reference cycle is created between the two. 

// NOTE: Even though the closure refers to self multiple times, it only captures one strong reference to the HTMLElement instance.”




// * Resolving Strong Reference Cycles for Closures

// You resolve a strong reference cycle between a closure and a class instance by defining a capture list as part of the closure’s definition. A capture list defines the rules to use when capturing one or more reference types within the closure’s body. As with strong reference cycles between two class instances, you declare each captured reference to be a weak or unowned reference rather than a strong reference. ”

// Note: Swift requires you to write self.someProperty or self.someMethod() (rather than just someProperty or someMethod()) whenever you refer to a member of self within a closure. This helps you remember that it’s possible to capture self by accident.



// * Defining a Capture List

// Each item in a capture list is a pairing of the weak or unowned keyword with a reference to a class instance (such as self) or a variable initialized with some value (such as delegate = self.delegate!). These pairings are written within a pair of square braces, separated by commas.

/* Place the capture list before a closure’s parameter list and return type if they are provided:

lazy var someClosure: (Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}

If a closure does not specify a parameter list or return type because they can be inferred from context, place the capture list at the very start of the closure, followed by the in keyword:


“lazy var someClosure: () -> String = {
    [unowned self, weak delegate = self.delegate!] in
    // closure body goes here
}”


Define a capture in a closure as an unowned reference when the closure and the instance it captures will always refer to each other, and will always be deallocated at the same time.

Conversely, define a capture as a weak reference when the captured reference may become nil at some point in the future. Weak references are always of an optional type, and automatically become nil when the instance they reference is deallocated. This enables you to check for their existence within the closure’s body.”
If the captured reference will never become nil, it should always be captured as an unowned reference, rather than a weak reference.

*/


class HTMLElement2 {
    let name:String
    let text:String?
    
    lazy var asHTML:() -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(self.text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name:String, text:String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        println("\(name) is being deinitialized")
    }
}


var paragraph2:HTMLElement2? = HTMLElement2(name: "p", text: "hello, world")

println(paragraph2!.asHTML())


// Now the instance will be released because the closure will not keep the strong reference of self.

paragraph2 = nil


