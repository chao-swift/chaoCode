//
//  NSThreadController.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-26.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "NSThreadController.h"

@interface NSThreadController ()

- (void)downLoadPic;
- (void)downLoadFromUrl:(NSURL *)url;

@end

@implementation NSThreadController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"NSThread";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.btnNames = @[@"使用NSThread下载图片",@"..."];
}

- (void)buttonPressed:(UIButton *)sender
{
    switch (sender.tag - 11) {
        case 0:
        {
            [self downLoadPic];
            break;
        }
            
        default:
            break;
    }
}

//下载图片
- (void)downLoadPic
{
    NSURL *url = [NSURL URLWithString:@"http://www.crazyit.org/logo.jpg"];
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downLoadFromUrl:) object:url];
    [thread start];
}

- (void)downLoadFromUrl:(NSURL *)url
{
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    if(image != nil) {
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
    } else {
        NSLog(@"---下载错误");
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
