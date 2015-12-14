//
//  BenFactory.m
//  DesignPattern_FactoryPattern
//
//  Created by bss on 12/14/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "BenFactory.h"

@implementation BenFactory
- (id<AbstractPruduct_Car> )create {
    
    ConcretePruduct_BenCar *ben = [[ConcretePruduct_BenCar alloc]init];
    return ben;
}
@end
