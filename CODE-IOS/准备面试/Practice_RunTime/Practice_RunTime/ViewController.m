//
//  ViewController.m
//  Practice_RunTime
//
//  Created by bss on 6/4/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "ViewController.h"
#import "TestClass.h"
#import <objc/runtime.h> // 包含对类，成员变量，属性，方法的操作
#import <objc/message.h> // 包含消息机制
#import "NSMutableArray+fe.h"
//#import "FirstClass.h"
//#import "SecondClass.h"
//#import "ThirdClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self practiceRunTime];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 study runtime technology
 */
// study RunTime
- (void)practiceRunTime {
    
#pragma mark -- 遍历一个类的全部成员变量
    /*
     利用runtime遍历一个类的全部成员变量
     */
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([TestClass class], &count); // 获得一个指向改类成员变量数组的一个指针
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        NSLog(@"%d---%@",i,key);
    }
    free(ivars);
    
#pragma mark -- 遍历一个类的全部属性
 
    /*
     利用runtime遍历一个类的全部属性
     */
    
    unsigned int count2 = 0;
    objc_property_t *properties = class_copyPropertyList([TestClass class], &count2);
    for (int i = 0; i < count2; i++) {
        // 捕获每一个property
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:name];
        NSLog(@"%d--%@",i,key);
    }
    free(properties);
    // 获取方法列表
    Method  *methodList = class_copyMethodList([TestClass class], &count);
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method---%@",NSStringFromSelector(method_getName(method)));
    }
    
#pragma mark -- 测试交换方法
    Method m1 = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method m2 = class_getInstanceMethod([NSString class], @selector(uppercaseString));
    method_exchangeImplementations(m1, m2);
    NSLog(@"%@",[@"sssAAAss" lowercaseString]);
    NSLog(@"%@",[@"sssAAAss" uppercaseString]);
    
#pragma mark -- 消息机制
//    NSArray *array = @[NSStringFromClass([FirstClass class]),NSStringFromClass([SecondClass class]),NSStringFromClass([ThirdClass class])];
    NSArray  *array = @[@"FirstClass",@"SecondClass",@"ThirdClass"];
    for (NSString *str in array) {
        Class class = NSClassFromString(str);
        NSObject *object = objc_msgSend(objc_msgSend(class, sel_registerName("alloc")), sel_registerName("init"));
        objc_msgSend(object, @selector(show));
    }
    


    
    
}

@end
