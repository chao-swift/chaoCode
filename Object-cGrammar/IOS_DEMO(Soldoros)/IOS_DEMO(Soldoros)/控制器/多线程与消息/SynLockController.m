//
//  SynLockController.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-27.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "SynLockController.h"

@interface SynLockController ()
{
    BOOL _status1,_status2;
    NSDate *_date;
    NSLock *_lock;
}

@end

@implementation SynLockController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"线程同步和通讯";
    self.btnNames = @[@"Syn",@"NSLock",@"控制线程通信"];
    _lock = [[NSLock alloc] init];
}

- (void)buttonPressed:(UIButton *)sender
{
    switch (sender.tag - 11) {
        case 0:
        {
            [self synchronizedMethod];
            break;
        }
        case 1: {
            [self lockMethod];
            break;
        }
            
        default:
            break;
    }
}

- (void)synchronizedMethod
{
    _date = [[NSDate alloc] init];
    dispatch_queue_t queue = dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for(int i = 0; i < 5;i ++) {
            [self task:1];
            _status1 = NO;
        }
        
    });
    dispatch_async(queue, ^{
        for(int i = 0; i < 5;i ++) {
            [self task:2];
            _status2 = NO;
        }
        
    });
}

- (void)task:(NSInteger)status
{
    //使用@syn
    @synchronized(self) {
        if(status == 1) {
            _status1 = YES;
        } else {
            _status2 = YES;
        }
    NSLog(@"--正在执行task方法--");
    if(_status1) {
        NSLog(@"线程1正在执行");
    }
    if(_status2) {
        NSLog(@"线程2正在执行");
    }
    [NSThread sleepForTimeInterval:3];
    }
}

- (void)lockMethod
{
 
        _date = [[NSDate alloc] init];
        dispatch_queue_t queue = dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(queue, ^{
            for(int i = 0; i < 5;i ++) {
                [self task2:1];
                _status1 = NO;
            }
            
        });
        dispatch_async(queue, ^{
            for(int i = 0; i < 5;i ++) {
                [self task2:2];
                _status2 = NO;
            }
            
        });
    
}

- (void)task2:(NSInteger)status
{
    //使用lock
    [_lock lock];
        if(status == 1) {
            _status1 = YES;
        } else {
            _status2 = YES;
        }
        NSLog(@"--正在执行task方法--");
        if(_status1) {
            NSLog(@"线程1正在执行");
        }
        if(_status2) {
            NSLog(@"线程2正在执行");
        }
        [NSThread sleepForTimeInterval:3];
    [_lock unlock];
}

@end
