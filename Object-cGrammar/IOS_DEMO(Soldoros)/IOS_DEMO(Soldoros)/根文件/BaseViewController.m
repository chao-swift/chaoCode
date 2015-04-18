//
//  BaseViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+AutoLayout.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(id)init
{
    if(self == [super init])
    {
        self.title = NSStringFromClass([BaseViewController class]);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.view.backgroundColor = COLOR_a;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self initNavigationBar];
    
    _contentLabel = [[UILabel alloc] initForAutoLayout];
    _contentLabel.backgroundColor = COLOR4(70, 100, 60, 1);
    _contentLabel.font = [UIFont systemFontOfSize:20];
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_contentLabel];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_contentLabel autoSetDimension:ALDimensionHeight toSize:100];
    [_contentLabel autoCenterInSuperview];
    [_contentLabel layoutIfNeeded];
    _contentLabel.layer.masksToBounds = YES;
    _contentLabel.layer.cornerRadius = 5;
    _contentLabel.hidden = YES;
    
    
 


}

-(void)initNavigationBar
{
    _nextItem = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:self action:@selector(barButtonPressed:)];
    _nextItem.tag = 10;
    
    self.navigationItem.rightBarButtonItems = @[_nextItem];

}


-(void)barButtonPressed:(UITabBarItem *)sender
{
    switch (sender.tag-10)
    {
        case 0: [self next]; break;
        default: break;
    }
}

- (void)buttonPressed:(UIButton *)sender
{
    
}


-(void)next
{

}


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.toolbarHidden = YES;
}

- (void)setBtnNames:(NSArray *)btnNames
{
    NSArray *names = btnNames;
    NSMutableArray *buttons = [NSMutableArray array];
    for (int i = 0; i < btnNames.count; i ++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:names[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];
        button.layer.cornerRadius = 5;
        button.backgroundColor = COLOR(200, 200, 200, 1);
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 11 + i;
        [self.view addSubview:button];
        [buttons addObject:button];
    }
    //利用自动布局,设置位置
    UIButton *centerButton = buttons[0];
//    [centerButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [centerButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [centerButton autoSetDimensionsToSize:CGSizeMake(200, 35)];
    [buttons autoDistributeViewsAlongAxis:ALAxisVertical withFixedSize:35 insetSpacing:YES alignment:NSLayoutFormatAlignAllCenterX];
    [buttons autoMatchViewsDimension:ALDimensionWidth];
}









@end
