//
//  StatusBarViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "StatusBarViewController.h"

@interface StatusBarViewController ()
{
    BOOL isHiden;
}
@end

@implementation StatusBarViewController

-(id)init
{
    if(self == [super init])
    {
        isHiden = NO;
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
    self.contentLabel.hidden = NO;
    self.contentLabel.text = @"状态栏的高度是20";
    
    UIButton *statueBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    statueBtn.frame = AUTOLayer(100 ,350,100,50,1);
    [statueBtn setTitle:@"隐藏/不隐藏" forState:UIControlStateNormal];
    statueBtn.layer.borderWidth = 1;
    [statueBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:statueBtn];
}

-(void)btnPressed:(UIButton *)sender
{
    //用BOOL变量控制状态栏显示否
    isHiden = !isHiden;
    [self prefersStatusBarHidden];
}
- (BOOL)prefersStatusBarHidden
{
    return isHiden;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}







@end
