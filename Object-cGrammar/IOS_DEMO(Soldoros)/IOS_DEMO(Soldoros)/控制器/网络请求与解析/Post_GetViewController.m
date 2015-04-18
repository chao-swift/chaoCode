//
//  Post_GetViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "Post_GetViewController.h"
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "WebViewController.h"

// GET请求地址
#define GET_URL_STRING [NSString stringWithFormat:@"http://api.jiepang.com/v1/locations/search?lat=%f&lon=%f&source=100000&count=50",30.575413,104.064359]
// POST请求地址
#define POST_URL_STRING @"http://125.70.10.34:8119/ggc/api.php"
//#define POST_URL_STRING @"http://120.27.30.130:80/login"

@interface Post_GetViewController ()<NSURLConnectionDataDelegate, UITableViewDataSource> {
    
    NSMutableData *_responseData;
    UIActivityIndicatorView *_indicatorView;
    UITableView *_tableView;
    NSMutableArray *_dataSource;
    NSString *_HTTPMethod; // 标志请求方法
}
- (void)initializeAppearance;
- (void)updateAppearanceWithObject:(id)object;

- (void)barButtonPressed:(UIBarButtonItem *)sender;

// GET请求
- (void)synchronizedGETRequest; // 同步
- (void)asynchronizedGETRequest; // 异步
- (NSURLRequest *)GETURLRequest;

// POST请求
- (void)synchronizedPOSTRequest; // 同步
- (void)asynchronizedPOSTRequest; // 异步
- (NSURLRequest *)POSTURLRequestWithParameters:(NSDictionary *)parameters;

// JSON数据解析
- (id)JSONObjectWithData:(NSData *)data;



@end

@implementation Post_GetViewController

-(id)init
{
    if(self == [super init])
    {
       // self.title = [NSString stringWithFormat:@"%@",[self class]];
        
        self.title = NSStringFromClass([self class]);
        _responseData = [[NSMutableData alloc] init];
        _dataSource = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.toolbarHidden = NO;
    
    
    [self initializeAppearance];
}

-(void)initializeAppearance
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    // GET
    UIBarButtonItem *GETItem = [[UIBarButtonItem alloc] initWithTitle:@"GET" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonPressed:)];
    GETItem.tag = 10;
    self.navigationItem.leftBarButtonItem = GETItem;
    
    // POST
    UIBarButtonItem *POSTItem = [[UIBarButtonItem alloc] initWithTitle:@"POST" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonPressed:)];
    POSTItem.tag = 11;
    self.navigationItem.rightBarButtonItem = POSTItem;
    
    _tableView = [[UITableView alloc] initWithFrame:AUTOLayer(0,0,320,460,1) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicatorView.bounds = CGRectMake(0, 0, 30, 30);
    _indicatorView.center = CGPointMake(CGRectGetWidth(self.view.bounds) / 2, CGRectGetHeight(self.view.bounds) / 2);
    [self.view addSubview:_indicatorView];
    
    
    NSArray *btnArr = @[@"POST+GET",@"WEBRest"];
    for(int i=0;i<2;++i)
    {
        UIButton *btn = [UIButton buttonWithType: UIButtonTypeSystem];
        btn.frame = AUTOLayer(10+i*200,460,100,40,1);
        btn.tag = 20+i;
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:btnArr[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnpressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
//    UIView *bottomView = [[UIView alloc]init];
//    bottomView.frame = AUTOLayer(0,460,320,40,1);
//    bottomView.backgroundColor = [UIColor redColor];
//    [self.view addSubview: bottomView];
    
    

}

-(void)btnpressed:(UIButton *)sender
{
    if(sender.tag == 20)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    if(sender.tag == 21)
    {
        WebViewController *web = [[WebViewController alloc]init];
        [self.navigationController presentViewController:web animated:YES completion:nil];
        
        self.navigationController.toolbarHidden = YES;
    }
}

- (void)updateAppearanceWithObject:(id)object {
    
    // 清除原始数据
    [_dataSource removeAllObjects];
    // GET
    if ([_HTTPMethod isEqualToString:@"GET"]) {
        [_dataSource addObjectsFromArray:object[@"items"]];
    }
    // POST
    else {
        NSDictionary *content = object[@"content"];
        [_dataSource addObjectsFromArray:content[@"relation_type_list"]];
    }
    [_tableView reloadData];
}

- (void)barButtonPressed:(UIBarButtonItem *)sender
{
    
    NSInteger index = sender.tag - 10;
    // GET
    if (index == 0)
    {
        _HTTPMethod = @"GET";
        // 同步
        // [self synchronizedGETRequest];
        // 异步
        [self asynchronizedGETRequest];
    }
    // POST
    else {
        _HTTPMethod = @"POST";
        // 同步
        // [self synchronizedPOSTRequest];
        // 异步
        [self asynchronizedPOSTRequest];
    }
}

#pragma mark - GET request methods

- (void)synchronizedGETRequest
{
    
    [_indicatorView startAnimating];
    
    // 使用NSURLConnection发起同步请求
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:[self GETURLRequest] returningResponse:nil error:&error];
    // 判断请求是否成功
    if (error)
    {
        NSLog(@"request did faield with error message '%@'.", [error localizedDescription]);
        return;
    }
    // NSString *responseString = [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease];
    // NSLog(@"%@", responseString);
    
    // JSON解析
    id object = [self JSONObjectWithData:responseData];
    NSLog(@"%@", object);
    
    // 更新界面
    [self updateAppearanceWithObject:object];
    
    [_indicatorView stopAnimating];
}

- (void)asynchronizedGETRequest {
    
    [_indicatorView startAnimating];
    
    // 使用NSURLConnection发起异步请求
    [NSURLConnection connectionWithRequest:[self GETURLRequest]
                                  delegate:self];
}

- (NSURLRequest *)GETURLRequest {
    
    NSString *str = @"http://120.27.30.130:8983/solr/product/select?q=text:sk?";
    
    NSURL *url = [NSURL URLWithString:str];
    return [NSURLRequest requestWithURL:url];
}

#pragma mark - NSURLConnectionDataDelegate methods

// 请求接收到数据包时调用(可能多次调用)
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [_responseData appendData:data];
    
}

