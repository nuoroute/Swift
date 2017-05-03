//
//  main.swift
//  Initialization
//
//  Created by Constantine Shatalov on 5/3/17.
//  Copyright © 2017 New Route. All rights reserved.
//

//  08 - Initialization

import Foundation

class Computer {
    // These properties need an initializer
    let brand: String
    let model: String
    let cpu: String
    
    // This property is initialized automatically with 'nil'
    var ram: String!
    
    init(brand: String, model: String, cpu: String) {
        self.brand = brand
        self.model = model
        self.cpu = cpu
    }
}

class Notebook: Computer {
    //
}

// self.init
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)  // Using an init inside of an init
    }
}
