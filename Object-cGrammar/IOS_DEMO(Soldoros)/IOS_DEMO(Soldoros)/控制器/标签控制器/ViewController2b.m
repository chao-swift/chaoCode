//
//  ViewController2.m
//  UITabBarController标签控制器
//
//  Created by rimi on 14-8-8.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "ViewController2b.h"

@interface ViewController2b ()

@end

@implementation ViewController2b

- (id)initWithTitle:(NSString *)title {
    self = [super initWithTitle:title];
    if (self) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
        self.tabBarItem = item;
    }
    return self;
}

- (void)intializeApperance {
    [super intializeApperance];
     UILabel *showLabel = [[UILabel alloc] init];
    showLabel.bounds = CGRectMake(0, 0, 150, 30);
    showLabel.text = _showContent ;
    showLabel.center = CGPointMake(160, 150);
    showLabel.backgroundColor = [UIColor clearColor];
    showLabel.tag = 11;
    [self.view addSubview:showLabel];
}

- (void)viewDidAppear:(BOOL)animated {
    UILabel *showLabel = (UILabel *)[self.view viewWithTag:11];
    showLabel.text = _showContent;
}

- (void)dealloc {
   
}
@end
