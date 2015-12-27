//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Car {
  static  var carName: String?
    var price: Double = 0.0;
    func run() {
        print("car run")
    }
    func description()->NSString {
        return "this car's price is:\(price)"
    }
    init(price: Double, color: String) {
        self.price = price
    }
}

class BenCar: Car {
    var color: String = ""
    override func run() {
        print("bencarrun")
    }
    override func description() -> NSString {
        return "this is a override function"
    }
    override var price: Double {
        get {
            return super.price;
        }
        set {
            super.price = min(newValue, 40)
        }
    }
    
    
}

var car_ben = BenCar(price: 232, color: "gew")
car_ben.price = 234
BenCar.carName = "BenChi"
print(car_ben.description())
print(car_ben.price)
print(BenCar.carName)


car_ben.run();


class AutomaticCar:Car {
    var gear = 1
    override var price: Double {
        didSet {
            print("this car's price is seted!")
        }
        
    }
}

//var auto = AutomaticCar(price: 123, color: "red")
//auto.price = 32532

class RedAutomaticCar: AutomaticCar {
    override var price: Double {
        didSet {
            print("this is a new redAutomaticCar ,you know")
        }
    }
}


var auto2 = RedAutomaticCar(price: 123, color: "red")
auto2.price = 32532

//MARK 防止重写

// @final 使用到上面的内容，以加速代码书写的速度。


// 构造过程





