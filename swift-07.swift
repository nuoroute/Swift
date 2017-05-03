
// #7: Inheritance

import Foundation

// Base class
class Vehicle {
    var type: String!
    var serialNumber: Int!
    
    var description: String {
        return "Vehicle of type \(type) with serial number \(serialNumber)"
    }
}

class Car: Vehicle {
    var brand: String!
    var model: String!
    var numberOfPassengers: Int!
    
    func beep() {
        print("\(brand) \(model) beeps!")
    }
    
    override var description: String {
        return super.description + "can take \(numberOfPassengers) passengers"
    }
}

// Final classes (or properties) cannot be subclassed (or overriden)
final class ElectricCar: Car {
    var milesPerOneBatteryCharge: Int!
    
    override func beep() {
        super.beep()
        print("An electric \(brand) \(model) beeps!")
    }
}
