//
//  AnimationViewController.m
//  FrameWork_Animation
//
//  Created by bss on 16/9/19.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "AnimationViewController.h"


@interface AnimationViewController ()<CAAnimationDelegate> {
    UIBezierPath *path;
    CGPoint point;
    CGFloat number;
    CAShapeLayer *aboveLayer;
    UIView *lableView;
    CALayer *layer ;
}

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    [self performSelector:NSSelectorFromString(NSStringFromSelector(@selector(example04)))];

    
   
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



#pragma mark -
#pragma mark TEST CASHAPLAYER
// TEST CASHAPLAYER
- (void)example02 {
    
 point = CGPointMake(100, 100);
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    
//    // 画直线
//    [bezier moveToPoint:CGPointMake(30, 30)];
//    [bezier addLineToPoint:CGPointMake(30, 100)];
    
    // 画圆
    bezier = [UIBezierPath bezierPathWithArcCenter:point radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES];;;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezier.CGPath;
    layer.fillColor = [[UIColor clearColor]CGColor];
    layer.lineWidth = 5;
    layer.strokeColor = [[UIColor blackColor]CGColor];
    layer.opacity = 0.5;

   [self.view.layer addSublayer:layer];
    
    path = [UIBezierPath bezierPathWithArcCenter:point radius:50 startAngle:-M_PI_2 endAngle:M_PI*2-M_PI_2 clockwise:YES];
    path = [UIBezierPath bezierPathWithRect:CGRectMake(220, 100, 100, 100)];
    [path moveToPoint:point];
    aboveLayer = [CAShapeLayer layer];
    aboveLayer.fillColor = [[UIColor clearColor]CGColor];
    aboveLayer.lineWidth = 5;
    aboveLayer.strokeColor = [[UIColor redColor]CGColor];
    
    aboveLayer.path = path.CGPath;
    aboveLayer.strokeStart = 0;
    aboveLayer.strokeEnd = 0.0;
    number = 0.1;
    [self.view.layer addSublayer:aboveLayer];
    
}

- (IBAction)done:(id)sender {
    
//    if (aboveLayer.strokeEnd>1 &&aboveLayer.strokeStart<1) {
//        aboveLayer.strokeStart += number;
//    } else if(aboveLayer.strokeStart==0) {
//        aboveLayer.strokeEnd +=number;
//    }
//    
//    if (aboveLayer.strokeEnd == aboveLayer.strokeStart) {
//        aboveLayer.strokeEnd = 0;
//    }
//    
//    if (aboveLayer.strokeEnd==0) {
//        aboveLayer.strokeStart = 0;
//    }
//    [self layerAnimation:layer];
//    [self animateLayerSize:layer];
//    [self moveAnimation:layer];
//    [self rotate:layer];
    [self keyframeAnimation:layer];


}

#pragma mark -
#pragma mark CATEXTLAYER
- (void)example03 {
    lableView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 200)];
    lableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:lableView];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = lableView.bounds;
    [lableView.layer addSublayer:textLayer];
    
    // set  text attributes
    textLayer.foregroundColor = [[UIColor yellowColor]CGColor];
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    // choose a font
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    // choose some text
    NSString *text = @"  你好的的您的饿我大几啊佛鳄我姑 偶尔\n叫欧哦额哦 win 放弃那诶你非 vg";
    // set layer text
    textLayer.string = text;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
}

#pragma mark - 显式动画
- (void)example04 {
    
    layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = [[UIColor blueColor]CGColor];
    [self.view.layer addSublayer:layer];
    
    
}
#pragma mark - CAKeyframeAniation 关键帧动画
- (void)keyframeAnimation:(CALayer *)_layer {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4;
    animation.path = [self pathByBezier];
    animation.removedOnCompletion = NO; //
    animation.fillMode = kCAFillModeForwards;
    [_layer addAnimation:animation forKey:@"keyFrame"];
}

// 组动画

#pragma mark － 通过贝塞尔曲线生成路径
- (CGPathRef)pathByBezier {
    
    UIBezierPath *pa = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
     return pa.CGPath;
    
}

- (UIColor *)randomColor {
    
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return color;
}


// 给layer添加动画
- (void)layerAnimation:(CALayer *)layer_ {
    
    CABasicAnimation * animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 5;
    UIColor *color = [UIColor redColor];
    animation.toValue = (__bridge id)color.CGColor;
    animation.delegate = self;
    [layer addAnimation:animation forKey:nil];

}

// 修改大小 
- (void)animateLayerSize:(CALayer *)_layer {
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"bounds";
    animation.duration = 3;
    
    CGRect rect = CGRectMake(0, 0, 50, 50);
    NSValue *value = [NSValue valueWithCGRect:rect];
    animation.toValue = value;
    animation.delegate = self;
    [_layer addAnimation:animation forKey:@"size"];
}

// 旋转
- (void)rotate:(CALayer *)_layer {
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.x";
    
    animation.duration = 3;
    animation.toValue = @(M_PI);
    animation.delegate = self;
    [_layer addAnimation:animation forKey:@"ratation"];
}

//  平移动动作
- (void)moveAnimation:(CALayer *)_layer {
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 3;
    
    CGPoint _point = CGPointMake(100, 100);
    NSValue *value = [NSValue valueWithCGPoint:_point];
    animation.toValue = value;
    animation.delegate = self;
    [_layer addAnimation:animation forKey:@"point"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"Animaton Stop");
//    CABasicAnimation *animtaion = (CABasicAnimation *)anim;
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    layer.backgroundColor = (__bridge CGColorRef)animtaion.toValue;
//    [CATransaction commit];
    
    
}
@end
