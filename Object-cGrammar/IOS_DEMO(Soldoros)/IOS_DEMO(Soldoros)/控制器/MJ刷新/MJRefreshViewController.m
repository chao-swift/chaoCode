//
//  MJRefreshViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/12/8.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//
#define BASIC_URL                       @"http://www.youchu100.com/api.html"
#define APP_KEY                         @"111111"



#import "MJRefreshViewController.h"
#import"MJRefresh.h"
#import "AFNetworking.h"
#import "MJRefreshTableViewCell.h"

@interface MJRefreshViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *goodsTableView;
    NSMutableArray *dataArray;
    
    //自动加载更多
    NSInteger _pageNumber;
    MJRefreshFooterView *_footer;
}


@end


@implementation MJRefreshViewController

-(void)initdata
{
    dataArray = [NSMutableArray new];
}
-(void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self initdata];
    //内容控制器从导航栏底部开始
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.toolbar.translucent = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initializeAppearance];
    
}

//初始化视图
-(void)initializeAppearance
{
    goodsTableView = [[UITableView alloc]init];
    goodsTableView.frame = AUTOLayer(0, 0, 320, 568, 1);
    goodsTableView.dataSource = self;
    goodsTableView.delegate = self;
    [self.view addSubview:goodsTableView];
    
    [self netWorking];
    [self addFooter];
    
}

-(void)netWorking
{
    
    _pageNumber = 0;
    
    //用请求的参数判断  是本店未处理的还是所有未处理的商品
    NSDictionary * parameters =  @{@"key": APP_KEY,
                                   @"controller": @"orderAgency",
                                   @"action": @"list",
                                   @"uid":@"48",
                                   @"page": @(_pageNumber),
                                   @"status":@111111};
    
    [CRequestManager requestWith:parameters method:BASIC_URL
                   requestSucess:^(id object)
     {
         NSLog(@"%@",object);
         for(int i=0;i<[object[@"data"] count];++i)
         {
             NSDictionary *dic = object[@"data"][i];
             [dataArray addObject:dic[@"statusName"]];
         }
         
         
         [goodsTableView reloadData];
     }
                  requestFailure:^
     {
         NSLog(@"网络请求失败");
     }];
}

- (void)addFooter
{
    MJRefreshFooterView *footer;
    if(!_footer)
        footer = [MJRefreshFooterView footer];
    footer.scrollView = goodsTableView;
    
    footer.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView)
    {
        _pageNumber ++;
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
        NSDictionary *parameters = @{@"key": APP_KEY,
                                     @"controller": @"orderAgency",
                                     @"action": @"list",
                                     @"uid":@"48",
                                     @"page": @(_pageNumber),
                                     @"status":@""};
        
        [manager POST:BASIC_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             for(int i=0;i<[responseObject[@"data"] count];++i)
             {
                 NSDictionary *dic = responseObject[@"data"][i];
                 [dataArray addObject:dic[@"statusName"]];
             }
             [self doneWithView:refreshView];
             
         }
              failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             
         }];
    };
    _footer = footer;
}


- (void)doneWithView:(MJRefreshBaseView *)refreshView
{
    [goodsTableView  reloadData];
    
    //结束刷新状态
    [refreshView endRefreshing];
}

- (void)dealloc
{
    [_footer free];
}



#pragma UITableView selfDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = @"cellStr";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text = dataArray[indexPath.row];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"击中测试");
}







@end


