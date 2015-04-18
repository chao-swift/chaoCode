//
//  SelfButton.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-11-5.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "SelfButton.h"

@implementation SelfButton

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    CGContextFillEllipseInRect(ctx, rect);
}

@end
