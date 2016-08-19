//
//  UnitTestTests.m
//  UnitTestTests
//
//  Created by bss on 16/8/18.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Addition.h"

@interface UnitTestTests : XCTestCase {
    
@private
    Addition *addition;

}

@end

@implementation UnitTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"setup");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"tearDown");

}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"testExample");
}

- (void)testAddition {
    addition = [[Addition alloc]init];
    addition.leftValue = 5;
    addition.rightValue = 8;
    NSInteger totalValue = [addition addResult];
    XCTAssertEqual(totalValue, 15,@"function not right");
    
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSLog(@"measureBlock");

    }];
}

@end
