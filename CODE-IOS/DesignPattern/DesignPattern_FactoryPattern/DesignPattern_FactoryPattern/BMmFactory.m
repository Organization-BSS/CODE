//
//  BMmFactory.m
//  DesignPattern_FactoryPattern
//
//  Created by bss on 12/14/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "BMmFactory.h"

@implementation BMmFactory
- (id<AbstractPruduct_Car> )create {
    ConcretePruduct_BMWCar *bmw = [[ConcretePruduct_BMWCar alloc]init];
    return bmw;
}
@end
