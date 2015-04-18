//
//  ViewController1.m
//  UITabBarController标签控制器
//
//  Created by rimi on 14-8-8.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 () <UITextFieldDelegate>


@end

@implementation ViewController1

- (id)initWithTitle:(NSString *)title {
    self = [super initWithTitle:title];
    if (self) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
        self.tabBarItem = item;
    }
    return self;
}

- (void)intializeApperance
{
    [super intializeApperance];
    //添加一个输入框
    _textFiled = [[UITextField alloc] init];
    _textFiled.bounds = CGRectMake(0, 0, 150, 30);
    _textFiled.center = CGPointMake(160, 150);
    _textFiled.borderStyle = UITextBorderStyleRoundedRect;
    _textFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _textFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    _textFiled.delegate = self;
    [self.view addSubview:_textFiled];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textFiled resignFirstResponder];
    return YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self.view endEditing:YES];
}


- (void)dealloc {
 
}

@end
