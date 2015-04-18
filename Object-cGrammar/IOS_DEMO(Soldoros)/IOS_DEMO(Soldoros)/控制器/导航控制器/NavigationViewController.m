//
//  NavigationViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()<UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation NavigationViewController
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

- (void)viewWillAppear:(BOOL)animated
{
    //配置工具栏是否显示，默认是隐藏的
    self.navigationController.toolbarHidden = NO;
    self.navigationController.toolbar.backgroundColor = [UIColor brownColor];
    //    navigationController.navigationBarHidden = NO;
    /*配置导航栏 ,
     导航栏高度:64
     工具栏高度:44
     状态栏高度:20;
     */
    //配置背景色
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"oo1.jpg"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:@"oo2.jpg"] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    self.navigationController.toolbar.barTintColor = [UIColor redColor];
    //一旦导航栏或工具栏配置了背景图片，则默认变成不透明的，内容控制器布局从导航栏底部开始,把透明度设置为YES；
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.toolbar.translucent = YES;
    //配置导航栏和工具栏主色条
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    NSShadow *shadow = [[NSShadow alloc] init];
    //配置偏移颜色
    shadow.shadowColor = [UIColor blackColor];
    //配置阴影偏移量
    shadow.shadowOffset = CGSizeMake(3, 3);
    NSDictionary *titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor greenColor],NSShadowAttributeName:shadow};
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
    self.navigationController.toolbar.tintColor = [UIColor whiteColor];
    
    //自定按钮
    UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.bounds = CGRectMake(0, 0, 35, 35);
    [returnButton setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnLastController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:returnButton];
    self.navigationItem.leftBarButtonItem = item;
}

-(void)initializeAppearance
{
    // 配置背景随机色
    self.view.backgroundColor = COLOR_a;
    
    /* viewContrllers属性 */
    NSInteger count = [self.navigationController.viewControllers count];
    self.title = [NSStringFromClass([self class]) stringByAppendingFormat:@"%ld", count-1];
    
    /* 配置导航栏标题文本 */
    // 1.直接设置控制器标题
    // self.title = @"Nav Demo";
    // 2.直接设置导航栏标题
    // UINavigationItem：一般控制器具有的属性，通过该属性可以定制每一单独控制器导航栏的展示风格，每一个控制器页面的导航栏都是不同的。
    // UINavigationItem可以配置标题文本、标题视图、导航栏按钮
    self.navigationItem.title = @"Nav Demo";
    
    
    //通过self.view.bounds来适配屏幕尺寸
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = self.title;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:25];
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
    
    
    /* 配置toolbar工具栏 */
    // **对于导航栏和工具栏禁止进行一般视图控件的添加(addSubview:)**
    
    // backToRoot返回根页面
    UIBarButtonItem *backToRootItem = [[UIBarButtonItem alloc] initWithTitle:@"BackToRoot" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonPressed:)];
    backToRootItem.tintColor = [UIColor redColor];
    // tag只能实现标记和区别功能，不能通过父视图访问该对象
    backToRootItem.tag = 10;
    
    // next推送新页面
    UIBarButtonItem *nextItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonPressed:)];
    nextItem.tintColor = [UIColor redColor];
    // tag只能实现标记和区别功能，不能通过父视图访问该对象
    nextItem.tag = 11;
    
    // 空间延展控件
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
    
    // 在工具栏上添加按钮
    self.toolbarItems = @[backToRootItem, flexibleItem, nextItem];
    
    
    /* 配置navigationBar按钮 */
    // 刷新
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(barButtonPressed:)];
    refreshItem.tag = 12;
    
    // 分享
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(barButtonPressed:)];
    shareItem.tag = 13;
    
    // 显示在导航栏右侧
    self.navigationItem.rightBarButtonItems = @[refreshItem, shareItem];
    
    // 避免左侧按钮及返回按钮显示冲突问题
    // self.navigationItem.leftItemsSupplementBackButton = YES;
}


- (void)barButtonPressed:(UIBarButtonItem *)sender {
    
    NSInteger index = sender.tag - 10;
    switch (index)
    {
            // 回返根页面
        case 0: [self backToRoot]; break;
            // 下一页
        case 1: [self next]; break;
            // 刷新
        case 2: [self refresh]; break;
            // 分享
        case 3: [self share]; break;
            
        default: break;
    }
}

- (void)backToRoot
{
    //返回到第一个视图控制器
    UIViewController *vc = self.navigationController.viewControllers[1];
    [self.navigationController popToViewController:vc animated:YES];
}

- (void)next
{
    
    // 初始化视图控制器
    NavigationViewController *vc = [[NavigationViewController alloc]init];
    // 推送并显示视图控制器
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)refresh
{
    
    // 警告框：UIAlertView
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络异常，请稍后再试!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"重试", @"稍后再试", @"晚上再试", @"不试", nil];
    // 显示
    [alertView show];
}

- (void)share {
    
    // 操作表单：UIActionSheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:@"腾讯微博", @"新浪微博", nil];
    // 显示
    [actionSheet showInView:self.view];
}

#pragma mark - UIAlertViewDelegate methods

// 在警告框按钮点击时调用
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    NSLog(@"alert view button index = %ld", buttonIndex);
}

#pragma mark - UIActionSheetDelegate methods

// 操作表单按钮点击时调用
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"action sheet button index = %ld", buttonIndex);
}



- (void)returnLastController
{
    [self.navigationController popViewControllerAnimated:YES];
}







@end
