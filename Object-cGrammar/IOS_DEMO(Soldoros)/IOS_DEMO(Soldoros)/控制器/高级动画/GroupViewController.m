//
//  GroupViewController.m
//  UI高级动画
//
//  Created by rimi on 14-8-14.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "GroupViewController.h"

@interface GroupViewController ()

@end

@implementation GroupViewController

- (void)animation
{
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnimation.duration = 1;
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //动画起始动画
    positionAnimation.fromValue = @284;
    //结束位置
    positionAnimation.toValue = @100;
    //防止动画执行结束之后自动移除
//    positionAnimation.removedOnCompletion = NO;
//    positionAnimation.fillMode = kCAFillModeForwards;
//    [self.view.layer addAnimation:positionAnimation forKey:@"position"];
    
    //旋转
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.duration = 1;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //动画起始动画
    rotationAnimation.fromValue = @0;
    //结束位置
    rotationAnimation.toValue = @(M_PI);
    //防止动画执行结束之后自动移除
//    rotationAnimation.removedOnCompletion = NO;
//    rotationAnimation.fillMode = kCAFillModeForwards;
//    [self.view.layer addAnimation:rotationAnimation forKey:@"rotaion"];
    
    //透明度
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = 1;
    opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //动画起始动画
    opacityAnimation.fromValue = @1;
    //结束位置
    opacityAnimation.toValue = @0.5;
    //防止动画执行结束之后自动移除
//    opacityAnimation.removedOnCompletion = NO;
//    opacityAnimation.fillMode = kCAFillModeForwards;
//    [self.view.layer addAnimation:opacityAnimation forKey:@"opacity"];
//    
    
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 0.5;
    animationGroup.delegate = self;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    animationGroup.repeatCount = HUGE_VALF;
//    animationGroup.autoreverses = YES;
    //配置管理动画
    animationGroup.animations = @[rotationAnimation,opacityAnimation,positionAnimation];
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    [self.view.layer addAnimation:animationGroup forKey:@"groupA"];
}

- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"动画开始");
}

@end
