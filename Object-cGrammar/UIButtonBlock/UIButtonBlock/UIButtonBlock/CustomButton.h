//
//  CustomButton.h
//  UIButtonBlock
//
//  Created by Tang on 15/4/15.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomButton ;
typedef void (^ButtonBlock)(CustomButton*);

@interface CustomButton : UIButton

@property(nonatomic,copy)ButtonBlock buttonBlock ;
@end
