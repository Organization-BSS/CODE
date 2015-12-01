//
//  ConcreteCommond_TurnOff.m
//  DesignPattern_CommondPattern
//
//  Created by bss on 12/1/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "ConcreteCommond_TurnOff.h"

@implementation ConcreteCommond_TurnOff

- (id)initWithTV:(TV *)TV {
    self = [super init];
    tv = TV;
    return self;
}

- (void)execute:(id)object {
    [tv turnOff];
}
@end
