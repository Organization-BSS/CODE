//
//  LoginViewController.h
//  SelfRecord
//
//  Created by bss on 11/28/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *PassWordTextFiled;
- (IBAction)makeSure:(id)sender;

@end
