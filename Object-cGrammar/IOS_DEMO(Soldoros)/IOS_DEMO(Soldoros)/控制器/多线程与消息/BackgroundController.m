//
//  BackgroundController.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-27.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "BackgroundController.h"

@interface BackgroundController ()

@end

@implementation BackgroundController

- (void)viewDidLoad {
    [super viewDidLoad];
    //监听进入前台
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterFore:) name:UIApplicationWillEnterForegroundNotification object:[UIApplication sharedApplication]];
    //监听进入后台
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBack:) name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
}

- (void)enterFore:(NSNotification *)noti
{
    self.title = @"程序前台运行";
}

- (void)enterBack:(NSNotification *)noti
{
    NSLog(@"程序转入后台");
    NSLog(@"程序获得更多的后台时间");
    [self getMoreBackTime];
}

- (void)getMoreBackTime
{
    __block UIBackgroundTaskIdentifier backTaskId;
    backTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:backTaskId];
    }];
    if(backTaskId == UIBackgroundTaskInvalid) {
        NSLog(@"IOS版本不支持后台任务");
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"下载中");
        for (int i = 0 ; i < 100; i ++) {
            [NSThread sleepForTimeInterval:3];
            i += 20;
            NSLog(@"剩余后台时间%f",[UIApplication sharedApplication].backgroundTimeRemaining);
            if(i >= 100) {
                NSLog(@"下载完成,终止后台任务");
                [[UIApplication sharedApplication] endBackgroundTask:backTaskId];
            }
        }
        
    });
}

@end
