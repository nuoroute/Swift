
// #5: Enumerations

import Foundation

// Basic Syntax
enum Car {  // Singular, not plural name!
    case nissan
    case toyota
    case jeep
}

// or

enum FastCar {  // Singular, not plural name!
    case ferrari, tesla, mazda
}

// Using an enum
var fastCar = FastCar.ferrari

// Once fastCar is declared as a FastCar type, you can use the following syntax
fastCar = .tesla

// Match an enum value using a switch statement
switch fastCar {
case .ferrari:  // using . syntax because the type of fastCar is FastCar
    print("ferrari")
case .tesla:
    print("tesla")
case .mazda:
    print("mazda")
}

// Enums can have associated values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// Using this enum
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

// Switching on this enum
switch productBarcode {
case upc(let numberSystem, let manufacturer, let product, let check):
    print("upc: \(numberSystem), \(manufacturer), \(product), \(check)")
case qrCode(let productCode):
    print("qrCode: \(productCode)")
}

// Raw Values
enum ASCIIControlCharacters: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Implicitly assigned raw values
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// Using this enum
var earthNumber = Planet.earth.rawValue

// Enums automatically receive an initializer if a raw value type is assigned
enum Country: String {
    case USA = "United States of America"
    case UK = "United Kingdom"
}

var usa: Country? = Country(rawValue: "United States of America")  // returns Country.USA
var uk: Country? = Country(rawValue: "Great Britain")  // returns nil
