//
//  Control.m
//  DesignPattern_CommondPattern
//
//  Created by bss on 12/1/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "Control.h"

@implementation Control
- (id)initWithCommondOn:(id<Commond>)turnOn TurnOff:(id<Commond>)turnOff {
    self = [super init];
    TurnOn = turnOn;
    TurnOff = turnOff;
    return self;
}

- (void)turnOn {
    [TurnOn execute:nil];
}
- (void)turnOff {
    [TurnOff execute:nil];
}
@end
