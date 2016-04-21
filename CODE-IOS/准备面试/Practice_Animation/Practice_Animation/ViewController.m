//
//  ViewController.m
//  Practice_Animation
//
//  Created by bss on 4/20/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testPopAnimation {
    
    // add test view
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 300, 300)];
    vi.backgroundColor = [UIColor redColor];
    [self.view addSubview:vi];
    
    /**
     add pop animation
     */
    // POPBasicAnimation
    
  
}

@end
