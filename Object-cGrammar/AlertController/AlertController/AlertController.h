//
//  AlertController.h
//  AlertController
//
//  Created by Tang on 15/4/18.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertController : UIViewController


@property(nonatomic,copy)NSString* title ;
@property(nonatomic,copy)NSString* message ;
@property(nonatomic,strong)UIView* alertView ;
@property(nonatomic,strong)UILabel* titleLabel ;
@property(nonatomic,strong)UILabel* messageLabel ;
@property(nonatomic,strong)UIButton* okBtn ;



+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle ;
@end
