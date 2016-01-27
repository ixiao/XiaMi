//
//  BottomPlayerView.m
//  Xiami
//
//  Created by 闫潇 on 16/1/20.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import "BottomPlayerView.h"
#define K_ScreenWidth [[UIScreen mainScreen] bounds].size.width

@implementation BottomPlayerView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat btnW    = 60 * K_ScreenWidth/320,
                margin  = 10 * K_ScreenWidth/320,
                btnH    = 60,
                 pading = 20,
              smallBtn  = 16,
                midBtn  = 40,
                midBtnY = 20,
                btnY    = (frame.size.height-btnH)/2;
        
        _playMode = [UIButton buttonWithType:UIButtonTypeCustom];
        _lastSong = [UIButton buttonWithType:UIButtonTypeCustom];
        _playSong = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextSong = [UIButton buttonWithType:UIButtonTypeCustom];
        _options  = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _playMode.frame = CGRectMake(pading, pading+15, smallBtn, smallBtn);
        _lastSong.frame = CGRectMake(btnW, midBtnY, midBtn, midBtn);
        _playSong.frame = CGRectMake(btnW * 2 + margin, btnY, btnH, btnH);
        _nextSong.frame = CGRectMake(K_ScreenWidth-btnW-midBtn, midBtnY, midBtn, midBtn);
        _options.frame = CGRectMake(K_ScreenWidth-smallBtn-pading, pading+15, smallBtn, 5);
        
        [_playMode setBackgroundImage:[UIImage imageNamed:@"player_btn_mode_shuffle_select"] forState:UIControlStateNormal];
        [_lastSong setBackgroundImage:[UIImage imageNamed:@"bfzn_005"] forState:UIControlStateNormal];
        [_playSong setBackgroundImage:[UIImage imageNamed:@"bofang_kaishi"] forState:UIControlStateNormal];
        [_nextSong setBackgroundImage:[UIImage imageNamed:@"bofang_xiayishou"] forState:UIControlStateNormal];
        [_options setBackgroundImage:[UIImage imageNamed:@"player_btn_translucent_more"] forState:UIControlStateNormal];

        
        [self addSubview:_playMode];
        [self addSubview:_playSong];
        [self addSubview:_lastSong];
        [self addSubview:_nextSong];
        [self addSubview:_options];
    }
    return self;
}
@end
