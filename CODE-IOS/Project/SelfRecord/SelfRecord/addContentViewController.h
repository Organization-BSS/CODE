//
//  addContentViewController.h
//  SelfRecord
//
//  Created by bss on 11/30/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "BaseViewController.h"
typedef NS_ENUM(NSInteger,VCTYPE) {
    VCTYPE_ADD,
    VCTYPE_SHOW
};
@interface addContentViewController : BaseViewController {
    NSMutableArray *imagesArray;
}
@property (weak, nonatomic) IBOutlet UIImageView *largImageView;

@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (assign, nonatomic) VCTYPE type;
@property (strong, nonatomic) NSString *path;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)makeSure:(id)sender;
- (IBAction)back:(id)sender;



@end
