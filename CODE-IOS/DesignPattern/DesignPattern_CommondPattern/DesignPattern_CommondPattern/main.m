//
//  main.m
//  DesignPattern_CommondPattern
//
//  Created by bss on 12/1/15.
//  Copyright © 2015 DevilTraining. All rights reserved.
//

// 参考文件网址http://blog.csdn.net/jason0539/article/details/45110355

#import <Foundation/Foundation.h>
#import "TV.h"
#import "AbstractCommond.h"
#import "ConcreteCommond_TurnOff.h"
#import "ConcreteCommond_TurnOn.h"
#import "Control.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    
        // 命令接受者
        TV *tv = [[TV alloc]init];
        
        // 开机命令
        id<Commond> TurnOnCommond = [[ConcreteCommond_TurnOn alloc]initWithTv:tv];
        
        // 关机命令
        id<Commond> TurnOffCommond = [[ConcreteCommond_TurnOff alloc]initWithTV:tv];
        
        // 命令控制对象
        Control *control = [[Control alloc]initWithCommondOn:TurnOnCommond TurnOff:TurnOffCommond];
        
        [control turnOn];
        [control turnOff];
        
    }
    return 0;
}

