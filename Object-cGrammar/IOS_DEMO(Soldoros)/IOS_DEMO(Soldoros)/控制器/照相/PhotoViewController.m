//
//  PhotoViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/12/8.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "PhotoViewController.h"
#import "SelfTPicture.h"

@interface PhotoViewController ()
{
    SelfTPicture *_tPicture;
}

@end

@implementation PhotoViewController



- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    self.title = @"拍照";
    
    [super viewWillAppear:YES];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    leftButton.bounds = CGRectMake(0, 0, 70, 25);
    [leftButton addTarget:self action:@selector(leftPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"项目选择" forState:UIControlStateNormal];
    rightButton.bounds = CGRectMake(0, 0, 100, 25);
    [rightButton addTarget:self action:@selector(rightPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)leftPressed:(UIButton *)sender
{
    [_tPicture.session stopRunning];
    [self.navigationController popViewControllerAnimated:NO];
    if(_delegate && [_delegate respondsToSelector:@selector(backController:)]) {
        [_delegate backController:2];
    }
    
}

- (void)rightPressed:(UIButton *)sender
{
    [_tPicture.session stopRunning];
    [self.navigationController popViewControllerAnimated:NO];
    if(_delegate && [_delegate respondsToSelector:@selector(backController:)]) {
        [_delegate backController:0];
    }
}

- (void)initializeApperance
{
    if(_tPicture == nil)
    {
        _tPicture  = [[SelfTPicture alloc] init];
        _tPicture.delegate = self;
        
        AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_tPicture.session];
        previewLayer.frame = _mainView.bounds;
        [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
        _mainView.layer.masksToBounds = YES;
        [_mainView.layer insertSublayer:previewLayer atIndex:0];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^
                       {
                           [_tPicture.session startRunning];
                           
                       });
    }
}


- (IBAction)takePhoto:(id)sender
{
    [_tPicture captureStillImage];
}


- (void)readPicture:(UIImage *)image
{
    NSLog(@"拍照完毕");
}










@end
