//
//  TableViewControllerTwo.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "TableViewControllerTwo.h"

#import "FontDetailController.h"

@interface TableViewControllerTwo () <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

{
    UITableView *_tableView;
    NSMutableDictionary *_dataSource;
    NSMutableArray *_keys;
    NSMutableArray *otherArray;
}

- (void)initializeApperance;
- (void)initializeDataSource;

@end

@implementation TableViewControllerTwo

- (instancetype)init
{
    self = [super init];
    if(self) {
        self.title = @"Font";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeDataSource];
    [self initializeApperance];
}

- (void)initializeDataSource
{
    _dataSource = [[NSMutableDictionary alloc] init];
    NSArray *fontList = [UIFont familyNames];
    //遍历所有字体以及分类
    for(NSString *font in fontList) {
        //非字母情况
        //小写字母情况
        //添加到对应的列表中
        char character = [font characterAtIndex:0];
        if(character < 'A' || character > 'z' || (character > 'Z' && character < 'a')) {
            [otherArray addObject:font];
            continue;
        }
        if(character > 'a' && character < 'z') {
            character -= 32;
        }
        NSString *key = [NSString stringWithFormat:@"%c",character];
        //获取对应key的列表,如果没有则创建
        NSMutableArray *fonts = [NSMutableArray arrayWithArray:_dataSource[key]];
        [fonts addObject:font];
        //更新列表;
        [_dataSource setObject:fonts forKey:key];
    }
    _keys = [NSMutableArray arrayWithArray:[_dataSource allKeys]];
    [_keys sortUsingSelector:@selector(caseInsensitiveCompare:)];
    if([otherArray count] > 0) {
        
        [_keys addObject:@"#"];
        [_dataSource setObject:otherArray forKey:@"#"];
    }
    
}

- (void)initializeApperance
{
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.sectionIndexColor = [UIColor yellowColor];
    _tableView.sectionIndexBackgroundColor = [UIColor redColor];
    _tableView.sectionIndexTrackingBackgroundColor = [UIColor greenColor];
    [self.view addSubview:_tableView];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_tableView.bounds), 44)];
    searchBar.delegate = self;
    searchBar.placeholder = @"Search";
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    searchBar.barTintColor = [UIColor whiteColor];
    searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    searchBar.tintColor = [UIColor redColor];
    searchBar.showsBookmarkButton = YES;
    searchBar.delegate = self;
    _tableView.tableHeaderView = searchBar;
    //    UISearchController
    //1配置分组/区域数量
    //2.配置指定分组包含的爱护你个数
    //3,配置指定行如何显示
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource[_keys[section]] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_keys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //声明cell重用表示
    static NSString *cellIdentifier = @"Cell";
    //若队列中没有可用的cell,则创建一个
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell) {
        //初始化cell并配置类型,关联重用标识
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSArray *fonts = _dataSource[_keys[indexPath.section]];
    NSString *fontName = fonts[indexPath.row];
    cell.textLabel.text = fontName;
    cell.textLabel.font = [UIFont fontWithName:fontName size:17];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 1, 40, 40)];
    imageView.image = [UIImage imageNamed:@"开灯.png"];
    [cell addSubview:imageView];
    //取消高亮状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _keys[section];
}

//取消选中后调用
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FontDetailController *fontDetailController = [FontDetailController new];
    NSArray *fonts = _dataSource[_keys[indexPath.section]];
    NSString *fontName = fonts[indexPath.row];
    fontDetailController.fontName = fontName;
    [self.navigationController pushViewController:fontDetailController animated:YES];
   
}
//右边索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
    return _keys;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {

}

@end

