//
//  SelfTextField.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-27.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "SelfTextField.h"

@implementation SelfTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, 30, 30)];
        imageView.image = [UIImage imageNamed:@"关灯.png"];
        [self addSubview:imageView];
    }
    return self;
}



- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x + 45, bounds.origin.y + 5, bounds.size.width - 10 , bounds.size.height - 10);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x + 45, bounds.origin.y + 5, bounds.size.width - 10 , bounds.size.height - 10);
}

@end
