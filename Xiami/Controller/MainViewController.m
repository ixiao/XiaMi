//
//  MainViewController.m
//  https://github.com/ixiao
//
//  Created by IOS Developer on 16/1/19.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import "MainViewController.h"
#import "UIColor+Most.h"
#import "BottomPlayerView.h"
#import "AlbumCoverView.h"
#define K_ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define K_ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define K_Color(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]
@interface MainViewController ()<UIScrollViewDelegate>
{
    UIScrollView *  myScrollView;
    UIPageControl * pageControl;
    BottomPlayerView * bottomView;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildControl];
    
//    CIContext *context = [CIContext contextWithOptions:nil];
//    CIImage *image = [CIImage imageWithData:UIImagePNGRepresentation([UIImage imageNamed:@"jinwenqi"])];
//    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
//    [filter setValue:image forKey:kCIInputImageKey];
//    [filter setValue:@20 forKey: @"inputRadius"];
//    CIImage *result = [filter valueForKey:kCIOutputImageKey];
//    CGImageRef outImage = [context createCGImage: result fromRect:[result extent]];
//    UIImage * blurImage = [UIImage imageWithCGImage:outImage];
//    UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(-300, -500, K_ScreenWidth+600, K_ScreenHeight+1000)];
//    imageV.image=blurImage;
//    [self.view addSubview:imageV];
    self.view.backgroundColor=[UIColor mostColor:[UIImage imageNamed:@"jinwenqi"]];
}

- (void)buildControl
{
    myScrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, K_ScreenWidth, K_ScreenHeight-80)];
    myScrollView.showsHorizontalScrollIndicator=NO;
    myScrollView.showsVerticalScrollIndicator=NO;
    myScrollView.contentOffset=CGPointMake(K_ScreenWidth, 0);
    myScrollView.pagingEnabled=YES;
    myScrollView.delegate=self;
    myScrollView.contentSize=CGSizeMake(K_ScreenWidth * 3, K_ScreenHeight-80);
    [self.view addSubview:myScrollView];
    
    UITableView * leftTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, K_ScreenWidth, K_ScreenHeight-80) style:UITableViewStyleGrouped];
    leftTab.backgroundColor=[UIColor orangeColor];
    [myScrollView addSubview:leftTab];
    
    UITableView * rightTab = [[UITableView alloc]initWithFrame:CGRectMake(K_ScreenWidth*2, 0, K_ScreenWidth, K_ScreenHeight-80) style:UITableViewStyleGrouped];
    rightTab.backgroundColor=[UIColor greenColor];
    [myScrollView addSubview:rightTab];
    
    AlbumCoverView * album = [[AlbumCoverView alloc]initWithFrame:CGRectMake(K_ScreenWidth, 0, K_ScreenWidth, K_ScreenWidth*1.3)];

    
    [myScrollView addSubview:album];
    
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
    
    bottomView = [[BottomPlayerView alloc]initWithFrame:CGRectMake(0, K_ScreenHeight-80, K_ScreenWidth, 80)];
    [self.view addSubview:bottomView];
}

- (void)findLooklikeMusic
{
    
}

- (void)dismissViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat  x = scrollView.contentOffset.x;
    
    if (x >= K_ScreenWidth * 2) {
        pageControl.currentPage=2;
    }else if (x < K_ScreenWidth)
    {
        pageControl.currentPage=0;
    }else
    {
        pageControl.currentPage=1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




@end
