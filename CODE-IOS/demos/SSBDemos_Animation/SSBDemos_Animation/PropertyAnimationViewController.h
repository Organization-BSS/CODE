//
//  PropertyAnimationViewController.h
//  SSBDemos_Animation
//
//  Created by bss on 16/7/6.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "BaseViewController.h"

@interface PropertyAnimationViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIView *containerView;
- (IBAction)changColor:(id)sender;

@end
