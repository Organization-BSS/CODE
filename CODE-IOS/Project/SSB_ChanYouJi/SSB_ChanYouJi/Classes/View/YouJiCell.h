//
//  YouJiCell.h
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/26.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  YouJiModel;

@interface YouJiCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIButton *userHead;
@property (nonatomic,strong)YouJiModel *model;

@end
