//
//  AnimationViewController.m
//  FrameWork_Animation
//
//  Created by bss on 16/9/19.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor yellowColor];
    [self performSelector:NSSelectorFromString(NSStringFromSelector(@selector(example01)))];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark EXAMPLES

- (void)example01 {
    
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(30, 30, 300, 230);
    layer.backgroundColor = [[UIColor redColor]CGColor];
    [self.view.layer addSublayer:layer];
    for (NSObject * object in layer.sublayers) {
        NSLog(@"%@",object);
    }
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.bounds = CGRectMake(40, 40, 40, 40);
    maskLayer.cornerRadius = 20;
    maskLayer.position = layer.position;
    
    [self.view.layer addSublayer:maskLayer];

   layer.mask = maskLayer;
    
    
}
@end
