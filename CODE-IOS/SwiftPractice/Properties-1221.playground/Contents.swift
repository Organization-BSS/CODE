//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Properties 

// Computed Properties 
struct Size {
    var width = 0.0, height = 0.0
}

struct Poin {
    var x = 0.0 ,y = 0.0
}

struct Rect {
    var origin = Poin()
    var size = Size()
    var center :Poin {
        get {
            let  centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Poin(x: centerX, y: centerY)
        }
         
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Poin(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
square.center = Poin(x: 15.0, y: 13.0)

print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


