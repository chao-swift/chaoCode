//
//  SegmentedViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "SegmentedViewController.h"

@interface SegmentedViewController ()

@end

@implementation SegmentedViewController
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
    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:@[@"第一段",@"第二段",@"第三段"]];
    [self.view addSubview:control];
    [control autoCenterInSuperview];
    [control autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.5];
    [control autoSetDimension:ALDimensionHeight toSize:40];
    [control addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventValueChanged];
}

- (void)pressed:(UISegmentedControl *)control
{
    NSLog(@"%ld",control.selectedSegmentIndex);
}


@end
