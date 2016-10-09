//
//  RootViewController.m
//  SSCReminder
//
//  Created by bss on 16/10/8.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "RootViewController.h"
#import "AudioToolbox/AudioToolbox.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGesture];
  //  player = [[PlaySound alloc]initWithMusic:@"nil"];

    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cqsscAction:(id)sender {
    SSCSetUp *sscSetUp = [[SSCSetUp alloc]init];
    sscSetUp.sscType = SSCTYPE_CQ;
    sscSetUp.reminderSize = [self.cqsscTextFiled.text integerValue];
    [sscSetUp setup];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)addGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideView:)];
    [self.view addGestureRecognizer:tap];
}

// 隐藏子视图
- (void)hideView:(id)object {
    for (UIView *v in self.view.subviews) {
        v.hidden = !v.hidden;
    }
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

}

- (IBAction)xjsscAction:(id)sender {
    
    SSCSetUp *sscSetUp = [[SSCSetUp alloc]init];
    sscSetUp.sscType = SSCTYPE_XJ;
    sscSetUp.reminderSize = [self.xjTextField.text integerValue];
    [sscSetUp setup];
}
@end
