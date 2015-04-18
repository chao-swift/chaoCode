//
//  UIAlertView+Show.h
//  代码块
//
//  Created by Chengfj on 14-9-22.
//  Copyright (c) 2014年 RIMI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^alertBlocks)(NSInteger btnIndex);

@interface UIAlertView (Show) <UIAlertViewDelegate>

+ (void)showMsg:(NSString *)msg;

+ (void)showMsg:(NSString *)msg btnClic:(alertBlocks)blocks;

+ (void)showMsg:(NSString *)msg btn1:(NSString *)btn1 btn2:(NSString *)btn2 btnClic:(alertBlocks)blocks;

@end
