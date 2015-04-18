//
//  GCDController.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-26.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "GCDController.h"

@interface GCDController ()
{
    dispatch_queue_t _serialQueue,_concurrentQueue;
}


@end

@implementation GCDController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnNames = @[@"串行队列",@"并行队列",@"下载图片"];
}

- (void)buttonPressed:(UIButton *)sender
{
    switch (sender.tag - 11) {
        case 0:
        {
            [self sericalQueueRun];//提交给串行队列
            break;
        }
        case 1:
        {
            [self concurrentQueueRun];//提交给并行队列
            break;
        }
        case 2:
        {
            [self downLoadPicAfter];//延迟下载图片
            break;
        }
            
        default:
            break;
    }
}

- (void)sericalQueueRun
{
    _serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(_serialQueue, ^{
        for(int i = 0;i < 10 ;i ++) {
            NSLog(@"%d",i);
        }
        
    });
    dispatch_async(_serialQueue, ^{
        for(int i = 11;i < 20 ;i ++) {
            NSLog(@"%d",i);
        }
        
    });
}

- (void)concurrentQueueRun
{
    _concurrentQueue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(_concurrentQueue, ^{
        for(int i = 90;i < 100 ;i ++) {
            NSLog(@"%d",i);
        }
        
    });
    dispatch_async(_concurrentQueue, ^{
        for(int i = 111;i < 120 ;i ++) {
            NSLog(@"%d",i);
        }
        
    });
}

- (void)downLoadPicAfter
{
    dispatch_after(5, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSURL *url = [NSURL URLWithString:@"http://www.crazyit.org/logo.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        if(image != nil) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                
                UIImageView *imageview = [[UIImageView alloc] init];
                imageview.image = image;
                [self.view addSubview:imageview];
                [imageview autoCenterInSuperview];
                [imageview autoSetDimensionsToSize:CGSizeMake(60, 30)];
            });
        } else {
            NSLog(@"---下载错误");
        }
        
    });
}

@end
