//
//  FontDetailController.m
//  表格tabelView 8.6
//
//  Created by rimi on 14-8-6.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "FontDetailController.h"

@interface FontDetailController ()

- (void)initilizeApperance;

@end

@implementation FontDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _fontName;
    [self initilizeApperance];
    // Do any additional setup after loading the view.
}

- (void)initilizeApperance
{
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10 ,80, 300, 50)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = _fontName;
    label.font = [UIFont fontWithName:_fontName size:20];
    [self.view addSubview:label];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{

}


@end
