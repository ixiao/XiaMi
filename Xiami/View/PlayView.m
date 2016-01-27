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
    CGFloat playTime;
}
@property(nonatomic,strong) AVAudioPlayer *player;
@end

static NSString * const PlayerSongStatePlay;
static NSString * const PlayerSongStatePause;

@implementation PlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
        
        CGFloat viewHeight = frame.size.height;
        CGFloat pading     = 10;
        CGFloat btnY       = (viewHeight-pading * 4)  /2;
        /**
         歌曲图片
         */
        _songImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, viewHeight, viewHeight)];
        CAShapeLayer * layer = [CAShapeLayer layer];
        UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:_songImg.bounds];
        layer.path=path.CGPath;
        _songImg.layer.mask=layer;
        
        //添加动画
        CABasicAnimation *monkeyAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        monkeyAnimation.toValue = [NSNumber numberWithFloat:2.0 *M_PI];
        monkeyAnimation.duration = 2.0f;
        monkeyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        monkeyAnimation.cumulative = NO;
        monkeyAnimation.fillMode=kCAFillModeForwards;
        monkeyAnimation.removedOnCompletion = NO; //No Remove
        
        monkeyAnimation.repeatCount = FLT_MAX;
        [_songImg.layer addAnimation:monkeyAnimation forKey:@"AnimatedKey"];
        [_songImg stopAnimating];
        
        // 加载动画 但不播放动画
        _songImg.layer.speed = 0.0;
        
        /**
         歌曲名字
         */
        _songName = [[UILabel alloc]initWithFrame:CGRectMake(viewHeight + pading/2, viewHeight/2-18, K_ScreenWidth - viewHeight*1.4 - pading * 12, 20)];
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
        _playBtn.frame = CGRectMake(K_ScreenWidth-pading*10, btnY, pading * 4,  pading * 4);
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"bofang_kaishi"] forState:UIControlStateNormal];
        [_playBtn addTarget:self action:@selector(playSong:) forControlEvents:UIControlEventTouchUpInside];
        
        /**
         *  下一首按钮
         */
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.frame = CGRectMake(K_ScreenWidth-pading*5, btnY, pading * 4,  pading * 4);
        [_nextBtn setBackgroundImage:[UIImage imageNamed:@"bofang_xiayishou"] forState:UIControlStateNormal];
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
