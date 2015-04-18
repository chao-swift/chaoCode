//
//  ViewController6.m
//  UITabBarController标签控制器
//
//  Created by rimi on 14-8-8.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "ViewController6.h"

@interface ViewController6 ()

@end

@implementation ViewController6

//icon图片大小 normal 30 * 30,高清平60 * 60
- (id)initWithTitle:(NSString *)title {
    self = [super initWithTitle:title];
    if (self) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"Login" image:[UIImage imageNamed:@"icon_menu_hp_press"] tag:5];
        self.tabBarItem = item;
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    //页面跳转,回到索引为2的页面
    self.tabBarController.selectedIndex = 2;
}
@end
