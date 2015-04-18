//
//  CustomButton.m
//  UIButtonBlock
//
//  Created by Tang on 15/4/15.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import "CustomButton.h"
#import <QuartzCore/QuartzCore.h>  // 此处用到layer 

@implementation CustomButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame] ;
    if (self)
    {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        self.layer.borderWidth = 2;
        self.layer.shadowRadius = 2;
        self.layer.shadowColor = [UIColor grayColor].CGColor;
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.adjustsImageWhenHighlighted = YES ;
        self.showsTouchWhenHighlighted = YES ;
        [self addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self ;
}
-(void)touchAction:(id)sender
{
    _buttonBlock(self) ;
}


@end
