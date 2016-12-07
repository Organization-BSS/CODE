//
//  ConcreteDecorator2.m
//  DesignPattern_Decorator
//
//  Created by bss on 12/7/16.
//  Copyright (c) 2016 DevilTaining. All rights reserved.
//

#import "ConcreteDecorator2.h"

@implementation ConcreteDecorator2

- (void)doSomeThing {
    [super doSomeThing];
    [self doAnotherThings];
}

- (void)doAnotherThings {
    NSLog(@"功能d");
}
@end
