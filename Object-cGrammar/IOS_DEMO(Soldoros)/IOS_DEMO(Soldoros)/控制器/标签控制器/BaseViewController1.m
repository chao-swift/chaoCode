//
//  BaseViewController.m
//  UITabBarController标签控制器
//
//  Created by rimi on 14-8-8.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "BaseViewController1.h"
#import "UIColor+Expand.h"

@interface BaseViewController1 ()


@end

@implementation BaseViewController1

- (id)initWithTitle:(NSString *)title {
    self = [super init];
    if(self){
        self.title = title;
    }
    return self;
}

- (void)intializeApperance {
    self.view.backgroundColor = [UIColor specialRandomColor];
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = self.title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self intializeApperance];
    
}




@end
