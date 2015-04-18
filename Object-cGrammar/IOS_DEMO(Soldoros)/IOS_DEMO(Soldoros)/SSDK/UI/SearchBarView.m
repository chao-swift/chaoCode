//
//  SearchBarView.m
//  西南交大-池增阳
//
//  Created by yy on 14-10-11.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "SearchBarView.h"

@implementation SearchBarView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initData];
        [self initSearchBar];
    }
    return self;
}

-(void)initData
{
    _searchStr = @"请输入搜索的内容";
    _imageView = nil;
}

-(void)initSearchBar
{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [[UIColor grayColor]CGColor];
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 4;
    [self addSubview:_imageView];
    
    _textField = [[UITextField alloc] initWithFrame:self.frame];
    [_textField setBackgroundColor:[UIColor clearColor]];
    [_textField setTextColor:[UIColor grayColor]];
    [_textField setTextAlignment:NSTextAlignmentLeft];
    [_textField setReturnKeyType:UIReturnKeySearch];
    [_textField setPlaceholder:_searchStr];
    [self addSubview:_textField];

}








@end










//
