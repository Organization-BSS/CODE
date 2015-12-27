//
//  main.swift
//  Swift_OptionalChaining_1226
//
//  Created by bss on 12/26/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

//MARK: 标题－－自判断链接

import Foundation

print("Hello, World!")

//MARK: 强制拆包

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let person = Person()
// 强制拆包
//let roomCount = person.residence!.numberOfRooms

// 自判断链接
if let roomCount = person.residence?.numberOfRooms {
    print("person's residence has \(roomCount) rooms")
} else {
    print("unable to retrieve the number of rooms")
}

//MARK: 为判断链接定义模型类




