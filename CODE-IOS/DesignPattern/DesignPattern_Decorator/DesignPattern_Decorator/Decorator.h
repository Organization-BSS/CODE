//
//  Decorator.h
//  DesignPattern_Decorator
//
//  Created by bss on 12/7/16.
//  Copyright (c) 2016 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"

@interface Decorator : NSObject <Component> {
    id<Component> component;

}
- (id)init:(id<Component>)com;

@end
