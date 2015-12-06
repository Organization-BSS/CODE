//
//  ViewController.m
//  DfshBookCar
//
//  Created by bss on 12/2/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "ViewController.h"
#import "TestFile.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// test method
- (void)test {
    TestFile  *testFile = [[TestFile alloc]init];
    [testFile test];
}
@end
