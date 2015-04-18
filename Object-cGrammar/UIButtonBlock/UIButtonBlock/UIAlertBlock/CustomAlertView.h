//
//  CustomAlertView.h
//  UIButtonBlock
//
//  Created by Tang on 15/4/15.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomAlertView ;
typedef void (^AlertBlock)(NSInteger);
@interface CustomAlertView : UIAlertView<UIAlertViewDelegate>

@property(nonatomic,copy)AlertBlock alertBlock ;


-(id)initWithTitle:(NSString *)title message:(NSString *)message  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles block:(AlertBlock)alertBlock ;

@end
