//
//  main.swift
//  Swift_类型转换－1227
//
//  Created by bss on 12/27/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

import Foundation

print("Hello, World!")

//MARK: 类型转换

class Item {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class SubItem1: Item {
    var description: String
    init(name: String,description: String) {
        self.description = description
        super.init(name: name)
    }
}

class SubItem2: Item {
    var subName: String
    init(name: String, subName: String) {
        self.subName = subName
        super.init(name: name)
    }
}


let liberary = [SubItem1(name: "T", description: "DE"),SubItem2(name: "R", subName: "E"),SubItem1(name: "HG", description: "GE")]


var sub1Count = 0
var sub2Count = 0

for item in liberary {
    if item is SubItem1 {
        ++sub1Count
    } else if item is SubItem2 {
        ++sub2Count
    }
}

print("this library has \(sub1Count) SubItem1 and \(sub2Count) SubItem2")

//MARK: 向下转型（简称 下转）


for item in liberary {
    if let sub1 = item as? SubItem1 {
        print("\(sub1.description)")
    } else if let sub2 = item as? SubItem2 {
        print("\(sub2.subName)")
    }
}

//MARK: Any 和 AnyObject 的转换

let someObjects: [AnyObject] = [
    SubItem1(name: "gew", description: "description1"),SubItem1(name: "name2", description: "description2")]

//for object in someObjects as! [SubItem1] {
//    print(object.name)
//}
for object in someObjects {
    let subItem1 = object as! SubItem1
    print(subItem1.name)
}

//MARK: Any类型

var things = [Any]()

things.append("3")
things.append(0)
things.append(SubItem1(name: "name1", description: "description1"))

for thing in things {
    
    switch thing {
    
    case 0 as Int:
        print("0 as an Int")
    case 0 as Double:
        print("0 as a double")
    default:
        print("other type's object")
        

    }
}





