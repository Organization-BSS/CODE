//
//  main.swift
//  Swift_ARC_1226
//
//  Created by bss on 12/26/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

import Foundation

print("Hello, World!")

//MARK: 1.对象的创建和销毁

class Person {
    let name: String = "gew"
    init() {
        print("this a person init")
    }
    deinit {
        print("the person released")
    }
}

var person1: Person?
person1 = Person()
person1 = nil


var person2:Person? = Person()
person2 = nil

//MARK: 2.类实例间的强引用环

//class PerSonn {
//    var name: String?
//    var apartment: ApartMent?
//    init() {
//        print("object is initiliazed")
//    }
//    deinit {
//        print("Person object is deinited")
//    }
//}
//
//class ApartMent {
//    var name: String?
//    var person: PerSonn?
//    init() {
//        print("ApartMent object is initiliazed")
//    }
//    deinit {
//        print("ApartMent object is deinited")
//    }
//    
//}
//
//var person: PerSonn? = PerSonn()
//var apart : ApartMent? = ApartMent()
//
//person!.apartment = apart
//apart!.person = person
//
//person?.apartment = nil
//apart?.person = nil
//
//person = nil
//apart = nil
//
//MARK: 3.解决实例间的强引用环

//MARK: weak
class PerSonn {
    var name: String?
    var apartment: ApartMent?
    init() {
        print("object is initiliazed")
    }
    deinit {
        print("Person object is deinited")
    }
}

class ApartMent {
    var name: String?
    weak   var person: PerSonn?
    init() {
        print("ApartMent object is initiliazed")
    }
    deinit {
        print("ApartMent object is deinited")
    }
    
}

var person: PerSonn? = PerSonn()
var apart : ApartMent? = ApartMent()

person!.apartment = apart
apart!.person = person

person = nil
apart = nil

//MARK: 无主引用 unowned

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let nubmer: Int
    weak var customer: Customer?
    init(number: Int,customer: Customer) {
        self.nubmer = number;
        self.customer = customer;
    }
    deinit {
        print("car #\(nubmer) is being deinitialed")
    }
}

var customer: Customer? = Customer(name: "jony")

customer!.card = CreditCard(number: 2324242, customer: customer!)
customer = nil

 


//MARK: 无主引用以及隐式展开的可选属性


//class Country {
//    let name: String
//    let capitalCity: City!
//    init(name: String,capitalName: String) {
//        self.name = name
//
//        self.capitalCity = City(name:capitalName, country:self);
//
//    }
//}
//
//class City {
//    let name: String
//    unowned let country: Country
//    init(name: String, country: Country) {
//        self.name = name
//        self.country = country
//    }
//    
//}

//MARK:6.闭包产生的强引用环

/*
class HTMLElement {
    var name: String
    let text: String?
    lazy var asHMTL: () ->String = {
        if let text = self.text {
            return "html \(self.name) > \(self.text)>"
        }
            else {
                return "html \(self.name)"
            }
        
    }
    init(name: String,text: String?) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "P", text: "hello world")
print(paragraph!.asHMTL())

paragraph = nil
*/

// MARK: 解决闭包产生的强引用环

// MARK: 弱引用和无主引用

class HTMLElement {
    var name: String
    let text: String?
    lazy var asHMTL: () ->String = {
    [unowned self] in
        if let text = self.text {
            return "html \(self.name) > \(self.text)>"
        }
        else {
            return "html \(self.name)"
        }
        
    }
    init(name: String,text: String?) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "P", text: "hello world")
print(paragraph!.asHMTL())

paragraph = nil









