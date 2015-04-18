//
//  SelfDefineViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-11-5.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "SelfDefineViewController.h"
#import "SelfButton.h"
#import "TalkView.h"
#import "TrangelView.h"

@interface SelfDefineViewController ()

@end

@implementation SelfDefineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    SelfButton *button = [SelfButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button autoCenterInSuperview];
    [button autoSetDimensionsToSize:CGSizeMake(200, 100)];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    TalkView *talkView = [[TalkView alloc] initForAutoLayout];
    [self.view addSubview:talkView];
    [talkView autoSetDimensionsToSize:CGSizeMake(250, 100)];
    [talkView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:button withOffset:10];
    [talkView autoAlignAxis:ALAxisVertical toSameAxisOfView:button];
    [talkView layoutIfNeeded];
    talkView.direction = DLeft;
    
    TalkView *talkView2 = [[TalkView alloc] initForAutoLayout];
    [self.view addSubview:talkView2];
    [talkView2 autoSetDimensionsToSize:CGSizeMake(100, 50)];
    [talkView2 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:button withOffset:-10];
    [talkView2 autoAlignAxis:ALAxisVertical toSameAxisOfView:button];
    [talkView2 layoutIfNeeded];
    talkView2.direction = DLeft;
    
    TrangelView *trangleView = [[TrangelView alloc] initForAutoLayout];
    [self.view addSubview:trangleView];
    [trangleView autoSetDimensionsToSize:CGSizeMake(250, 100)];
    [trangleView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:talkView withOffset:10];
    [trangleView autoAlignAxis:ALAxisVertical toSameAxisOfView:button];
    [trangleView layoutIfNeeded];
}

- (void)click
{
    NSLog(@"点击");
}

@end
