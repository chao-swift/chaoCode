//
//  MyViewController.m
//  UI高级动画
//
//  Created by rimi on 14-8-14.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()



@end

@implementation MyViewController

- (id)initWithTitle:(NSString *)title tabbarTitle:(NSString *)tabbarTitle
{
    self = [super init];
    if(self) {
        self.title = title;
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:tabbarTitle image:[UIImage imageNamed:@"开灯.png"] tag:1];
        self.tabBarItem = item;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeApperance];
    // Do any additional setup after loading the view.
}

- (void)initializeApperance
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    [label setCenter:self.view.center];
    label.text = @"Animation";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self animation];
        
    
}

- (void)animation
{
    
}

@end
