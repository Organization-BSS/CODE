//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 构造器 析构器
*/

// 构造器

struct Fahrenherit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenherit()
print("this is default temprature")

struct Point {
    var point_x: Double = 0.0
    init(fromPoint_x point_x_x: Double) {
        point_x = point_x_x
    }
}

let point = Point(fromPoint_x: 233)

print(point.point_x)

// 常量的修改,这里的意思就是在构造器结束之前都可以修改
class SurveyQequestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}


//2015.12.23"23:00 看到 值类型的构造器代理部分

// 类的继承和构造过程

//指定构造器和便利构造器


class  Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[unamed]")
    }
}

let Food_one = Food()
print(Food_one.name)

let Food_two = Food(name: "banana")
print(Food_two.name)


class RecipeIngredient: Food {
    var quantity: Int
    init(name: String,quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
}

// 通过必包和函数来设置属性的默认值









