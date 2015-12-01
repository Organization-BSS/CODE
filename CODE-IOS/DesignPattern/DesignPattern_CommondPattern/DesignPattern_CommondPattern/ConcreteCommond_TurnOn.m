//
//  ConcreteCommond_TurnOn.m
//  DesignPattern_CommondPattern
//
//  Created by bss on 12/1/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "ConcreteCommond_TurnOn.h"

@implementation ConcreteCommond_TurnOn

- (id)initWithTv:(TV *)TV {
    self = [super init];
    tv = TV;
    return self;

}
- (void)execute:(id)object {
    [tv turnOn];
}
@end
