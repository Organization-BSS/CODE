//
//  main.m
//  DesignPattern_Decorator
//
//  Created by bss on 12/7/16.
//  Copyright © 2016 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"
#import "ConcreteComponent.h"
#import "ConcreteDecorator1.h"
#import "ConcreteDecorator2.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        id<Component> component = [[ConcreteComponent alloc]init];
        
        [[[ConcreteDecorator1 alloc]init:component]doSomeThing];
        [[[ConcreteDecorator2 alloc]init:component]doSomeThing];
    }
    return 0;
}


