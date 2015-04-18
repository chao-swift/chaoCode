//
//  NSNotiController.m
//  IOS_DEMO(Soldoros)
//
//  Created by rimi on 14-10-24.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "NSNotiController.h"
#import "UIView+AutoLayout.h"
@import AudioToolbox;

#define COLOR4(_R_,_G_,_B_,_A_) [UIColor colorWithRed:(_R_)/255.0f green:(_G_)/255.0f blue:(_B_)/255.0f alpha:_A_]

@interface NSNotiController ()

- (void)initializeApperance;
- (void)buttonPressed:(UIButton *)sender;
- (void)postNotifacation;//发送通知
- (void)receivewNotifacation:(NSNotification *)noti;//接受通知
- (void)postLocalNotifacation;

@end

@implementation NSNotiController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self initializeApperance];
}

- (void)initializeApperance
{
    NSArray *names = @[@"通知",@"本地推送",@"远程推送"];
    NSMutableArray *buttons = [NSMutableArray array];
    for (int i = 0; i < 3; i ++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:names[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];
        button.layer.cornerRadius = 5;
        button.backgroundColor = COLOR(200, 200, 200, 1);
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 11 + i;
        [self.view addSubview:button];
        [buttons addObject:button];
    }
    
    //利用自动布局,设置位置
    UIButton *centerButton = buttons[1];
    [centerButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [centerButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [centerButton autoSetDimensionsToSize:CGSizeMake(100, 35)];
    [buttons autoDistributeViewsAlongAxis:ALAxisVertical withFixedSize:35 insetSpacing:YES alignment:NSLayoutFormatAlignAllCenterX];
    [buttons autoMatchViewsDimension:ALDimensionWidth];
    
    
}

- (void)buttonPressed:(UIButton *)sender
{
    NSInteger index = sender.tag - 11;
    switch (index)
    {
        case 0://通知按钮
        {
            [self postNotifacation];
            break;
        }
        case 1://本地推送按钮
        {
            [self postLocalNotifacation];
            break;
        }
        case 2://远程推送按钮
        {
            break;
        }
            
        default:
            break;
    }
}

//发送系统通知
- (void)postNotifacation
{
    //添加监听
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(receivewNotifacation:) name:@"noti" object:nil];
    
    //发送通知
    NSNotification *noti = [NSNotification notificationWithName:@"noti" object:nil userInfo:[NSDictionary dictionaryWithObject:@"通知消息" forKey:@"key"]];
    [nc postNotification:noti];
}

- (void)receivewNotifacation:(NSNotification *)noti
{
    NSString *data = noti.userInfo[@"key"];
    NSLog(@"%@",data);
    
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:@"noti"];
}

//本地推送 - 没有声音
- (void)postLocalNotifacation
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.soundName = @"5053.wav";
    localNotification.alertAction = @"打开";
    localNotification.hasAction =  YES;
    localNotification.alertLaunchImage = @"关灯.png";
    localNotification.alertBody = @"我在进行本地推送";
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.userInfo = @{@"推送":@"key"};
    
    //ios中需要注册
//    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
//    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge| UIUserNotificationTypeSound categories:nil]];
//    }
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];

    
}

@end
