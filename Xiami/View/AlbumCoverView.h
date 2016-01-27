//
//  AlbumCoverView.h
//  Xiami
//
//  Created by 闫潇 on 16/1/19.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumCoverView : UIView

@property (nonatomic,strong) UIImageView * BGPicture;
@property (nonatomic,strong) UIProgressView * myProgress;
@property (nonatomic,strong) UILabel * nowProgressTime;
@property (nonatomic,strong) UILabel * sumProgressTime;
@property (nonatomic,strong) UIButton * heartBrn;
@property (nonatomic,strong) UIButton * discuessBtn;
@property (nonatomic,strong) UIImageView * hotImg;
@property (nonatomic,strong) UILabel * songName;
@property (nonatomic,strong) UILabel * songAuthor;

@end
