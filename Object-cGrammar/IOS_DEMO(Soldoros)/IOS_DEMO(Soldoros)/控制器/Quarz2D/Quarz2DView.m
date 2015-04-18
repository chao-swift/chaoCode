//
//  Quarz2DView.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-11-5.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "Quarz2DView.h"

@implementation Quarz2DView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 5);
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    const CGPoint points[] = {CGPointMake(10, 20),CGPointMake(10, 40),CGPointMake(10, 20),CGPointMake(30, 40)};
    CGContextStrokeLineSegments(ctx, points, 4);
    
    CGContextSetLineCap(ctx, kCGLineCapSquare);
    const CGPoint points1[] = {CGPointMake(60, 20),CGPointMake(60, 60),CGPointMake(60, 20),CGPointMake(80, 60)};
    CGContextStrokeLineSegments(ctx, points1, 4);
    
    CGContextSetLineCap(ctx,kCGLineCapRound);
    const CGPoint points2[] = {CGPointMake(100, 20),CGPointMake(100, 60),CGPointMake(100, 20),CGPointMake(120, 60)};
    CGContextStrokeLineSegments(ctx, points2, 4);
    
    
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextSetLineWidth(ctx, 10);
    CGFloat patter1[] = {6,10};
    CGContextSetLineDash(ctx, 5, patter1, 2);
    const CGPoint points3[] = {CGPointMake(20, 130),CGPointMake(300, 130)};
    CGContextStrokeLineSegments(ctx, points3, 2);
    
    CGFloat patter2[] = {5,1,4,1,3,1,2,10,1,1,1,2,4};
    CGContextSetLineDash(ctx, 7, patter2, 10);//最后一个参数表示绘制多少个空隙
    const CGPoint points4[] = {CGPointMake(20, 160),CGPointMake(300, 160)};
    CGContextStrokeLineSegments(ctx, points4, 4);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(30, 180, 120, 60));
    
    CGContextSetLineDash(ctx, 0, 0, 0);
    CGContextStrokeRect(ctx, CGRectMake(50, 200, 120, 60));
    
    CGContextStrokeEllipseInRect(ctx, CGRectMake(30, 380, 120, 60));
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    CGContextFillEllipseInRect(ctx, CGRectMake(180, 380, 120, 60));
    
    //绘制一个聊天背景
}

@end
