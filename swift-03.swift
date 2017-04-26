
// #3: Classes, Structs, ...

import Foundation

class Car {
    var brand: String
    var model: String
    var year: Int
    
    init (_ brand: String, _ model: String, _ year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
    
    func beep() -> String {
        print("\(brand) \(model) \(year) Beeps!")
        return "\(brand) \(model) \(year) Beeps!"
    }
}

class House {
    var location: String
    var price: Double
    var salePrice: Double
    
    init (at location: String, costing price: Double, withSale salePercent: Int) {
        self.location = location
        self.price = price
        self.salePrice = Double(salePercent) * self.price
    }
    
    func printHouseLocation() {
        print(location)
    }
}

struct Dog {
    var name: String
    
    // Override default automatic init
    init (_ name: String!) {
        self.name = name
    }
    
    func bark() -> String {
        print("\(name) Barks!")
        return "\(name) Barks!"
    }
    
    func does(_ something: String) -> String {
        print("\(name) is \(something)ing")
        return "\(name) is \(something)ing"
    }
}

let car = Car("Ferrari", "California", 2012)
let house = House(at: "Los Angeles, Hollywood Boulevard, 132", costing: 800000, withSale: 5)
let dog = Dog("Jasper")

_ = car.beep()
house.printHouseLocation()
_ = dog.bark()

let hatiko = Dog("Hatiko")
_ = hatiko.does("wait")

// Assigning a struct to another variable or constant makes a copy
let anotherDog = hatiko

// Car is a class, so assigning car of type Car to a constant made this constant point to the original instance
let anotherCar = car  // anotherCar points to car

// Identity Operator
if hatiko === anotherDog {
    print("hatiko is identical to anotherDog")
}
