//
//  SwitchViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "SwitchViewController.h"

@interface SwitchViewController ()

@end

@implementation SwitchViewController

-(id)init
{
    if(self == [super init])
    {
        self.title = [NSString stringWithFormat:@"%@",[self class]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeAppearance];
}

-(void)initializeAppearance
{
    UISwitch *switchOne = [[UISwitch alloc] initForAutoLayout];
    [switchOne addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:switchOne];
    [switchOne autoCenterInSuperview];
    switchOne.onTintColor = COLOR(22, 99, 190, 1);
}

- (void)change:(UISwitch *)switchOne
{
    if(switchOne.on)
    {
        NSLog(@"打开");
    } else {
        NSLog(@"关闭");}
}

@end
