//
//  Person.swift
//  SwiftAndOC_mix
//
//  Created by bss on 1/9/16.
//  Copyright © 2016 DevilTaining. All rights reserved.
//

import Foundation

class Person: NSObject {
    var name: String?
    init(name: String) {
        self.name = name;
    }
    deinit {
        print("the person named: \(self.name) say goodby")
    }
    
    func buyGoods() {
        let car:Card? = Card()
        car!.money = "253"
        car!.pay(23)
        Card.getCard(23242)
        
        
        
    }
}