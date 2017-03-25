//
//  swift-01.swift
//  
//
//  Created by Constantine Shatalov on 3/25/17.
//
//

//  #0: Variables, Tuples, Type Alias, Error Handling, Assertions, Strings

import Foundation

// Variables
let age: UInt8 = 20
let maxInt = UInt64.max
let number: UInt = 20  // Will be 32 or 64 bit, depending on a system
let someFloat: Float = 0.0  // 32 bit f.p. number
let someOtherFloat: Double = 0.0  // 64 bit f.p. number
let double = 0.0  // Double by default
let binaryNumber = 0b00100101
let octalNumber = 0o02313413
let hexadecimalNumber = 0x16ba1a
let decimalWithExponent = 3.1415e2  // 3.1415 * 10^2
let hexadecimalWithExponent = 0xFp2  // F * 2^2
let extraFormattingZeros = 005
let extraFormattingUnderscores = 1_000_000_000
let convertedToDouble = Double(1)
let piToInt = Int(M_PI)

// Tuples
let errorCode: (errorNumber: Int, errorDescription: String) = (404, "Not Found")
let (errorNumber, errorMessage) = errorCode
_ = errorCode.errorDescription
_ = errorCode.errorNumber
print(errorCode.0)

let (justErrorNumber, _) = errorCode

let opCode = (zero: 0, one: 1)
print("\(opCode.zero) and \(opCode.one)")

// Type Alias
typealias Plist = AnyObject

// Error Handling
func sayHi(to name: String) throws -> String {
    return "Hi \(name)"
}

do {
    let hi = try sayHi(to: "John")
} catch {
    print("Couldn't say hi..")
}

assert(true, "If false, will kill the program")
assert(true)

// Tuple Comparison
if (1, "dog") > (2, "bear") {  // Won't compare "dog" and "bear" because 1 < 2, not >
    // "dog" would be < "bear" as it has less characters
}

// Ternary Operator
let someValue = 5 + (true ? 15 : 0)  // = 20

// Nil-Coalescing Operator
let a: Int? = 5
let b: Int? = nil
let someOtherValue = a ?? b  // if a != nil { someOtherValue = a } else { someOtherValue = b }

// Strings (VALUE TYPES, COPIED WHEN PASSED, CANNOT BE CHANGED IN METHODS):
let emptyString0 = ""
let emptyString1 = String()

if emptyString0.isEmpty && emptyString1.isEmpty {
    print("Both strings are empty")
}

for character in "Cat😺".characters {
    print(character)
}

// Swift Strings are fully Unicode. Unicode Strings are built with Unicode Scalars -
// 21 bit numbers representing a symbol, such as U+0061 - LATIN SMALL LETTER A ("a")
let sparklingHeart = "\u{1F496}"  // Other escape characters: \0, \t, \\, \t, \n, \r, \", \'
print(sparklingHeart)

// Combining Unicode Scalars
print("\u{E9}")  // é with one scalar
print("\u{65}\u{301}")  // é by combining two scalars e + ´

// We can count the number of "characters" in a string by human
// readable characters and by unicode scalars.
print("Cat😺".characters.count)  // 4
print("é".unicodeScalars.count)  // 1
print("\u{E9}".unicodeScalars.count)  // 1
print("\u{65}\u{301}".unicodeScalars.count)  // 2

// Strings are indexed by String.Index, not Integers
var catString = "Cat😺"

print(catString.startIndex)  // Index of the first element
print(catString.endIndex)  // Index after the last element
print(catString[catString.startIndex])
print(catString[catString.index(before: catString.endIndex)])
print(catString[catString.index(catString.startIndex, offsetBy: 3)])

// Loop through Strings' Characters' Indexes
for index in catString.characters.indices {
    print(catString[index])
}

catString.insert(":", at: catString.index(before: catString.endIndex))
catString.insert(" ", at: catString.index(before: catString.endIndex))
catString.remove(at: catString.index(catString.startIndex, offsetBy: 3))
print(catString)

let range = catString.startIndex...catString.index(catString.startIndex, offsetBy: 3)
catString.removeSubrange(range)
print(catString)
