//
//  main.swift
//  Swift_enum
//
//  Created by bss on 1/9/16.
//  Copyright © 2016 DevilTaining. All rights reserved.
//

import Foundation

print("Hello, World!")

//MARK: 枚举类型

enum DayWeek {
    case Sunday
    case Monday
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case Friday
    case Saturday
}

var weekday = DayWeek.THURSDAY
weekday = .Monday
switch weekday {

case DayWeek.Sunday:
    print("this is Sunday")
case .Monday:
    print("this is Monday")
default:
    print("this is other's day")
}

//MARK: 相关值
//相关值是当你在创建一个基于枚举成员的新常量或变量时才会被设置，并且每次当你这么做得时候，它的值可以是不同的。
enum Student {
    case Name(String)
    case Mark(Int,Int,Int)
}

var studentA = Student.Name("JONY")
studentA = .Mark(2, 3, 4)
switch studentA {
 case Student.Name(let name):
    print("this is name: \(name)")
case Student.Mark(let i,let j,let q):
    print("this is \(i) \(j) \(q)")
}

//MARK: 原始值

enum Month:Int {
    case January = 1,
    Febrary,
    March,
    April,
    May,
    June
}

let month = Month.May
print(month)