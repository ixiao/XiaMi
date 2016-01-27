//
//  PlayerManager.m
//  Xiami
//
//  Created by 闫潇 on 16/1/24.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import "PlayerManager.h"
#import "SongModel.h"
#import <AVFoundation/AVFoundation.h>

@interface PlayerManager ()
@property (nonatomic, strong) NSMutableArray * playlist;
@property (nonatomic, strong) AVPlayer * player;
@property (nonatomic, strong) NSTimer  * timer;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation PlayerManager
- (NSMutableArray *)playlist
{
    if (_playlist) {
        _playlist = [NSMutableArray array];
    }
    return _playlist;
}

- (AVPlayer *)player
{
    if (!_player) {
        _player = [[AVPlayer alloc]init];
    }
    return _player;
}

static PlayerManager * playerManager = nil;

+ (instancetype)playerManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playerManager = [[PlayerManager alloc]init];
    });
    return playerManager;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.currentIndex = -1;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didMusicFinished) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return self;
}
// 这是当一首歌曲播放完成时调用的方法
- (void)didMusicFinished{
    [self pause];
    [self nextMusic];
    [self musicPlay];
    
    if ([self.buttonTitle isEqualToString:@"顺序播放"]) {
        [self nextMusic];
        [self musicPlay];
    }else if ([self.buttonTitle isEqualToString:@"随机播放"]){
        [self prepareMusic:arc4random() % self.playlist.count ];
        [self musicPlay];
    }else {
        [self prepareMusic:self.currentIndex];
    }
}

// 预播放音乐 整个程序中调用次数最多的方法 很多地方需要调用这个方法 判断第二次点击的音乐是不是当前正在播放的音乐 然后内部直接调用单例中得到模型的方法 预播放需要实例化一个AVPlayerItem 也就是所谓的CD 实例化的时候使用模型中mp3URL的方法 然后调用AVPlayer中替换当前音乐的方法 也就是说外部的音乐状态改变是从这里边实现的 代理方法的安全判断与执行也从预播放中执行
- (void)prepareMusic:(NSUInteger)index{
    
    if (self.currentIndex != index) {
        self.currentIndex = index;
        // 获取当前音乐信息
        SongModel * musicInfo = self.playlist[index];
        
        // 实例化一个PlayerItem作为Player的"CD"
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:musicInfo.mp3Url]];
        
        // 替换当前的PlayerItem
        [self.player replaceCurrentItemWithPlayerItem:playerItem];
        
        // 安全判断
        if ([self.delegate respondsToSelector:@selector(didMusicCutWithMusicInfo:)]) {
            [self.delegate didMusicCutWithMusicInfo:musicInfo];
        }
    }else{
        
        
    }
}


- (void)musicPlay{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAction) userInfo:nil repeats:true];
    // 开始播放
    [self.player play];
}

/*
 音乐暂停
 */
- (void)pause{
    [self.timer invalidate];
    
    self.timer = nil;
    
    [self.player pause];
}

// 播放上一首歌曲
- (void)upMusic{
    [self prepareMusic:self.currentIndex - 1 < 0 ? self.playlist.count - 1: self.currentIndex - 1];
}

// 播放下一首歌曲
- (void)nextMusic{
    [self prepareMusic:self.currentIndex + 1 < self.playlist.count ? self.currentIndex + 1 : 0 ];
}

// 计时器实现方法
- (void)timerAction{
    // 代理的安全判断
    if ([self.delegate respondsToSelector:@selector(didPlayChangeStatus:)]) {
        // 歌曲播放时向外部调用改变状态的方法
        
        // 获取当前播放的字典类型时间
        CGFloat currentTime = CMTimeGetSeconds(self.player.currentTime);
        // 歌曲播放时向外部调用改变状态的方法 并将格式化后的时间作为参数传出
        [self.delegate didPlayChangeStatus:[self getStringFormatBySeconds :currentTime]];
        //         NSLog(@"%f",currentTime);
    }
}

// 音乐时间跳转方法  参数为跳转到的秒数
- (void)musicSeekToTime:(float)time{
    [self.player seekToTime: CMTimeMake(time, 1)];
}

// 音乐音量的控制  0.0 ~ 0.1
- (void)musicVolumn:(float)value{
    self.player.volume = value;
}
// 格式化后的字符串
- (NSString *)getStringFormatBySeconds:(float)seconds{
    // 格式化时间 从浮点类型转换成"00:00"字符串
    NSString *formatTime = [NSString stringWithFormat:@"%02ld:%02ld",(NSInteger)seconds / 60,(NSInteger)seconds % 60];
    return formatTime;
}
@end
