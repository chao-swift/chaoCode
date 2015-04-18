//
//  AnimationTwoViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "AnimationTwoViewController.h"
#import "LayerViewController.h"
#import "TransViewController.h"
#import "GroupViewController.h"
#import "BasicViewController.h"
#import "FramViewController.h"

@interface AnimationTwoViewController ()

@end

@implementation AnimationTwoViewController

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
    // Override point for customization after application launch.
    LayerViewController *layerVC = [LayerViewController new];
    TransViewController *transVC = [[TransViewController alloc] initWithTitle:NSStringFromClass(TransViewController.class) tabbarTitle:@"2"];
    GroupViewController *groupVC = [[GroupViewController alloc] initWithTitle:NSStringFromClass(GroupViewController.class) tabbarTitle:@"3"];
    BasicViewController *baseVC = [[BasicViewController alloc] initWithTitle:NSStringFromClass(BasicViewController.class) tabbarTitle:@"4"];
    FramViewController *framVC = [[FramViewController alloc] initWithTitle:NSStringFromClass(FramViewController.class) tabbarTitle:@"5"];
    UINavigationController *layerNav = [[UINavigationController alloc] initWithRootViewController:layerVC];
    UINavigationController *transNav = [[UINavigationController alloc] initWithRootViewController:transVC];
    UINavigationController *groupNav = [[UINavigationController alloc] initWithRootViewController:groupVC];
    UINavigationController *baseNav = [[UINavigationController alloc] initWithRootViewController:baseVC];
    UINavigationController *framNav = [[UINavigationController alloc] initWithRootViewController:framVC];
    
    UITabBarController *tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[layerNav,transNav,groupNav,baseNav,framNav];
    
    [self addChildViewController:tabBarController];
    [self.view addSubview:tabBarController.view];
    
    
}


@end
