//
//  GestureController.m
//  IOS_DEMO(Soldoros)
//
//  Created by rimi on 14-10-24.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "GestureController.h"

@interface GestureController ()
{
    CGSize _size;
    CGFloat _currentScale;
}

- (void)initalizeApperance;

@end

@implementation GestureController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initalizeApperance];
}

- (void)initalizeApperance
{
    _size = self.contentLabel.bounds.size;
    
    self.contentLabel.hidden = NO;
    self.contentLabel.backgroundColor = [UIColor greenColor];
    self.contentLabel.userInteractionEnabled = YES;
    self.contentLabel.multipleTouchEnabled = YES;
    
    //添加一个点击手势
    UITapGestureRecognizer *gesuture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleClick:)];
    [self.contentLabel addGestureRecognizer:gesuture];
    
    //添加一个捏合手势
    UIPinchGestureRecognizer *pinGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinGesture];
    
    //添加一个旋转手势
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [self.view addGestureRecognizer:rotationGesture];
    
    //添加一个轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;    [self.view addGestureRecognizer:swipeGesture];
    
    //添加一个拖动手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGesture];
    
    //定义一个长按手势
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
    [self.view addGestureRecognizer:longGesture];
}

- (void)singleClick:(UITapGestureRecognizer *)gesture
{
    NSLog(@"正在点击");
}

- (void)pinch:(UIPinchGestureRecognizer *)gesture
{
    CGFloat scale = gesture.scale;
    CGFloat width = _size.width * scale;
    CGFloat height = _size.height *scale;
    [UIView animateWithDuration:0.5 animations:^
    {
        self.contentLabel.bounds = CGRectMake(0, 0, width, height);
    }];
}

- (void)rotation:(UIRotationGestureRecognizer *)gesture
{
    [UIView animateWithDuration:0.5 animations:^{
        self.contentLabel.transform = CGAffineTransformMakeRotation(gesture.rotation * M_PI);
    }];
}

- (void)swipe:(UISwipeGestureRecognizer *)gesture
{
    [UIView animateWithDuration:0.5 animations:^{
        self.contentLabel.center = CGPointMake(self.contentLabel.center.x - 100, self.contentLabel.center.y);
    } completion:^(BOOL finished) {
        self.contentLabel.center = CGPointMake(self.contentLabel.center.x + 100, self.contentLabel.center.y);
    }];
}

- (void)pan:(UIPanGestureRecognizer *)gesture
{
    CGPoint v = [gesture velocityInView:self.view];
    CGPoint s = [gesture translationInView:self.view];
    NSLog(@"移动速度%@ -- 移动距离%@",NSStringFromCGPoint(v),NSStringFromCGPoint(s));
}

- (void)longPressed:(UILongPressGestureRecognizer *)gesture
{
    NSLog(@"正在长按");
}

@end
