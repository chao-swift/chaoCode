//
//  TrangelView.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-11-5.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "TrangelView.h"

@implementation TrangelView

- (void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, width / 2, 0);
    CGContextAddLineToPoint(ctx, width, height);
    CGContextAddLineToPoint(ctx, 0, height);
    CGContextAddLineToPoint(ctx, width / 2, 0);
    
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

@end
