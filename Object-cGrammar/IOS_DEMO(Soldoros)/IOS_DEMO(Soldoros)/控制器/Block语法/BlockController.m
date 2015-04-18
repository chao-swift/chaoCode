//
//  BlockController.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-29.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "BlockController.h"
#import "NSArray+RemoveWithBlock.h"
#import "UIAlertView+Show.h"
#import "UIButton+Click.h"


@implementation BlockController




- (void)viewDidLoad
{
    [super viewDidLoad];
    self.btnNames = @[@"例1",@"例2"];
    
    [self initUserInterFace];
}


-(void)initUserInterFace
{
    //下面的按钮事件是封装好了的代码块
    //事件中的警告框按钮事件也是代码块
    UIButton * btnAlertView = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnAlertView setTitle:@"alert代码块封装" forState:UIControlStateNormal];
    [btnAlertView setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btnAlertView setBackgroundColor:[UIColor clearColor]];
    [btnAlertView.layer setCornerRadius:5];
    [btnAlertView addTarget11111:self action:^
     {
         
         //下面整体为一个代码块 成为了按钮点击事件
         
         [UIAlertView showMsg:@"网络连接中断,是否重新连接" btn1:@"确定" btn2:@"取消" btnClic:^(NSInteger btnIndex)
          {
              
              //下面的代码块成为了警告狂点击事件
              if (btnIndex == 0)
              {
                  NSLog(@"点击了确定");
              }
              else
              {
                  NSLog(@"点击了取消");
              }
              
          }];
         
         
     }
                forControlEvents:UIControlEventTouchUpInside];
    [btnAlertView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:btnAlertView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"H:|-20-[btnAlertView]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btnAlertView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"V:|-20-[btnAlertView(<=50)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btnAlertView)]];

}

//两个数字的计算 封装成代码块
- (NSInteger)cacluteNumber:(NSInteger)number withAnotherNumber:(NSInteger)anotherNumber useringBlock:(NSInteger (^)(NSInteger a, NSInteger b))block
{
    if(!block){return 0;}
    return block(number,anotherNumber);
}


- (void)buttonPressed:(UIButton *)sender
{
    [super buttonPressed:sender];
    switch (sender.tag - 11)
    {
        case 0:
        {
            [self testOne];
            break;
        }
        case 1:
        {
            [self sortArray];
            break;
        }
            
        default:
            break;
    }
}

//返回两个数字的和
- (void)testOne
{
    NSInteger result = [self cacluteNumber:3 withAnotherNumber:4 useringBlock:^NSInteger(NSInteger a, NSInteger b)
    {
        
        return a + b;
    }];
    NSLog(@"%ld",result);
}

//返回两个数字的乘积
-(void)test
{
    NSInteger res = [self cacluteNumber:10 withAnotherNumber:20 useringBlock:^NSInteger(NSInteger a, NSInteger b)
    {
        return a*b;
    }];
    NSLog(@"%ld",res);
}



//遍历数组 返回数组中大雨50的数字
- (void)testTwo
{
    //获取随机数 的数组
    NSMutableArray *strings = [NSMutableArray array];
    for (int i = 0;  i < 100; i++)
    {
        NSString *string =[NSString stringWithFormat:@"%d",
                           arc4random() % 100 + 1];
        [strings addObject:string];
    }

    
    //返回大于50的数字的数组
    NSArray *resultArray = [strings removeUsingMyBlock:^BOOL(id item)
    {
        return [item integerValue] > 50;
    }];
    
    //输出数组
    for (int i = 0 ; i < resultArray.count; i ++)
    {
        NSLog(@"%ld",[resultArray[i] integerValue]);
    }
}


//给数组排序
-(void)sortArray
{
    NSMutableArray *idArr = [NSMutableArray new];
    for(int i=0;i<20;++i)
    {
        [idArr addObject:[NSNumber numberWithInt:i]];
    }

    NSArray *RES = [NSArray arrayWithArray:idArr];
    
    NSArray *RESULT = [RES sortTheArray:^NSArray *(NSArray *A)
                       {
                           NSMutableArray *Bree = [NSMutableArray new];
                           Bree = [NSMutableArray arrayWithArray:A];
                           
                           for(int i=0;i<Bree.count;++i)
                           {
                               for(int j=i;j<A.count;++j)
                               {
                                   if([Bree[i]intValue]<[Bree[j]intValue])
                                   {
                                       int item = [Bree[i]intValue];
                                       Bree[i] = Bree[j];
                                       Bree[j] = [NSNumber numberWithInt:item];
                                       
                                   }
                               }
                           }
                           NSArray *c = [NSArray arrayWithArray:Bree];
                           return  c;
                       }];
    
    
    //输出数组
    for (int i = 0 ; i < RESULT.count; i ++)
    {
        NSLog(@"%d",[RESULT[i] intValue]);
    }
}








@end
