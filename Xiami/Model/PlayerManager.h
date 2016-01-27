//
//  PlayerManager.h
//  Xiami
//
//  Created by 闫潇 on 16/1/24.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongModel.h"


@protocol playerManagerDelegate <NSObject>

/*
 当歌曲正在播放时被一直调用的代理方法
 */
- (void)didPlayChangeStatus:(NSString *)time;

/*
 当音乐被切换时调用的代理方法  外部需要拿到数据模型 进行改变
 */
- (void)didMusicCutWithMusicInfo:(SongModel *)musicInfo;

@end


@interface PlayerManager : NSObject

@property (nonatomic,weak) id<playerManagerDelegate> delegate;

// 播放列表中有多少个歌曲信息
@property (nonatomic, readonly)NSUInteger playlistCount;

// 单例
+(instancetype)playerManager;

/*
 *获取播放列表
 *@param hander当完成时回调的Block
 */
-(void)getPlayListCompletionHandler:(void(^)())handler;

/*
 *获取播放列表中的歌曲
 *@param index获取哪一个
 *@retun 返回对应歌词信息
 */
-(SongModel *)getmusicInfoWithIndext:(NSUInteger)index;

// 准备播放的歌曲 参数是列表中的第几首
- (void)prepareMusic:(NSUInteger)index;

// 音乐播放
- (void)musicPlay;

//  音乐暂停
- (void)pause;

// 播放上一首歌曲
- (void)upMusic;

// 播放下一首歌曲
- (void)nextMusic;

// 音乐时间跳转方法  参数为跳转到的秒数
- (void)musicSeekToTime:(float)time;

// 音乐音量的控制  0.0 ~ 0.1
- (void)musicVolumn:(float)value;

// 接收传进来的buttonTitle用来判断怎样去播放音乐
@property (nonatomic,strong) NSString *buttonTitle;

@end
