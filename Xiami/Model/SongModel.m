//
//  SongModel.m
//  https://github.com/ixiao
//
//  Created by IOS Developer on 16/1/19.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import "SongModel.h"

@implementation SongModel
-(instancetype)init
{
    self = [super init];
    if (self) {
        //实例化时间歌词的数组
        self.timeForLyric = [NSMutableArray new];
    }
    return self;
}
@end
