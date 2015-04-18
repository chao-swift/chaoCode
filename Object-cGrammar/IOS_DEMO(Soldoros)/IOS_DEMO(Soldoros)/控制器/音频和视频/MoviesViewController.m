//
//  MoviesViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-22.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "MoviesViewController.h"
@import MediaPlayer;
@import AVFoundation;

@interface MoviesViewController ()
{
    MPMoviePlayerController *_moviePlayer;
    
    UIButton *fullScreenButton;
    UIButton *playButton;
    
}
@end

@implementation MoviesViewController

-(id)init
{
    if(self == [super init])
    {
        self.title = [NSString stringWithFormat:@"%@",[self class]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeAppearance];
}

-(void)initializeAppearance
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //两个播放按钮
    
    fullScreenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fullScreenButton.bounds = CGRectMake(0, 0, 140, 30);
    fullScreenButton.center = CGPointMake(80, 300);
    
    fullScreenButton.backgroundColor = [UIColor grayColor];
    [fullScreenButton setTitle:@"全屏播放" forState:UIControlStateNormal];
    fullScreenButton.tag = 10;
    [fullScreenButton addTarget:self action:@selector(buttonPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:fullScreenButton];
    
    
    playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.bounds = CGRectMake(0, 0, 130, 30);
    playButton.center = CGPointMake(240, 300);
    playButton.backgroundColor = [UIColor grayColor];
    [playButton setTitle:@"直接播放" forState:UIControlStateNormal];
    playButton.tag = 11;
    [playButton addTarget:self action:@selector(buttonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:playButton];
    

}

-(void)buttonPressed:(UIButton *)sender
{
    NSInteger index = sender.tag-10;
    
    switch (index) {
        case 0:[self fullScreenPlay]; break;
            
        case 1:[self moivePlay]; break;
            
        default:break;
    }
}


//全屏播放
-(void)fullScreenPlay
{
    NSURL *url = [[NSBundle mainBundle]URLForAuxiliaryExecutable:@"RIMI.mp4"];
    
    //初始化播放控制器
    MPMoviePlayerViewController *moivePlayerVC =
    [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    
    [self presentMoviePlayerViewControllerAnimated:moivePlayerVC];
    
}


//直接播放
-(void)moivePlay
{
    if(!_moviePlayer)
    {
        NSURL *url = [[NSBundle mainBundle]URLForAuxiliaryExecutable:@"RIMI.mp4"];
        
        //初始化播放控制器
        _moviePlayer =[[MPMoviePlayerController alloc]initWithContentURL:url];
        
        //播放器界面风格
        _moviePlayer.controlStyle = MPMovieControlStyleDefault;
        
        //缩放规则
        _moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
        [_moviePlayer prepareToPlay];
        
        //播放器界面大小和位置
        _moviePlayer.view.frame = CGRectMake(0, 64, 320, 200);
    }
    
    [self.view addSubview:_moviePlayer.view];
    
    [_moviePlayer play];
    
}


@end
