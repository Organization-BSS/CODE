//
//  main.m
//  Tech_OC_01
//
//  Created by bss on 11/28/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "Person.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        //[]
        Person * liyingpu = [[Person alloc]init];
        int y =  [liyingpu run:13];
        printf("%d\n",y);
        
    }
    return 0;
}

