//
//  Decorator.m
//  DesignPattern_Decorator
//
//  Created by bss on 12/7/16.
//  Copyright (c) 2016 DevilTaining. All rights reserved.
//

#import "Decorator.h"

@implementation Decorator
- (id)init:(id<Component>)com {
    component = com;
    self = [super init];
    return self;
}

- (void)doSomeThing {
    [component doSomeThing];
}
@end
