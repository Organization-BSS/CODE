//
//  ViewController.m
//  Practice_Network
//
//  Created by bss on 4/15/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "ViewController.h"
#import "Test_afnetworking.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface ViewController () {
    Test_afnetworking *testaf;
}

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

// test
- (void)test {
    AFNetworkActivityIndicatorManager *manager = [AFNetworkActivityIndicatorManager sharedManager];
    manager.enabled = YES;
    testaf = [[Test_afnetworking alloc]init];
//    [testaf test_AF_get];
//    [testaf test_AF_post];
    [testaf downloadFiles];

    
}




- (IBAction)suspendDownload:(id)sender {
    [testaf suspendDownloadFile];
    
}

- (IBAction)goonDownload:(id)sender {
    [testaf goonDownload];
}
@end
