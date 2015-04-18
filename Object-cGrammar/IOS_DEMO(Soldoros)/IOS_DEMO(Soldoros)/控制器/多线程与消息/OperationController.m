//
//  OperationController.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-27.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "OperationController.h"

@interface OperationController ()
{
    NSOperationQueue *_queue;
}

@end

@implementation OperationController

- (void)viewDidLoad {
    self.title = @"NSOperation";
    [super viewDidLoad];
    
    _queue = [[NSOperationQueue alloc] init];
    _queue.maxConcurrentOperationCount = 5;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开始下载图片和更新进度" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button autoSetDimensionsToSize:CGSizeMake(200, 50)];
    [button autoCenterInSuperview];
    [button addTarget:self action:@selector(begin) forControlEvents:UIControlEventTouchUpInside];
}

- (void)begin
{
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(update) object:nil];
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"开始下载图片");
        NSURL *url = [NSURL URLWithString:@"http://b.hiphotos.baidu.com/image/pic/item/4ec2d5628535e5ddf6b2e5d974c6a7efce1b621d.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        if(image != nil) {
            [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
        } else {
            NSLog(@"---下载错误");
        }
        
        [NSThread sleepForTimeInterval:5];
    }];
    [_queue addOperation:operation1];
    [_queue addOperation:operation2];
//    [_queue addOperations:@[operation1,operation2] waitUntilFinished:YES];
}

- (void)update
{
    for (int i = 0; i < 5 ; i ++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"%d",i);
    }
}

//更新主界面
- (void)updateUI:(UIImage *)image
{
    UIImageView *imageview = [[UIImageView alloc] init];
    imageview.image = image;
    [self.view addSubview:imageview];
    [imageview autoCenterInSuperview];
    [imageview autoSetDimensionsToSize:CGSizeMake(60, 30)];
}

@end
