//
//  TransViewController.m
//  UI高级动画
//
//  Created by rimi on 14-8-14.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "TransViewController.h"
#import "UIColor+Expand.h"

@interface TransViewController ()

{
    BOOL _animating;
}

@end

@implementation TransViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)animation {
    
    NSArray *subTypes = @[kCATransitionFromRight,kCATransitionFromLeft,kCATransitionFromTop,kCATransitionFromBottom];
    
    
    CATransition *animation = [CATransition animation];
    //动画时长,线性,类型,委托,配置
    animation.duration = 1;
    //线性
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //类型
    //a:主要类型,决定动画类型
    animation.type = @"cube";
    //b:次要类型,决定动画执行方向
    animation.subtype = subTypes[arc4random() % 4];
    animation.delegate = self;
    
//其他配置
//a:动画是否逆向执行/
//    animation.autoreverses = YES;
//    
//   // b:动画重复次数
// animation.repeatCount = HUGE_VALF;//无线循环

    //执行动画
    [self.view.layer addAnimation:animation forKey:@"transition"];
    self.view.backgroundColor = [UIColor specialRandomColor];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    if (_animating == NO) {
        [self animation];

    }
}

//非正式协议:NSObject的类别,类别方法在具体的子类中实现,叫做非正式协议
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    _animating = YES;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    _animating = NO;
}
@end
