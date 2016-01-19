//
//  PlayView.m
//  Xiami
//
//  Created by IOS Developer on 16/1/19.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import "PlayView.h"
#import <AVFoundation/AVFoundation.h>
@interface PlayView ()
{
    BOOL isPlay;
}
@property(nonatomic,strong) AVAudioPlayer *player;
@end

@implementation PlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
        
        CGFloat viewHeight = frame.size.height;
        CGFloat pading     = 10;
        
        /**
         歌曲图片
         */
        _songImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, viewHeight, viewHeight)];
        CAShapeLayer * layer = [CAShapeLayer layer];
        UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:_songImg.bounds];
        layer.path=path.CGPath;
        _songImg.layer.mask=layer;
        
        
        /**
         歌曲名字
         */
        _songName = [[UILabel alloc]initWithFrame:CGRectMake(viewHeight + pading/2, viewHeight/2-18, K_ScreenWidth - viewHeight*1.4 - pading * 10, 20)];
        _songName.textColor=K_Color(244, 244, 244);
        _songName.font=[UIFont systemFontOfSize:16];
        
        /**
         歌曲作者
         */
        _songAuthor=[[UILabel alloc]initWithFrame:CGRectMake(viewHeight + pading/2,CGRectGetMaxY(_songName.frame), K_ScreenWidth - viewHeight*1.4 - pading * 10, 15)];
        _songAuthor.font=[UIFont systemFontOfSize:16];
        _songAuthor.textColor= K_Color(200, 200, 200);
        
        /**
         *  播放按钮
         */
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _playBtn.frame = CGRectMake(K_ScreenWidth-pading*9, viewHeight * 0.1, viewHeight * 0.68, viewHeight * 0.68);
        [_playBtn addTarget:self action:@selector(playSong:) forControlEvents:UIControlEventTouchUpInside];
        
        /**
         *  下一首按钮
         */
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.frame = CGRectMake(K_ScreenWidth-pading*4, viewHeight * 0.1, viewHeight * 0.68, viewHeight * 0.68);
        [_nextBtn addTarget:self action:@selector(nextSong:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:_playBtn];
        [self addSubview:_nextBtn];
        [self addSubview:_songAuthor];
        [self addSubview:_songName];
        [self addSubview:_songImg];
        
        
        
        NSURL * url = [[NSBundle mainBundle]URLForResource:@"金玟岐-岁月神偷.mp3" withExtension:nil];
        self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        
        [self.player prepareToPlay];
    }
    return self;
}

- (void)playSong:(UIButton *)sender
{
    if (isPlay) {
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"bofang_zhanting"] forState:UIControlStateNormal];
        [self.player pause];
        isPlay = NO;
    }else
    {
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"bofang_kaishi"] forState:UIControlStateNormal];
        [self.player play];
        isPlay = YES;
    }
}
- (void)nextSong:(UIButton *)sender
{
    
}
@end
