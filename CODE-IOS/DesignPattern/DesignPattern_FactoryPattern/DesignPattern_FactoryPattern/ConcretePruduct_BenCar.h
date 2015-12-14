//
//  ConcretePruduct_BenCar.h
//  DesignPattern_FactoryPattern
//
//  Created by bss on 12/14/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractPruduct_Car.h"

@interface ConcretePruduct_BenCar : NSObject <AbstractPruduct_Car
>
- (void)run:(id)object;

@end
