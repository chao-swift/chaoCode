//
//  SearchVesonViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/12/8.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "SearchVesonViewController.h"
#import "Harpy.h"


@interface SearchVesonViewController ()
{
    BOOL check;
}
@end

@implementation SearchVesonViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeAppearance];
}

-(void)initializeAppearance
{
    self.view.backgroundColor = [UIColor whiteColor];
    check = NO;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
   [ button setTitle:@"版本检测更新" forState:UIControlStateNormal];
    [button setTintColor:[UIColor yellowColor]];
    button.frame = AUTOLayer(80, 220, 160, 50, 1);
    button.layer.cornerRadius = 5;
    button.backgroundColor = [UIColor lightGrayColor];
    button.layer.borderWidth = 2;
    button.layer.borderColor = Brown;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}


-(void)buttonPressed:(UIButton *)sender
{
    if(!check)
    {
        check = YES;
        //版本更新提示(这个非得有已经上传的项目 跟ID和name以及版本号做对比
        [[Harpy sharedInstance] setAppID:@"928348547"];
        [[Harpy sharedInstance] setAppName:@"优厨商城"];
        [Harpy sharedInstance].alertType = HarpyAlertTypeOption;
        [[Harpy sharedInstance] checkVersion];
    }
    check = NO;
}







@end
