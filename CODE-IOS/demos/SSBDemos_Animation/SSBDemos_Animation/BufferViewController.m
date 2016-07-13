//
//  BufferViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/7/7.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "BufferViewController.h"

@interface BufferViewController () {
    CALayer *colorLayer;
}


@end

@implementation BufferViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(50, 50, 200, 200);
    colorLayer.position = CGPointMake(150, 150);
    colorLayer.backgroundColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:colorLayer];
    
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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//   [CATransaction begin];
//    [CATransaction setAnimationDuration:1.0];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
//    colorLayer.position = [[touches anyObject] locationInView:self.view];
//    [CATransaction commit];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.50];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    colorLayer.position = [[touches anyObject] locationInView:self.view];
    [CATransaction commit];
}
@end
