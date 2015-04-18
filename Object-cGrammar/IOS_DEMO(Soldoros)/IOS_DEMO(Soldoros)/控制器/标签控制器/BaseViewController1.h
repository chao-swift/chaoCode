//
//  BaseViewController.h
//  UITabBarController标签控制器
//
//  Created by rimi on 14-8-8.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import <UIKit/UIKit.h>

//抽象基类,无需实例化,子类继承于抽象基类,获取到一些相同的功能实现
@interface BaseViewController1 : UIViewController

- (id)initWithTitle:(NSString *)title;
- (void)intializeApperance;

@end
