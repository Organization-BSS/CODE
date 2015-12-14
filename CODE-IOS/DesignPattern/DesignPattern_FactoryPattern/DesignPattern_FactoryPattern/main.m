//
//  main.m
//  DesignPattern_FactoryPattern
//
//  Created by bss on 12/14/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractrFactory.h"
#import "AbstractPruduct_Car.h"
#import "BenFactory.h"
#import "BMmFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        // create ben car
        id <AbstractrFactory> factory = [[BenFactory alloc]init];
        id <AbstractPruduct_Car> car = [factory create];
        [car run:nil];
        
        // create bmw car
        id <AbstractrFactory> factory1 = [[BMmFactory alloc]init];
        id <AbstractPruduct_Car> car1 = [factory1 create];
        [car1 run:nil];
    }
    return 0;
}



