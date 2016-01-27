//
//  AlbumCoverView.m
//  Xiami
//
//  Created by 闫潇 on 16/1/19.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import "AlbumCoverView.h"
#define K_ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define K_ScreenHeight [[UIScreen mainScreen] bounds].size.height
/*
 @property (nonatomic,strong) UIImageView * BGPicture;
 @property (nonatomic,strong) UIProgressView * myProgress;
 @property (nonatomic,strong) UILabel * nowProgressTime;
 @property (nonatomic,strong) UILabel * sumProgressTime;
 @property (nonatomic,strong) UIButton * heartBrn;
 @property (nonatomic,strong) UIButton * discuessBtn;
 @property (nonatomic,strong) UILabel * songName;
 @property (nonatomic,strong) UILabel * songAuthor;
 */
@implementation AlbumCoverView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat margin = 5;
        CGFloat timeH  = 20;
        CGFloat btnW   = 16;
        CGFloat btnY   =K_ScreenWidth + timeH + margin * 3;
        
        _BGPicture = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K_ScreenWidth,K_ScreenWidth)];
        _BGPicture.image=[UIImage imageNamed:@"jinwenqi"];
        
        _myProgress = [[UIProgressView alloc]initWithFrame:CGRectMake(0, K_ScreenWidth, K_ScreenWidth, 2)];
        _myProgress.trackTintColor=[UIColor whiteColor];
        _myProgress.progressTintColor=[UIColor orangeColor];
        _myProgress.progress=0.618;
        
        _nowProgressTime = [[UILabel alloc]initWithFrame:CGRectMake(margin,K_ScreenWidth+margin, 40, timeH)];
        _nowProgressTime.textColor=[UIColor whiteColor];
        _nowProgressTime.font = [UIFont systemFontOfSize:14];
        _nowProgressTime.text=@"02:30";
        
        _sumProgressTime = [[UILabel alloc]initWithFrame:CGRectMake(K_ScreenWidth-margin-40,K_ScreenWidth+margin, 40, timeH)];
        _sumProgressTime.textColor=[UIColor whiteColor];
        _sumProgressTime.font = [UIFont systemFontOfSize:14];
        _sumProgressTime.text=@"04:13";
        
        _heartBrn = [UIButton buttonWithType:UIButtonTypeCustom];
        _heartBrn.frame=CGRectMake(margin * 4, btnY,btnW , btnW);
        [_heartBrn setBackgroundImage:[UIImage imageNamed:@"player_icon_fav_normal"] forState:UIControlStateNormal];
        
        _discuessBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _discuessBtn.frame=CGRectMake(K_ScreenWidth-btnW-margin*4, btnY, btnW, btnW);
        [_discuessBtn setBackgroundImage:[UIImage imageNamed:@"player_icon_comment_normal"] forState:UIControlStateNormal];
        
        _songName = [[UILabel alloc]initWithFrame:CGRectMake((K_ScreenWidth/2)-50,K_ScreenWidth+ margin* 6, 100, 20)];
        _songName.text=@"岁月神偷";
        _songName.textAlignment=NSTextAlignmentCenter;
        _songName.textColor=[UIColor whiteColor];
        
        _hotImg = [[UIImageView alloc]initWithFrame:CGRectMake((K_ScreenWidth/2)-48, K_ScreenWidth+margin* 6+margin, 10, 6)];
        _hotImg.image=[UIImage imageNamed:@"detail_icon_hq_select"];
        
        _songAuthor = [[UILabel alloc]initWithFrame:CGRectMake((K_ScreenWidth/2)-20, K_ScreenWidth+ margin* 6 + margin * 6, 40, 15)];
        _songAuthor.text=@"金玟岐";
        _songAuthor.font = [UIFont systemFontOfSize:12];
        _songAuthor.textColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
        
        [self addSubview:_BGPicture];
        [self addSubview:_myProgress];
        [self addSubview:_nowProgressTime];
        [self addSubview:_sumProgressTime];
        [self addSubview:_heartBrn];
        [self addSubview:_discuessBtn];
        [self addSubview:_songName];
        [self addSubview:_songAuthor];
        [self addSubview:_hotImg];
    }
    return self;
}
@end
