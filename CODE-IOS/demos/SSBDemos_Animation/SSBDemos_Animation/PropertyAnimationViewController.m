//
//  PropertyAnimationViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/7/6.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "PropertyAnimationViewController.h"

@interface PropertyAnimationViewController ()

@end

@implementation PropertyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    CALayer *layer = [CALayer layer];
//    layer.frame = self.containerView.bounds;
//    layer.backgroundColor = [[UIColor redColor]CGColor];
//    [self.containerView.layer addSublayer:layer];
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(200, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    //draw the path using a CAShapeLayer
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    shapelayer.path = bezierPath.CGPath;
    shapelayer.fillColor = [[UIColor clearColor]CGColor];
    shapelayer.strokeColor = [UIColor redColor].CGColor;
    shapelayer.lineWidth = 3.0f;
    [self.containerView.layer addSublayer:shapelayer];
    
    // add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"girl.png"].CGImage;
    [self.containerView.layer addSublayer:shipLayer];
    
    //create the keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.path = bezierPath.CGPath;
    [shipLayer addAnimation:animation forKey:nil];
    
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

- (IBAction)changColor:(id)sender {
    UIColor *color = [UIColor yellowColor];
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)color.CGColor;
    animation.duration = 2.3f;
    animation.delegate = self;
    //apply animation to layer
    [self.containerView.layer.sublayers.firstObject addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    //set the backgroundColor property to match animation toValue
    CABasicAnimation *baseAnimation = (CABasicAnimation *)anim;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.containerView.layer.sublayers.firstObject.backgroundColor = (__bridge CGColorRef)baseAnimation.toValue;
    [CATransaction commit];
}
@end
