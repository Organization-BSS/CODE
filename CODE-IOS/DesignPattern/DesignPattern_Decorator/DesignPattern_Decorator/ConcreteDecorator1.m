//
//  ConcreteDecorator1.m
//  DesignPattern_Decorator
//
//  Created by bss on 12/7/16.
//  Copyright (c) 2016 DevilTaining. All rights reserved.
//

#import "ConcreteDecorator1.h"

@implementation ConcreteDecorator1

- (void)doSomeThing {
    [super doSomeThing];
    [self doAnotherThing];
}

- (void)doAnotherThing {
    NSLog(@"doAnotherThing 功能c ");
}
@end
