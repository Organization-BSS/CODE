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


