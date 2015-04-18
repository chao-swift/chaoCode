//
//  UIButton+Click.h
//  代码块
//
//  Created by Chengfj on 14-9-22.
//  Copyright (c) 2014年 RIMI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnClickAction)();

@interface UIButton (Click)

- (void)addTarget11111:(id)target action:(btnClickAction)action forControlEvents:(UIControlEvents)controlEvents;

@end
