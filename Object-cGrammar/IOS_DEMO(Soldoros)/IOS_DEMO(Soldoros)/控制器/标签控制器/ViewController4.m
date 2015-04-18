//
//  ViewController4.m
//  UITabBarController标签控制器
//
//  Created by rimi on 14-8-8.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (id)initWithTitle:(NSString *)title {
    self = [super initWithTitle:title];
    if (self) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:3];
        self.tabBarItem = item;
    }
    return self;
}

@end
