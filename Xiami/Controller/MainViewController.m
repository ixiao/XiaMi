//
//  MainViewController.m
//  https://github.com/ixiao
//
//  Created by IOS Developer on 16/1/19.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import "MainViewController.h"
#import "UIColor+Most.h"

#define K_ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define K_ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define K_Color(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]
@interface MainViewController ()
{
    
    UIPageControl * pageControl;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildControl];
    self.view.backgroundColor=[UIColor mostColor:[UIImage imageNamed:@"jinwenqi"]];
}

- (void)buildControl
{
    CGFloat pading = 10;
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame=CGRectMake(pading * 2, pading * 3, 20, 15);
    [leftButton setBackgroundImage:[UIImage imageNamed:@"player_btn_lyricadjust_forward"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(dismissViewController)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(K_ScreenWidth-pading * 4, pading * 3, 20, 15);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"global_title_similar_normal"] forState:UIControlStateNormal];
    [self.view addSubview:rightButton];
    
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(K_ScreenWidth/2 - 30, pading * 3, 60, 30)];
    pageControl.numberOfPages=3;
    pageControl.currentPage=1;
    pageControl.pageIndicatorTintColor=K_Color(188, 188, 188);
    pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
    [self.view addSubview:pageControl];
    
    
    
}

- (void)findLooklikeMusic
{
    
}

- (void)dismissViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




@end
