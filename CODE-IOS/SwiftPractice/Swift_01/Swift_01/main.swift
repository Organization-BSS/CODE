//
//  main.swift
//  Swift_01
//
//  Created by bss on 12/1/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

import Foundation

print("Hello, World!")

var myVarable = "e"

let myLet = 43
print(myLet)
//myLet = 23 //let is let can't change

myVarable = "fwe"
print(myVarable)

var expliciteDouble: Double = 7
print(expliciteDouble)

expliciteDouble = 7.3
print(expliciteDouble)

let expliciteFloat: Float = 9.9
print(expliciteFloat)

let label = "The width is "
let width = 73
let widthLabel = label + String(width)
print(widthLabel)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
print(appleSummary)

let fruiSummary = "I have \(apples + oranges) pieces of fruit"
print(fruiSummary)

// 数组
var shoppingList = ["ew","ge","wb","tr"," x"]
print(shoppingList[0])

var emptyArray = [String]()
emptyArray.append("few")

var shoppings = []
print("hel\(shoppings)")


var occupations = ["key1": "hello","key2": "hi"]
occupations["key3"] = "nihao"
print(occupations)

var emptyDictionay = [String: Float]()

// control flow

if (emptyArray.count == 0) {
    print("this array is empty")
} else {
    print("this array is not empty")
}

// conditional must be a boolean expression

let individualScores = [73,33,98,32]
var teamScores = 0
for score in individualScores {
    if score > 50 {
        teamScores += 3
    } else {
        teamScores += 1
    }
}
print(teamScores)

// use if and let work together

var optionalString: String? = "hello"
print(optionalString == nil)

//var optionalName: String? = "John Applessed"
var optionalName: String? = nil

var greeting = "Hello!";
if let name = optionalName {
    greeting = "Hello, \(name)";
}

print(optionalName)
print(greeting)


//MARK:- SWITCH

let vegetable = "red papper"
var vegetakb:String ;
switch vegetable {
    case "celery":
         vegetakb = "add some comments"
    case let x where
        x.hasSuffix("papper"):
          vegetakb = "Is it a spicy \(x)?"
default:
     vegetakb = "ve"
}
print(vegetable)
print(vegetakb)

//MARK:- FOR IN

let interestingNumbers = ["Prime": [2,3,4535,35], "Fibonacci": [1,2,3,4,5],"Square": [1,4,5,2,75]]
var largets = 0
for (king,numbers) in interestingNumbers {
    for number in numbers {
        if number > largets {
            largets = number
        }
    }
}
print(largets)


//MARK:- WHILE

var intege = 0
while intege < 9 {
    print(intege)
    intege++
}

repeat {
    intege++
    print(intege)
} while intege < 20


//MARK:- Funtions and Closures

func greet(name: String, day: String) -> String {
    return "hello \(name),today is \(day)day"
}
print(greet("Bob", day:"Tuesday"))

func calculateStatistics(scores: [Int]) ->(min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
         max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min,max,sum)
}

let statistics = calculateStatistics([5, 3,133, 23, 234])
print(statistics.sum)
print(statistics.min)

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
        
    }
    return sum
}

print(sumOf())
print(sumOf(2, 43, 53))

func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    add()
    return y
}
print(returnFifteen())

//MARK:- Class and Object

class Car {
    var carName:String
    init(carName: String) {
        self.carName = carName
        print(carName)
    }
    func run(times: String)->String {
        print(times)
        print(self.carName)
        return times
    }
}

var benCar = Car(carName: "this is benCar")
benCar.carName = "BenChi"
benCar.run("23")

class BenCar: Car {
    var price: Double = 0.0
    var productSerials: String
    init(price: Double,productSerial: String,carName: String) {
        self.price = price
        self.productSerials = productSerial

        super.init(carName: carName)
    }
    override func run(times: String) -> String {
        super.run(times)
        print("this is bencar run")
        return "this is bencar run "
    }
}

let test = BenCar(price: 23.9, productSerial: "peiking", carName: "benchi")
test.run("thllo")

//MARK:- set and get method
class EquilateralTriangle {
    var sideLength: Double = 0.0
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength
    }
}