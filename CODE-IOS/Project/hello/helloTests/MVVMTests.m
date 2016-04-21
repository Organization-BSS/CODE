//
//  MVVMTests.m
//  hello
//
//  Created by bss on 3/5/16.
//  Copyright © 2016 DevilTaining. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MVVMTests : XCTestCase

@end

@implementation MVVMTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSLog(@"THIS is testExample");
    int a = 3;
    XCTAssertTrue(a>2,"a can't equal 8");
    XCTAssertNotNil(self,"can't find a");
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
- (void)add {
    NSLog(@"this the add function");
}
@end
