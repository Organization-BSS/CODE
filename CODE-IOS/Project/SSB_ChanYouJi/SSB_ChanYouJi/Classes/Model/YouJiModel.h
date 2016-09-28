//
//  YouJiModel.h
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/20.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SSBBaseModel.h"
#import "UserModel.h"

@interface YouJiModel : SSBBaseModel

@property (nonatomic,strong)NSString *id;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,assign)NSInteger photos_count;
@property (nonatomic,strong)NSString *start_date;
@property (nonatomic,strong)NSString *end_date;
@property (nonatomic,strong)NSString *days;
@property (nonatomic,strong)NSString *level;
@property (nonatomic,strong)NSString *views_count;
@property (nonatomic,strong)NSString *comments_count;
@property (nonatomic,strong)NSString *likes_count;
@property (nonatomic,strong)NSString *source;
@property (nonatomic,strong)NSString *front_cover_photo_url;
@property (nonatomic,strong)NSString *featured;

@property (nonatomic,strong)UserModel *user;


@end
