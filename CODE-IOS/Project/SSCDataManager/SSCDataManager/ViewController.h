//
//  ViewController.h
//  SSCDataManager
//
//  Created by bss on 16/10/10.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@property (weak, nonatomic) IBOutlet UILabel *timesLable;
@property (weak, nonatomic) IBOutlet UILabel *totalNumbers;
@property (weak, nonatomic) IBOutlet UITextField *limitNumberTextField;

- (IBAction)reLoadData:(id)sender;
@end

