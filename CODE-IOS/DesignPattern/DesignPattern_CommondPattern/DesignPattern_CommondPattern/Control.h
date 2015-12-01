//
//  Control.h
//  DesignPattern_CommondPattern
//
//  Created by bss on 12/1/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractCommond.h"
@interface Control : NSObject {
    id<Commond> TurnOn,TurnOff;
}
- (id)initWithCommondOn:(id<Commond>)turnOn TurnOff:(id<Commond>)turnOff;
- (void)turnOn;
- (void)turnOff;
@end
