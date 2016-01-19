//
//  ViewController.m
//  Xiami
//
//  Created by IOS Developer on 16/1/19.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import "RootViewController.h"
#import "PlayView.h"
#import "UIColor+Most.h"
#import "MainViewController.h"
#define K_ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define K_ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define K_Color(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor=K_Color(95, 253 , 255);
    PlayView * play = [[PlayView alloc]initWithFrame:CGRectMake(0, K_ScreenHeight-60, K_ScreenWidth, 60)];
    play.backgroundColor=[UIColor mostColor:[UIImage imageNamed:@"jinwenqi"]];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(persentMainView)];
    [play addGestureRecognizer:tap];
    
    play.songAuthor.text=@"金玟岐";
    play.songName.text=@"岁月神偷";
    play.songImg.image=[UIImage imageNamed:@"jinwenqi"];
    [play.playBtn setBackgroundImage:[UIImage imageNamed:@"bofang_kaishi"] forState:UIControlStateNormal];
    
    [play.nextBtn setBackgroundImage:[UIImage imageNamed:@"bofang_xiayishou"] forState:UIControlStateNormal];
    
    [self.view addSubview:play];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)persentMainView
{
    MainViewController * VC = [MainViewController new];
    
    [self presentViewController:VC animated:YES completion:nil];
}

@end
