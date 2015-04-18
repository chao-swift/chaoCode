//
//  UIButton+Click.m
//  代码块
//
//  Created by Chengfj on 14-9-22.
//  Copyright (c) 2014年 RIMI. All rights reserved.
//

#import "UIButton+Click.h"

static btnClickAction _action;

@implementation UIButton (Click)

- (void)addTarget11111:(id)target action:(btnClickAction)action
      forControlEvents:(UIControlEvents)controlEvents
{
    _action = action;
    [self addTarget:self action:@selector(btnclick)
   forControlEvents:UIControlEventTouchUpInside];
}



//让block代码块成为点击事件

- (void)btnclick
{
    _action();
}



@end
