//
//  PlayView.h
//  Xiami
//
//  Created by IOS Developer on 16/1/19.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define K_ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define K_ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define K_Color(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]

@interface PlayView : UIView

@property (nonatomic,strong) UIImageView * songImg;
@property (nonatomic,strong) UILabel     * songName;
@property (nonatomic,strong) UILabel     * songAuthor;
@property (nonatomic,strong) UIButton    * playBtn;
@property (nonatomic,strong) UIButton    * nextBtn;

@end
