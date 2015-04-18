//
//  CustomAlertView.m
//  UIButtonBlock
//
//  Created by Tang on 15/4/15.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import "CustomAlertView.h"

@implementation CustomAlertView

-(id)initWithTitle:(NSString *)title message:(NSString *)message  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles block:(AlertBlock)alertBlock
{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil] ;//主意 这里初始化父类的
    if (self) {
        self.alertBlock = alertBlock ;
    }
    return self ;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //这里调用函数指针_alertBlock(要传进来的参数)
    _alertBlock(buttonIndex) ;
}
@end
