//
//  MVCViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "MVCViewController.h"
#import "MVCModel.h"
#import "MVCTableViewCell.h"

#import "AFNetworking.h"
// POST请求地址
#define POST_URL_STRING @"http://125.70.10.34:8119/ggc/api.php"

@interface MVCViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *MVCtabView;
@property(nonatomic,strong) NSArray *MVCArray;
@end

@implementation MVCViewController

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
    _MVCtabView = [[UITableView alloc]init];
    _MVCtabView.frame = AUTOLayer(0,0,320,460,1);
    _MVCtabView.delegate = self;
    _MVCtabView.dataSource = self;
    [self.view addSubview:_MVCtabView];
    
    [self netWorking];
    
}

-(void)netWorking
{
    NSDictionary *parameters = @{
                                 @"g": @"ApiGGC",
                                 @"m": @"Public",
                                 @"c": @"getConstantList",
                                 @"type": @"relation_type"
                                 };
    

    
    [CRequestManager requestWith:parameters method:POST_URL_STRING
                   requestSucess:^(id object)
     {
         NSLog(@"%@",object);
         
         _MVCArray = [NSArray setMyValue2:object[@"content"][@"relation_type_list"] className:@"MVCModel"];
         
         [_MVCtabView reloadData];
    }
                  requestFailure:^
    {
        NSLog(@"网络请求失败");
    }];
}

#pragma UITableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _MVCArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellStr = @"MvcCELL";
    MVCTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
     
     if(!cell)
    {
         cell = [[MVCTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellStr];
     }
    
    MVCModel *model = _MVCArray[indexPath.row];
    [cell setMavModel:model];
     return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}





















@end
