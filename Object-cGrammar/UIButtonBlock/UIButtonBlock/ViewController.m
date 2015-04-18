//
//  ViewController.m
//  UIButtonBlock
//
//  Created by Tang on 15/4/15.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"
#import "CustomAlertView.h"

#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"主视图" ;
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    
    CustomButton* button = [CustomButton buttonWithType:UIButtonTypeCustom] ;
    button.frame = CGRectMake(100, 100, 100, 50) ;
    button.backgroundColor = [UIColor orangeColor] ;
    [button setTitle:@"点我啊" forState:UIControlStateNormal] ;
    [button setButtonBlock:^(CustomButton* btn){
        NSLog(@"你点击了按钮") ;
    }] ;
    [self.view addSubview:button] ;
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom] ;
    btn.frame = CGRectMake(200, 200, 100, 80) ;
    btn.backgroundColor = [UIColor orangeColor] ;
    [btn setTitle:@"AlertView" forState:UIControlStateNormal] ;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:btn] ;
    
    UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeCustom] ;
    btn1.frame = CGRectMake(100, 300, 200, 80) ;
    btn1.backgroundColor = [UIColor orangeColor] ;
    [btn1 setTitle:@"objc/runtime" forState:UIControlStateNormal] ;
    [btn1 addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:btn1] ;
    
}
//唯一静态变量key

static const char associatedkey;

static const char associatedButtonkey;
-(void)btnClick
{
    CustomAlertView* al = [[CustomAlertView alloc] initWithTitle:@"提示" message:@"自定义AlertView" cancelButtonTitle:@"取消" otherButtonTitles:@"确定" block:^(NSInteger buttonIndex) {
        if (buttonIndex == 0)
        {
            NSLog(@"点击了取消") ;
        }
        else if (buttonIndex == 1)
        {
            NSLog(@"点击了确定") ;
        }
    }] ;
    [al show] ;
    
}
-(void)btnClick1:(UIButton*)btn
{
    NSString *message =@"我知道你是按钮了";
    
    
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"message:@"我要传值·" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
    alert.delegate =self;
    
    [alert show];
    
    //#import <objc/runtime.h>头文件
    
    //objc_setAssociatedObject需要四个参数：源对象，关键字，关联的对象和一个关联策略。
    
    
    
    //1 源对象alert
    
    //2 关键字 唯一静态变量key associatedkey
    
    //3 关联的对象 sender
    
    //4 关键策略  OBJC_ASSOCIATION_RETAIN_NONATOMIC
    
    
    
    
    
    objc_setAssociatedObject(alert, &associatedkey, message,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
    
    objc_setAssociatedObject(alert, &associatedButtonkey, btn,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    
    
    
    
    
    //通过 objc_getAssociatedObject获取关联对象
    
    NSString  *messageString =objc_getAssociatedObject(alertView, &associatedkey);
    
    
    
    
    
    UIButton *sender = objc_getAssociatedObject(alertView, &associatedButtonkey);
    
    NSLog(@"message = %@",messageString) ;
    NSLog(@"sender = %@",sender.titleLabel.text) ;
    
    //使用函数objc_removeAssociatedObjects可以断开所有关联。通常情况下不建议使用这个函数，因为他会断开所有关联。只有在需要把对象恢复到“原始状态”的时候才会使用这个函数。
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
