//
//  FramViewController.m
//  UI高级动画
//
//  Created by rimi on 14-8-14.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "FramViewController.h"

@interface FramViewController ()

@end

@implementation FramViewController

- (void)animation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    animation.duration = 0.3;
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    //配置每个帧动画的值
    animation.values = @[@160,@150,@170,@150,@160];
    animation.keyTimes =@[@0.0,@(1/6.0),@(3/6.0),@(5/6.0),@1];
    //配置平移路径
    //UIBeziePath:贝塞尔曲线
//    animation.path
    [self.view.layer addAnimation:animation forKey:@"animation"];
}


@end
