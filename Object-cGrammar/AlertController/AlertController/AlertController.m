//
//  AlertController.m
//  AlertController
//
//  Created by Tang on 15/4/18.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import "AlertController.h"

@implementation AlertController


#define VCWIDTH    alertController.view.frame.size.width
#define VCHEIGHT   alertController.view.frame.size.height

#define VIEWWIDTH
/*
UIAlertController
 */

static AlertController * alertController = nil ;
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
{
   
    return [[self alloc] alertControllerWithTitle:title message:message preferredStyle:0] ;
}

-(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        alertController = [[AlertController alloc] init] ;
        alertController.view.backgroundColor = [UIColor lightGrayColor] ;
        alertController.view.alpha = 0.6 ;
        
    }) ;
    self.alertView = [[UIView alloc] init] ;
    self.alertView.backgroundColor = [UIColor whiteColor] ;
    [alertController.view addSubview:self.alertView] ;
    
    self.titleLabel = [[UILabel alloc] init] ;
    self.titleLabel.text = title ;
    self.titleLabel.backgroundColor = [UIColor redColor] ;
    self.titleLabel.textAlignment = NSTextAlignmentCenter ;
    CGSize size = CGSizeMake(320, 20) ;
    UIFont * tFont = [UIFont systemFontOfSize:17.0f] ;
    self.titleLabel.font = tFont ;
    NSDictionary* tDic = [NSDictionary dictionaryWithObjectsAndKeys:tFont, NSFontAttributeName,nil] ;
    CGSize tSize = [title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:tDic context:nil].size ;
    [self.alertView addSubview:self.titleLabel] ;
    
    self.messageLabel = [[UILabel alloc] init] ;
    self.messageLabel.backgroundColor = [UIColor grayColor] ;
    self.messageLabel.text = message ;
    self.messageLabel.textAlignment = NSTextAlignmentCenter ;
    CGSize meSize = CGSizeMake(320, MAXFLOAT) ;
    UIFont* mFont = [UIFont systemFontOfSize:16.0f] ;
    self.messageLabel.font = mFont ;
    NSDictionary* mDic = [NSDictionary dictionaryWithObjectsAndKeys:mFont, NSFontAttributeName,nil] ;
    CGSize mSize = [message boundingRectWithSize:meSize options:NSStringDrawingUsesLineFragmentOrigin attributes:mDic context:nil].size ;
    [self.alertView addSubview:self.messageLabel] ;
    
    CGFloat totalHeight = tSize.height+mSize.height+10+10 ;
    
    self.alertView.frame = CGRectMake(50, (alertController.view.frame.size.height-totalHeight)/2, alertController.view.frame.size.width-100, totalHeight) ;
    //title 的位置
    self.alertView.frame = CGRectMake((self.alertView.frame.size.width - tSize.width)/2, 10, tSize.width, 20) ;
    // message.frame
    self.messageLabel.frame = CGRectMake((self.alertView.frame.size.width- mSize.width)/2, self.titleLabel.frame.origin.y+20+20, mSize.width, mSize.height) ;
    return alertController ;
}
@end
