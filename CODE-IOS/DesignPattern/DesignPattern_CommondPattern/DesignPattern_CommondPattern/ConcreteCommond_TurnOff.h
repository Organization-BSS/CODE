//
//  ConcreteCommond_TurnOff.h
//  DesignPattern_CommondPattern
//
//  Created by bss on 12/1/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractCommond.h"
#import "TV.h"

@interface ConcreteCommond_TurnOff : NSObject <Commond> {
    TV *tv;
}
- (id)initWithTV:(TV *)TV;
@end
