//
//  main.swift
//  Swift_enclosure
//
//  Created by bss on 1/8/16.
//  Copyright © 2016 DevilTaining. All rights reserved.
//

import Foundation

print("Hello, World!")
/* 闭包运算 */


//MARK: first type
let exmple = { print("this is bi bao")}
exmple()

let exmple2 = {(i:Int)->(Int) in return i}
var intValue = exmple2(3)
print(intValue)

//MARK: 多参数
let closure_one = {(i: Int,j: Int) ->(Int) in return i*j}
var resutl_one = closure_one(3,5)
print(resutl_one)

//MARK: sort 排序
let strings = ["ou","ad","tr"]
func forward(st1: String,st2: String) -> Bool {
    return st1 > st2
}
var reversed = strings.sort(forward)
print(reversed)

let names = ["AT", "AE", "D", "S", "BE"]
var reversed_two = names.sort({$0 > $1})
print(reversed_two)


//MARK: 闭包运算符函数
var reversed_three = names.sort(>)
print(reversed_three)

//MARK:尾随闭包 不是很明白啊
//尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
// 以下是使用尾随闭包进行函数调用
func someFunctionThatTakesAClosure() {
    // 闭包主体部分
}

//MARK: 捕获值
func makeIncrements(incrementsf amount:Int) -> ()->Int {
    var runningTotal = 0
    func incretor() ->Int {
        runningTotal+=amount
        return runningTotal
    }
    return incretor
}

var result_four = makeIncrements(incrementsf: 3)
print(result_four())


