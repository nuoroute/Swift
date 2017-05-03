
// #6: Classes and Structures

import Foundation

// Structs and Enums are value types, and are copied when passed around
// Classes are reference types

struct Specs {
    var horsePower = 0
    var torque = 0
}

class Car {
    var brand = ""
    var model = ""
    var specs = Specs()
}

let nissan240 = Car()
nissan240.brand = "Nissan"
nissan240.model = "240sx"
nissan240.specs = Specs(horsePower: 230, torque: 178)

// Declare a pointer to the nissan240 instance, don't create a new instance
let anotherNissan240 = nissan240

// Identity operator checks if two pointers point to the same instance of the class
if nissan240 === anotherNissan240 {
    print("It's the same instance")
}

// Default initializer (initializes all the vars to their default values)
let ferrari = Car()

// Unlike classes, all sctructs have an automatic memberwise initializer 
ferrariSpecs = Specs(horsePower: 750, torque: 650)
teslaModelS = Car(brand: "Tesla", model: "Model S", specs: ferrariSpecs)  // Error

// Properties
// Enums can't have stored properties, classes and structures can

// Lazy initialization - initialize only when used for the first time
class SomeHeavyClass {
    let x = 0.0
    let y = 0.0
    
    var computedProperty: Double {
        get {
            return x * y
        }
        
        set {
            x = newValue / 10
            y = newValue / 10
        }
    }
    
    var readOnlyComputedProperty: Double {
        return x * y
    }
}

class SomeClass {
    lazy let heavyInstance = SomeHeavyClass()
}

// Propety Observers and Type Properties (Static Properties)
class Car {
    static let modelNumber: Int
    
    class var serialNumber: Int {  // Static or Class read only computed property
        return modelNumber + 10
    }
    
    var horsePower = 0 {  // Property Observer
        wilSet {
            print("Setting horsePower to \(newValue)")
        }
        
        didSet {
            print("Previous value: \(oldValue)")
        }
    }
}

// Mutating Methods and Type Methods
class Ferrari {
    var model: String!
    var yearManufactured: Int!
    
    mutating func increaseYearManufactured(by: Int) {
        yearManufactured += 1
    }
    
    class func printBrandName() {
        print("Ferrari")
    }
}
