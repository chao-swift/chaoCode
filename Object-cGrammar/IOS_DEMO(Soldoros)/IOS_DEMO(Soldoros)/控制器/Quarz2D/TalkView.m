//
//  TalkView.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-11-5.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "TalkView.h"
#define COLOR4(_R_,_G_,_B_,_A_) [UIColor colorWithRed:(_R_)/255.0f green:(_G_)/255.0f blue:(_B_)/255.0f alpha:_A_]


@implementation TalkView

- (void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 1, 0, 1, 1);
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, 20, 0);
    
    CGContextAddLineToPoint(ctx, width - 10, 0);
    CGContextAddArc(ctx, width - 10, 10, 10, M_PI *1.5, 0, 0);
    
    CGContextAddLineToPoint(ctx,width, height - 10);
    CGContextAddArc(ctx, width - 10, height - 10, 10, 0,M_PI * 0.5, 0);
    
    CGContextAddLineToPoint(ctx, 20, height);
    CGContextAddArc(ctx, 20, height - 10, 10, M_PI * 0.5,M_PI, 0);
    
    CGContextAddLineToPoint(ctx, 10, 20);
    CGContextAddLineToPoint(ctx, 0, 10);
    CGContextAddLineToPoint(ctx, 10, 10);

    CGContextAddArc(ctx, 20,  10, 10, M_PI ,M_PI * 1.5, 0);
    
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);

}

- (void)setDirection:(Direction)direction
{
    _direction = direction;
    [self drawRect:self.bounds];
}

@end
