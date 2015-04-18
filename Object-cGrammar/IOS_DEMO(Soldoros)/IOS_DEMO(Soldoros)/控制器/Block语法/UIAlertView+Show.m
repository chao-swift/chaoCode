//
//  UIAlertView+Show.m
//  代码块
//
//  Created by Chengfj on 14-9-22.
//  Copyright (c) 2014年 RIMI. All rights reserved.
//

#import "UIAlertView+Show.h"


static alertBlocks _alertBlcos;
static NSString * name;

@implementation UIAlertView (Show)

/**
 *  代码块
 *
 *  @param msg    显示类容
 *  @param blocks 调用代码块
 */
+ (void)showMsg:(NSString *)msg btnClic:(alertBlocks)blocks
{
    _alertBlcos = blocks;
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:[self self] cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}


+ (void)showMsg:(NSString *)msg
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

+ (void)showMsg:(NSString *)msg btn1:(NSString *)btn1 btn2:(NSString *)btn2 btnClic:(alertBlocks)blocks
{
    _alertBlcos = blocks;
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:[self self] cancelButtonTitle:btn1 otherButtonTitles:btn2, nil];
    [alert show];

}

+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    
    
    _alertBlcos(buttonIndex);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
