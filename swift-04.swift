
// #4: Closures

import Foundation

// Nested Function
func waitForResponse(option: Bool) -> (String) -> String {
    func waitingForResponce(errorMessage: String) -> String { print(errorMessage) }
    func notWaitingForResponce(errorMessage: String) -> String { print(errorMessage) }
    
    return option ? waitForResponse : notWaitingForResponce
}

// Passing a closure to "sorting" function
[1, 3, 2, 5, 4].sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
// Or shorter:
[1, 3, 2, 5, 4].sorted(by: { $0 > $1 })
// Or even shorter:
[1, 3, 2, 5, 4].sorted(by: >)

// This function's type is: (Double...) -> Double
func addNumbers(_ numbers: Double...) -> Double {
    var summ = 0.0
    
    for number in numbers {
        summ += number
    }
    
    print(summ)
    return summ
}

// Assign this function to a variable of type (Double...) -> Double
var addNums = addNumbers
_ = addNums(1.2, 4.13, 5.0)

// Pass function as a parameter (using a closure)
func modify(eachNumber numbers: Double..., function: (Double) -> Double) -> Double {
    result = [Double]()
    
    for number in numbers {
        result.append(function(number))
    }
    
    print(result)
    return result
}

// Trailing closure syntax
_ = modify(eachNumber: 81, 64, 49, 36, 25) { sqrt($0) }

// Use "map" function to modify each element of collection
[0, 1, 2, 3].map() { String($0 += 1) }

// !!! CLOSURES ARE REFERENCE TYPES
