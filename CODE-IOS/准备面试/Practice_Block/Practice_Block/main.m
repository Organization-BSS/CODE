//
//  main.m
//  Practice_Block
//
//  Created by bss on 5/28/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstClass.h"
#import "SecondClass.h"

// test block


void add(int l) {
    ++l;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
  
        // use  key words "__block" to change the variable value
       __block int  n = 1;
        int ( ^ReturnValueBlock)(int i,int j) = ^( int i,int j) {
            n = n + 2;
            return i+j;
        };
        int l = ReturnValueBlock(n,5);
        NSLog(@"%d",n);
        
        // variable n not change due to this this a transfer value ,not the origion value
        add(n);
        NSLog(@"%d",n);


    }
    return 0;
}
