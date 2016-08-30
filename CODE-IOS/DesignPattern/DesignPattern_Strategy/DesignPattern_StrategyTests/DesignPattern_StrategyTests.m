//
//  DesignPattern_StrategyTests.m
//  DesignPattern_StrategyTests
//
//  Created by bss on 16/8/1.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Discount.h"
#import "MovieTicket.h"
#import "ChildDiscount.h"
#import "StudentDiscount.h"

@interface DesignPattern_StrategyTests : XCTestCase

@end

@implementation DesignPattern_StrategyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

/**
 *  使用电影票的案例测试策略模式
 */
- (void)test2 {
    MovieTicket *ticket = [[MovieTicket alloc]init];
    ticket.price = 80; // ticket price
    
    id<Discount> discount = nil; // 初始化打折策略类
    
    // condition one :now it's a child's ticket
    discount = [[ChildDiscount alloc]init];
    
    // use strategy
    ticket.discount = discount;
    NSLog(@"%lf",[ticket getPrice]);
    XCTAssertEqual([ticket getPrice], 634,@"the value is not right");
    
}


@end