// 请求完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    [_indicatorView stopAnimating];
    
    // NSString *responseString = [[[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding] autorelease];
    // NSLog(@"%@", responseString);
    
    // JSON解析
    id object = [self JSONObjectWithData:_responseData];
    NSLog(@"%@", object);
    
    // 刷新界面
    [self updateAppearanceWithObject:object];
    
    // 清空缓冲区
    _responseData.length = 0;
}

// 请求失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    [_indicatorView stopAnimating];
    
    NSLog(@"request did failed with error message '%@'.", [error localizedDescription]);
}

#pragma mark - POST request methods

- (void)synchronizedPOSTRequest {
    
    [_indicatorView startAnimating];
    
    NSDictionary *parameters = @{
                                 @"g": @"ApiGGC",
                                 @"m": @"Public",
                                 @"c": @"getConstantList",
                                 @"type": @"relation_type"
                                 };
//    NSDictionary *parameters = @{@"p0":@"11111@qq.com",
//                                 @"p1":@"123456",
//                                 @"p2":@"0"};
    
    // 使用NSURLConnection发起同步请求
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:[self POSTURLRequestWithParameters:parameters] returningResponse:nil error:&error];
    // 判断请求是否成功
    if (error)
    {
        NSLog(@"request did faield with error message '%@'.", [error localizedDescription]);
        return;
    }
    // NSString *responseString = [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease];
    // NSLog(@"%@", responseString);
    
    // JSON解析
    id object = [self JSONObjectWithData:responseData];
    NSLog(@"%@", object);
    
    // 更新界面
    [self updateAppearanceWithObject:object];
    
    [_indicatorView stopAnimating];
}

- (void)asynchronizedPOSTRequest
{
    
    [_indicatorView startAnimating];
    
    NSDictionary *parameters = @{
                                 @"g": @"ApiGGC",
                                 @"m": @"Public",
                                 @"c": @"getConstantList",
                                 @"type": @"relation_type"
                                 };
    
//    NSDictionary *parameters = @{@"P0":@"11111@qq.com",
//                                 @"P1":@"123456",
//                                 @"P2":@"0"};
    // 使用NSURLConnection发起异步请求
    [NSURLConnection connectionWithRequest:[self POSTURLRequestWithParameters:parameters] delegate:self];
    
    
}

- (NSURLRequest *)POSTURLRequestWithParameters:(NSDictionary *)parameters
{
    NSDictionary *dic = @{@"p0":@"11111@qq.com",
                          @"p1":@"123456",
                          @"p2":@"0"};
    NSString *str = @"http://120.27.30.130:80/api/login";
    
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 配置请求方法
    request.HTTPMethod = @"POST";
    // 配置请求超时时间
    request.timeoutInterval = 10.0;
    
    // 请求参数字符串拼接
    // 规则:key1=value1&key2=value2&...
    // 例子:userName=admin&password=123456
    NSMutableString *bodyString = [NSMutableString string];
    for (NSString *key in dic)
    {
        [bodyString appendFormat:@"%@=%@&", key, dic[key]];
    }
    
    // 配置请求参数
    request.HTTPBody = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    return request;
}

#pragma mark - JSON deserialized methods

- (id)JSONObjectWithData:(NSData *)data
{
    
    if ([data length] == 0)
    {
        return nil;
    }
    // JSON data转JSON对象
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    // 判断解析是否成功
    if (error)
    {
        NSLog(@"deserialized json object did failed with error message '%@'.", [error localizedDescription]);
        return nil;
    }
    return object;
}















#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSDictionary *info = _dataSource[indexPath.row];
    cell.textLabel.text = info[@"name"];
    // GET
    if ([_HTTPMethod isEqualToString:@"GET"]) {
        cell.detailTextLabel.text = info[@"addr"];
    }
    // POST
    else
    {
        cell.detailTextLabel.text = info[@"key"];
    }
    return cell;
}



@end
