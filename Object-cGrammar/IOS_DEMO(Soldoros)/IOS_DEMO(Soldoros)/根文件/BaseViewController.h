//
//  BaseViewController.h
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+AutoLayout.h"
#define COLOR4(_R_,_G_,_B_,_A_) [UIColor colorWithRed:(_R_)/255.0f green:(_G_)/255.0f blue:(_B_)/255.0f alpha:_A_]

@interface BaseViewController : UIViewController

@property(nonatomic,strong) UIBarButtonItem *nextItem;
@property(nonatomic,strong) NSArray *btnNames;
@property(nonatomic,strong) UILabel *contentLabel;

- (void)next;
- (void)buttonPressed:(UIButton *)sender;

@end
