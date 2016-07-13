//
//  CAShaperLayerViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/7/4.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "CAShaperLayerViewController.h"

@interface CAShaperLayerViewController ()

@end

@implementation CAShaperLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // create path
    UIBezierPath *path = [[UIBezierPath alloc]init];

    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    // create shape layer
    CAShapeLayer  *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [[UIColor redColor]CGColor];
    shapeLayer.fillColor = [[UIColor clearColor]CGColor];
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    // add it to our view
   // [self.view.layer addSublayer:shapeLayer];
    
    //define path parameters
    CGRect rect = CGRectMake(150, 150, 100, 100);
    CGSize radii = CGSizeMake(50, 50);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
    //create path
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    CAShapeLayer *shaper2 = [CAShapeLayer layer];
    shaper2.strokeColor = [[UIColor redColor]CGColor];
    shaper2.fillColor = [[UIColor clearColor]CGColor];
    shaper2.path = path2.CGPath;
    [self.view.layer addSublayer:shaper2];
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

@end
