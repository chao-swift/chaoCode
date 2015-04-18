//
//  DataSourceTwoViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "DataSourceTwoViewController.h"
#import "EntityOneDao.h"

@interface DataSourceTwoViewController ()
{
    UITextField *_userTextField;
    UITextField *_pwdTextField;
}

@end

@implementation DataSourceTwoViewController

-(id)init
{
    if(self == [super init])
    {
        self.title = @"CoreData";
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
    _userTextField = [[UITextField alloc] initForAutoLayout];
    [self.view addSubview:_userTextField];
    _userTextField.placeholder = @"请输入用户名";
    _userTextField.borderStyle = UITextBorderStyleRoundedRect;
    [_userTextField autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.7];
    [_userTextField autoSetDimension:ALDimensionHeight toSize:30];
    [_userTextField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
    [_userTextField autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    _pwdTextField = [[UITextField alloc] initForAutoLayout];
    [self.view addSubview:_pwdTextField];
    _pwdTextField.placeholder = @"请输入密码";
    _pwdTextField.borderStyle = UITextBorderStyleRoundedRect;
    [_pwdTextField autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.7];
    [_pwdTextField autoSetDimension:ALDimensionHeight toSize:30];
    [_pwdTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_userTextField withOffset:10];
    [_pwdTextField autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    NSArray *namesArray = @[@"增加",@"删除",@"查询",@"修改"];
    NSMutableArray *buttons = [NSMutableArray array];
    for (int i = 0 ; i < namesArray.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.backgroundColor = COLOR(50, 120, 50, 1);
        [button setTitle:namesArray[i] forState:UIControlStateNormal];
        [buttons addObject:button];
        button.titleLabel.font = [UIFont systemFontOfSize:10];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 21 + i;
    }
    [buttons[0] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_pwdTextField withOffset:15];
    [buttons[0] autoSetDimension:ALDimensionHeight toSize:25];
    [buttons autoMatchViewsDimension:ALDimensionHeight];
    [buttons autoDistributeViewsAlongAxis:ALAxisHorizontal withFixedSpacing:10 alignment:NSLayoutFormatAlignAllCenterY];
}

- (void)buttonPressed:(UIButton *)sender
{
    switch (sender.tag - 21)
    {
        case 0:
        {
            [self insertData];
            break;
        }
        case 1:
        {
            [self deleteData];
            break;
        }
        case 2:
        {
            [self readData];
            break;
        }
        case 3:
        {
            [self modifyData];
            break;
        }
            
        default:
            break;
    }
}

- (NSDictionary *)getInputData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:_userTextField.text forKey:@"username"];
    [dic setValue:_pwdTextField.text forKey:@"pwd"];
    return dic;
}

- (void)insertData
{
    [EntityOneDao insertObjectWithParameter:[self getInputData] entityName:@"EntityOne"];
}

- (void)deleteData
{
    [EntityOneDao deleteWithEntityName:@"EntityOne" predicate:[NSPredicate predicateWithFormat:@"username like 'A*'"]];
}

- (void)readData
{
    NSArray *array = [EntityOneDao readObjectWithEntityName:@"EntityOne" predicate:nil];
    NSLog(@"%@",array);
}

- (void)modifyData
{
    [EntityOneDao modifyWithEntityName:@"EntityOne" predicate:[NSPredicate predicateWithFormat:@"username like 'A*'"] modifyData:[self getInputData]];
}

@end
