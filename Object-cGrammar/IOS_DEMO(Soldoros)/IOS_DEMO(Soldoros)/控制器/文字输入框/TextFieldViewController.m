//
//  TextFieldViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "TextFieldViewController.h"
#import "SelfTextField.h"

@interface TextFieldViewController ()<UITextFieldDelegate>
{
    SelfTextField *_textField;
    CGFloat _changeHeight;
    NSLayoutConstraint *_layout1;
}

@end

@implementation TextFieldViewController

-(id)init
{
    if(self == [super init])
    {
        self.title = [NSString stringWithFormat:@"%@",[self class]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeAppearance];
}

-(void)initializeAppearance
{
    _textField = [[SelfTextField alloc] initForAutoLayout];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];
    _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;//首字母大写
    _textField.autocorrectionType = UITextAutocorrectionTypeNo;//自动更正
    _textField.delegate = self;
    _textField.placeholder = @"等待输入";
    [_textField autoAlignAxisToSuperviewAxis:ALAxisVertical];
    _layout1 = [_textField autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    [_textField autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.6];
    [_textField autoSetDimension:ALDimensionHeight toSize:35];
    [self.view addSubview:_textField];
    
    //添加键盘高度改变监听
    NSNotificationCenter *nc =[NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    //监听键盘收起
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)keyboardChange:(NSNotification *) noti
{
    NSValue *value = noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"];
    CGRect rect = [value CGRectValue];
    _layout1.constant += _changeHeight;
    _changeHeight = rect.size.height ;
    
    [UIView animateWithDuration:0.25 animations:^{
        _layout1.constant -= _changeHeight;
    }];
}

- (void)keyboardWillHide:(NSNotification *)noti
{
    [UIView animateWithDuration:0.25 animations:^{
        _layout1.constant += _changeHeight;
    }];
    _changeHeight = 0;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

@end
