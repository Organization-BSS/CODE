//
//  PlaySound.h
//  SSCReminder
//
//  Created by bss on 16/10/8.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface PlaySound : NSObject
{
    SystemSoundID sound;//系统声音的id 取值范围为：1000-2000
    AVAudioPlayer *player;
}
- (id)initSystemShake;//系统 震动
- (id)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType;//初始化系统声音
- (void)play;//播放

- (instancetype)initWithMusic:(NSString *)musicName;
//@property (nonatomic,strong)AVAudioPlayer *player;
@end
