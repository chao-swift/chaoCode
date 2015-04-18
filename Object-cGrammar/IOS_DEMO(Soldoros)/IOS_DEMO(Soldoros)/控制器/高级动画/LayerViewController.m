//
//  LayerViewController.m
//  UI高级动画
//
//  Created by rimi on 14-8-14.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "LayerViewController.h"

@interface LayerViewController ()
{
    UIButton *button;
}

- (void)initializeApperance;

@end

@implementation LayerViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"LayerView";
           UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"1" image:[UIImage imageNamed:@"开灯.png"] tag:1];
        self.tabBarItem = item;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeApperance];
}

- (void)initializeApperance {
    
    self.view.backgroundColor = [UIColor whiteColor];
    button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 150, 150);
    [button setCenter:self.view.center];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    //配置边框,配置阴影,配置圆角
    button.layer.borderColor = [[UIColor blackColor] CGColor];
    button.layer.borderWidth = 5;
    button.layer.cornerRadius = 5;
    button.layer.shadowColor = [[UIColor blackColor] CGColor];
    button.layer.shadowOffset = CGSizeMake(4, 4);
    
    //配置锚点
    button.layer.anchorPoint = CGPointMake(0, 0.2);
    NSLog(@"center = %@",NSStringFromCGPoint(button.center));
    NSLog(@"anchor = %@",NSStringFromCGPoint(button.layer.anchorPoint));
    
    [button addTarget:self action:@selector(down) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(up) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)down {
    button.layer.shadowOpacity = 1;
    [UIView animateWithDuration:0.5 animations:^{
        button.transform = CGAffineTransformScale(button.transform, 1.1, 1.1);
        
    }];
}
- (void)up {
    button.layer.shadowOpacity = 0;
    [UIView animateWithDuration:0.5 animations:^{
       // button.transform = CGAffineTransformRotate(button.transform, M_PI_2);
        button.transform = CGAffineTransformScale(button.transform, 0.9, 0.9);
        //CGAffineTransformMakeRotation(),直接对transform属性进行替换
        //CGAffineTransformRotate  ,基于之前的视图进行叠加
        
    }];
}

@end
