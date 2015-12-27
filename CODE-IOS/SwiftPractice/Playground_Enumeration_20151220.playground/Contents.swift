//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Enumeratoin test

enum CompassPoint {
    
    case North
    case South
    case East
    case West
}

var directionToHead = CompassPoint.West
directionToHead = .East

// Matching Enumeration Values with a Switch Statement

directionToHead = .South
//switch directionToHead {
//case .West:
//    
//}

enum ASCIIControlCharacter:Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

var ascii = ASCIIControlCharacter.CarriageReturn

enum IntegeVlue:Int {
    case one = 0
    case two = 23
    case three = 232
}

var invalue = IntegeVlue.three

switch invalue {
case .one:
    print("few")
case .two:
    print("fwgege")
case .three:
    print("lsvee")
}


enum Plannet: Int {
    case Mercury = 1,Venus,Earth,Mars,Jupiter,Sturn
}

var enum_plannet = Plannet.Earth
print(enum_plannet.rawValue)

// Initializing from a Raw Value



