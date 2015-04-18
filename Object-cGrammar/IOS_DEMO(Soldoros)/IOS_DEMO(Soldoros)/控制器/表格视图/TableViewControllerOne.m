//
//  TableViewControllerOne.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "TableViewControllerOne.h"

@interface TableViewControllerOne ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}

- (void)initializeDataSource;

@end

@implementation TableViewControllerOne

-(id)init
{
    if(self == [super init])
    {
        self.title = [NSString stringWithFormat:@"表格"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeAppearance];
}

- (void)initializeDataSource
{
    _dataArray = [NSMutableArray arrayWithArray:@[@"张三",@"李四",@"王五"]] ;
    
}

-(void)initializeAppearance
{
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = addItem;
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];
    self.navigationItem.rightBarButtonItems = @[addItem,editItem];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.allowsSelectionDuringEditing = YES;
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//去掉分界线
    [self.view addSubview:_tableView];
}

- (void)add
{
    [_dataArray addObject:@"赵六"];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_dataArray.count - 1 inSection:0];
    [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)edit
{
    _tableView.editing = !_tableView.editing;
    UIBarButtonItem *item = self.navigationItem.rightBarButtonItems[1];
    item.title = _tableView.editing?@"编辑":@"取消" ;
}

#pragma  mark  - tableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;//设置选中样式
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row % 2) {
        return @"删除";
    }
    return @"delete";
}

/*
 ios8使横线左对齐
 */
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        [tableView setSeparatorInset:UIEdgeInsetsZero];
//    }
//
//    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
//        [tableView setLayoutMargins:UIEdgeInsetsZero];
//    }
//
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//}

//编辑确认方法
//对表视图的单元移除分为两部,a,数据擦除 b,单元格的移除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_dataArray removeObjectAtIndex:indexPath.row];
        //indexPath就是一个对象类型,这里表示这个单元格
        [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


@end
