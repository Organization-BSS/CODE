//
//  main.swift
//  Swift_Protocol_1227
//
//  Created by bss on 12/27/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

import Foundation

print("Hello, World!")

//MARK: 协议 Protocol

protocol SomeProtocol {
    // 协议内容
}

protocol SomeProtocol2 {
    // 协议内容
}

//MARK: 多个协议

struct SomeStructure: SomeProtocol,SomeProtocol2 {
    // 结构体内容
}

//MARK: 含有父类和协议，协议放在父类后边


//MARK: 属性要求
protocol AnotherProtocol {
    var musBeSettable : Int { get set}
    var doesNotNeedToBeSettable: Int {get}
}

// 用类实现协议 使用static 关键字


protocol AnotherProtocol1 {
    static var someTypeProperty: Int {get set}
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "john")

class Starship: FullyNamed {
    var name: String
    var prefix: String?
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return  name
    }
}

//MARK: 突变方法
protocol Togglable {
    mutating func toggle()
}

enum onOffSwitch: Togglable {
    case off,on
    mutating func toggle() {
        switch self {
        case .off:
            self = on
        case .on:
            self = off
        }
    }
}

var lightSwitch = onOffSwitch.off
lightSwitch.toggle()

//MARK: 协议类型


//MARK: 委托代理


protocol ProtocolDelegate {
    var objectName: String{set get}
    func run(st: String)
}

class ClassOne: ProtocolDelegate {
    var objectName: String {
        set(newObject) {
            self.objectName = newObject
        }
        get {
            return self.objectName
        }
    }
    func run(st: String) {
        print("\(st) run_one")
    }
}

class ClassTwo {
    var delegate:ProtocolDelegate?
    func println(ue: String) {
        if delegate != nil {
            delegate?.run(ue)
        }
    }
}

var two = ClassTwo()
var one = ClassOne()
two.delegate = one
two.println("gwgew")


let things: [ProtocolDelegate] = [one,one]




@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int {get}
}
@objc class Counter: NSObject{
    
}

    
    














