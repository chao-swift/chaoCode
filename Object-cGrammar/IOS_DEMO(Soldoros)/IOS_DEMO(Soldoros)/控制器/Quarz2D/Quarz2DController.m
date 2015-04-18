//
//  Quarz2DController.m
//  IOS_DEMO(Soldoros)
//
//  Created by rimi on 14-10-24.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "Quarz2DController.h"
#import "Quarz2DView.h"
#import "SelfButton.h"
#import "TalkView.h"
#import "SelfDefineViewController.h"

@interface Quarz2DController ()

@end

@implementation Quarz2DController

- (void)viewDidLoad {
    [super viewDidLoad];
    Quarz2DView *view = [[Quarz2DView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:view];
    
}

- (void)next
{
    SelfDefineViewController *controller = [[SelfDefineViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
