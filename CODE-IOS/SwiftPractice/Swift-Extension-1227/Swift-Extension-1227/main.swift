//
//  main.swift
//  Swift-Extension-1227
//
//  Created by bss on 12/27/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

import Foundation

print("Hello, World!")
//MARK: --Extension

//extension Int {
//    func repetitions(task: () -> ()) {
//        for i in 0...self {
//            print(i)
//            task()
//            
//        }
//    }
//}
//
//let IntValue = 3
//IntValue.repetitions({
//    print("hello")
//})
//
//3.repetitions{
//    print("good")
//}
//
//extension Int {
//     mutating func square() {
//        self = self * self
//    }
//}
//
//var someInt = 3
//someInt.square()

//MARK: 下标（Subscripts）


extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0...digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print(525235[0])





