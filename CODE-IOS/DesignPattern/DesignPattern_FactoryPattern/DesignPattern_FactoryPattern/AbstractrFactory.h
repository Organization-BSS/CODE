//
//  AbstractrFactory.h
//  DesignPattern_FactoryPattern
//
//  Created by bss on 12/14/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractPruduct_Car.h"
@protocol AbstractrFactory <NSObject>
- (id<AbstractPruduct_Car> )create;
@end
