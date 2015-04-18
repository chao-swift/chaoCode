//
//  CustomTextField.m
//  CustomTextField
//
//  Created by Tang on 15/4/16.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import "CustomTextField.h"


@interface CustomTextField ()

@end
@implementation CustomTextField


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame] ;
    if (self)
    {
        [self setBackground:[UIImage imageNamed:@"登录注册输入框"]] ;
    }
    return self ;
}
-(void)setLeftImage:(UIImage *)leftImage
{
    UIImageView* imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, self.frame.size.height/2)] ;
    imageview.image = leftImage ;
//    imageview.backgroundColor = [UIColor redColor] ;
    self.leftView = imageview ;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    return CGRectMake(20, 10, 30, self.frame.size.height/2) ;
}
#pragma mark - Methods the rewriting system for display area is provided the text
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake(60, 0, bounds.size.width-60, bounds.size.height) ;
}
#pragma mark - Methods the rewriting system to display the location of the region set the placeHolder text
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return CGRectMake(60, 0, bounds.size.width-60, bounds.size.height) ;
}
//#pragma mark - The editing area location
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectMake(55, 0, bounds.size.width - 55, bounds.size.height) ;
}
@end
