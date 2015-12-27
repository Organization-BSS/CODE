//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// ARC 实践

class Person {
    let name: String = "few"
    init() {
        print("\(self.name) is being initialized")
    }
    
    deinit {
        print("\(self.name) is being deinitialized")
    }
}


var person1: Person?
var person2: Person?
var person3: Person?

person1 = Person()
person2 = person1
person3 = person2
print(person2!.name)

person1 = nil
person2 = nil
person3 = nil

print(person2)
person2.debugDescription
