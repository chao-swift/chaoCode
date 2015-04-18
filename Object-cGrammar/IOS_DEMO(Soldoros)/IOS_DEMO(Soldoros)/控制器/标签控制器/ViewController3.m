//
//  ViewController3.m
//  UITabBarController标签控制器
//
//  Created by rimi on 14-8-8.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (id)initWithTitle:(NSString *)title {
    self = [super initWithTitle:title];
    if (self) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:2];
        self.tabBarItem = item;
    }
    return self;
}

@end
