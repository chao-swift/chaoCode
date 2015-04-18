//
//  UIPickerViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/11/27.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "UIPickerViewController.h"


@interface UIPickerViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *cellTitileArray;
    UITableView *theTableView;
    
    
    //承载时间选取器的视图
    UIView *pikerView;
    //是否显示时间选取器
    BOOL isShowPiker;
    int indexPathRow;
    
    //存储时间
    NSMutableDictionary *dateDic;
}

@property (nonatomic,strong)UIDatePicker *myDatePicker;

@end

@implementation UIPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    isShowPiker = NO;
    _searchDic = [NSMutableDictionary new];
    dateDic = [NSMutableDictionary new];
    cellTitileArray = @[@"开始时间",@"结束时间"];
    theTableView = [[UITableView alloc]initWithFrame:
                    AUTOLayer(0, 0, 320, 170, 1) style:UITableViewStylePlain];
    //    theTableView.accessibilityActivate = UITableViewCellStyleValue1;
    theTableView.dataSource = self;
    theTableView.delegate = self;
    [self.view addSubview:theTableView];
    
    UIButton *finishBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 40, 60)];
    
    [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    
    [finishBtn addTarget:self action:@selector(clickFinishBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:finishBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}

//完成
- (void)clickFinishBtn: (UIButton *)button
{
    //完成的时候对日期做判断  然后再委托代理
    if([[dateDic valueForKey:@"sTime"] intValue]>
       [[dateDic valueForKey:@"lTime"]intValue])
    {
        return;
    }
    if(_delegate && [_delegate respondsToSelector:@selector(searchOver:)])
    {
        [_delegate searchOver:_searchDic];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellTitileArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StoreGoodsSearchConditionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    cell.tag = 100 + indexPath.row;
    cell.textLabel.text = [cellTitileArray objectAtIndex:indexPath.row];
    
    if (cell.tag == 100 &&[_searchDic objectForKey:@"startTimer"] != nil)
    {
        cell.detailTextLabel.text = [_searchDic objectForKey:@"startTimer"];
    }
    
    else if (cell.tag == 101 && [_searchDic objectForKey:@"lastTimer"] != nil)
    {
        cell.detailTextLabel.text = [_searchDic objectForKey:@"lastTimer"];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        if(!isShowPiker)
        {
            [self showPriceAlertView:0];
        }
    }
    else if (indexPath.row == 1)
    {
        if(!isShowPiker)
        {
            [self showPriceAlertView:1];
        }
    }
    
    
}

//显示时间选取器 降选取器中德时间添加到字典中
//并在代理方法中做形参传入
-(void)showPriceAlertView:(int)index
{
    
    isShowPiker = YES;
    indexPathRow = index;
    
    //创建视图
    pikerView = [[UIView alloc]init];
    pikerView.frame = AUTOLayer(0, 568, 320, 260, 1);
    pikerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:pikerView];
    
    //创建时间选取器
    _myDatePicker = [[UIDatePicker alloc] initWithFrame:
                     AUTOLayer(0, 0, 320, 210, 1)];
    
    //选中日期模式
    _myDatePicker.datePickerMode = UIDatePickerModeDate;
    _myDatePicker.backgroundColor = COLOR(230, 230, 230, 1);
    NSDate *date = [[NSDate alloc]init];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc] init];
    //日期模式的格式
    [dateformat setDateFormat:@"yyyy-MM-dd"];
    NSString * newDateOne = [dateformat stringFromDate:date];
    _myDatePicker.date = [dateformat dateFromString:newDateOne];
    [_myDatePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    [pikerView addSubview:_myDatePicker];
    
    //添加确定按钮
    UIButton *pickerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    pickerBtn.frame = AUTOLayer(0, 210, 320, 50, 1);
    pickerBtn.backgroundColor = COLOR(92, 158, 202, 1);
    [pickerBtn setTitle:@"确定" forState:UIControlStateNormal];
    [pickerBtn setTintColor:[UIColor whiteColor]];
    [pickerBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [pikerView addSubview:pickerBtn];
    
    [self upAnimation:pikerView];
    
}

//确定之后 获取选取器上的时间 并更新cell
-(void)btnPressed:(UIButton *)sender
{
    [self downAnimation:pikerView];
}


//显示选取器
-(void)upAnimation:(UIView *)VIEW
{
    [UIView animateWithDuration:0.3 animations:^
     {
         VIEW.frame = AUTOLayer(0, self.view.frame.size.height-260, 320, 260, 1);
     } completion:^(BOOL finished)
     {
         
     }];
}
//隐藏选取器  并提取时间
-(void)downAnimation:(UIView *)VIEW
{
    [UIView animateWithDuration:0.3 animations:^
     {
         VIEW.frame = AUTOLayer(0, 568, 320, 260, 1);
     } completion:^(BOOL finished)
     {
         isShowPiker = NO;
         
         //获取滚轮的时间
         NSDate *time = [_myDatePicker date];
         NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
         [dateFormatter setDateFormat:@"yyyy-MM-dd"];
         NSString *destDateString = [dateFormatter stringFromDate:time];
         
         NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
         [dateFormatter1 setDateFormat:@"yyyyMMdd"];
         NSString *destDateString1 = [dateFormatter1 stringFromDate:time];
        // NSLog(@"%d",[destDateString1 intValue]);
         
         //时间滚轮点击后 同样更新cell
         
         if(indexPathRow == 0)
         {
             [_searchDic setObject:destDateString forKey:@"startTimer"];
             [dateDic setObject:destDateString1 forKey:@"sTime"];
         }
         else
         {
             [_searchDic setObject:destDateString forKey:@"lastTimer"];
             [dateDic setObject:destDateString1 forKey:@"lTime"];
         }
         [theTableView reloadData];
         [pikerView removeFromSuperview];
         pikerView=nil;
         
     }];
}


//时间滚轮的反应方法
-(void)dateChanged:(id)date
{
    //获取滚轮的时间
    NSDate *time = [_myDatePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:time];
    
    //时间滚轮点击后 同样更新cell
    
    if(indexPathRow == 0)
    {
        [_searchDic setObject:destDateString forKey:@"startTimer"];
    }
    else
    {
        [_searchDic setObject:destDateString forKey:@"lastTimer"];
    }
    [theTableView reloadData];
}



@end

