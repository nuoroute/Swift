
//  #1: Collections, Tuples, Closures

import Foundation

// Array
let food = Array<String>()  // or preferred shorthand syntax:
let drinks = [String]()

var numbers = [1, 2, 3]
print(numbers.count)
numbers = []  // Emptying the array

let fiveZeros = Array(repeating: 0, count: 5)

if food.isEmpty {
    print("No food.. 😒")
}

var cars = [String]()
cars.append("Ferrari")  // or:
cars += ["Porsche", "Nissan", "Lamborghini"]
print(cars)

cars[1...3] = ["Fiat", "Ford"]
print(cars)

cars.insert("Tesla", at: 0)
cars.remove(at: Int(cars.endIndex) - 1)

// Iterating through an array, and grabbing index
for (index, value) in cars.enumerated() {
    print("Index: \(index) \t Value: \(value)")
}

// Set (items appear once, no order)
var elements = Set<String>()
elements.insert("Cube")
elements.insert("Triangle")

let shapes: Set<String> = ["Cube", "Triangle", "Sphere"]
var names: Set = ["Allison", "Lydia", "Malia"]
names.remove("Allison")
print(names)

if shapes.contains("Triangle") {
    print("\"shapes: Set<String>\" contains \"Triangle\"")
}

for name in names.sorted() {
    print(name)
}

print(shapes.isSubset(of: shapes.union(names)))

// Dictionary
var phoneBook = [String: String]()  // [Key: Value]
phoneBook["Allison"] = "192-123-132-0"
phoneBook["Malia"] = "952-292-333-0"
phoneBook = [:]  // Emptying

let places = ["USA": "New York", "Canada": "Toronto"]

for (country, city) in places {  // uses a tuple (key, value)
    print("Country: \(country) \t City: \(city)")
}

// Control Flow
var counter = 0

repeat {
    print("*", terminator: "")
    counter += 1
} while counter < 5

// Value binding with tuples in switch
let catName = ("cat", "John")
switch catName {
case ("cat", _):
    print("It's a cat")
    fallthrough
case ("cat", "John"):
    print("Cat's name is John")
case ("cat", let name):
    print("It's a cat named \(name)")
default:
    break
}

let ages = (20, 21)
outerLoop: switch ages {  // outerLoop is a loop label
case let (x, y) where x < y:
    print("20 is less than 21")
default:
    break outerLoop  // break out of outerLoop labeled loop
}

func doNothing() {
    guard let _ = Int("1") else {
        return  // Stop program execution (early exit) ! - ONLY INSIDE A FUNCTION
    }
}

// Checking API availability (#available(platformName version, ..., *) {} else {})
if #available(iOS 10, macOS 10.12, *) {  // Can also be used with guard. ".., *)" allows to run the body of "if" on newer platforms, then specified
    // Use newest APIs
} else {
    // Use older APIs
}

// Ignore function return value
func printsAndReturns() -> Double {
    print()
    return 0.0
}

_ = printsAndReturns()

// Multiple return values
func returnsTuple() -> (Int, Double) {
    return (0, 0.0)
}

print(returnsTuple().0)  // Return 1st element of a tuple

// Variadic parameters
func takeManyParameters(_ numbers: Double...) {  // Only 1 variadic parameter. "numbers" will be an array of doubles
    print(numbers)
}

takeManyParameters(1, 2.2, 0.1, 0)

// Change variables that were passed (inout parameters)
func changeParameter(_ x: inout Int) {  // should be marked "mutating func.." on a method
    x += 1
}

// Function Types
func addNumbers(_ numbers: Double...) -> Double {  // Type (Double...) -> Double
    var summ = 0.0
    
    for number in numbers {
        summ += number
    }
    
    print(summ)
    return summ
}

// Assign this function to a variable of type (Double...) -> Double
var summer: (Double...) -> Double = addNumbers
_ = summer(1.2, 4.13, 5.0)

// Pass function as a parameter (closure)
func modify(_ number: Double, function: (Double) -> Double) -> Double {
    return function(number)
}

_ = modify(3.14) { sqrt($0) }  // Trailing closure
