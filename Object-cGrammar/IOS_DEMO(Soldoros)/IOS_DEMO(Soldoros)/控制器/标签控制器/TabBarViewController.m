//
//  TabBarViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "TabBarViewController.h"
#import "ViewController1.h"
#import "ViewController2b.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
#import "ViewController6.h"

@interface TabBarViewController ()<UITabBarControllerDelegate,UIAlertViewDelegate>
{
    UITabBarController *tabBarController1;
}
@end

@implementation TabBarViewController

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
    
    ViewController1 *controller1 = [[ViewController1 alloc] initWithTitle:@"书签"];
    ViewController2b *controller2 = [[ViewController2b alloc] initWithTitle:@"联系人"];
    ViewController3 *controller3 = [[ViewController3 alloc] initWithTitle:@"Favorite"];
    ViewController4 *controller4 = [[ViewController4 alloc] initWithTitle:@"Download"];
    ViewController5 *controller5 = [[ViewController5 alloc] initWithTitle:@"Featured"];
    ViewController6 *controller6 = [[ViewController6 alloc] initWithTitle:@"Login"];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:controller1];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:controller2];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:controller3];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:controller4];
    
    //    无需加上导航
    //    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:controller5];
    //    UINavigationController *nav6 = [[UINavigationController alloc] initWithRootViewController:controller6];
    
    //初始化标签控制器
    tabBarController1 = [[UITabBarController alloc] init];
    tabBarController1.viewControllers = @[nav1,nav2,nav3,nav4,controller5,controller6];
    //配置是否开启页面显示编辑功能
    tabBarController1.customizableViewControllers = nil;
    //配置被管理控制器导航栏显示
    for (UIViewController *vc in tabBarController1.viewControllers) {
        //判断是否是导航控制器
        if ([vc isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)vc;
            [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_ios7"] forBarMetrics:UIBarMetricsDefault];
            nav.navigationBar.translucent = YES;
        }
    }
    //配置更多的导航控制器
    [tabBarController1.moreNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_ios7"] forBarMetrics:UIBarMetricsDefault];
    tabBarController1.moreNavigationController.navigationBar.translucent = YES;
    
    //配置标签栏的显示
    tabBarController1.tabBar.backgroundImage = [UIImage imageNamed:@"nav_bg"];
    tabBarController1.tabBar.translucent = YES;
    
    //配置协议
    tabBarController1.delegate = self;
    
    
    //设置tabBarItem文字颜色
    
    //普通状态下的颜色
//    [UITabBarItem.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor blackColor]} forState:UIControlStateNormal];
//    
//    //选中状态下的颜色
//    [UITabBarItem.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName :COLOR(70, 130, 255, 1)} forState:UIControlStateSelected];
    
    
    [self addChildViewController:tabBarController1];
    [self.view addSubview:tabBarController1.view];
}

#pragma mark - UITabBarControllerDelegate

//配置是否可以切换到指定控制页面
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    BOOL shouldSelectViewController = YES;
    
    //计算当前选中的页面索引以及即将跳转的页面的索引
    NSInteger sourceIndex = tabBarController.selectedIndex;
    NSInteger destinationIndex = [[tabBarController viewControllers] indexOfObject:viewController];;
    
    //页面传值(页面1与2之间传值)
    if(sourceIndex == 0 &&destinationIndex ==1) {
        //获取ViewConroller1
        //获取到ViewController2
        //从vc1中获取需要传递的值
        //像vc2中传值
        UINavigationController *nav1 = tabBarController.viewControllers[0];
        ViewController1 *vc1 = nav1.viewControllers[0];
        UINavigationController *nav2 = tabBarController.viewControllers[1];
        ViewController2b *vc2 = nav2.viewControllers[0];
        vc2.showContent = vc1.textFiled.text;
        
    }
    // 页面跳转(页面3)
    else if(destinationIndex == 2 && sourceIndex != destinationIndex) {
        shouldSelectViewController = NO;
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"检测到尚未登录,是否现在登录" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"跳转", nil];
        [alertView show];
    }
    //badgeValu自加(页面4)实现
    else if(destinationIndex == 3 && sourceIndex ==destinationIndex) {
        UITabBarItem *item = tabBarController.tabBar.items[3];
        NSInteger count = [item.badgeValue integerValue]  ;
        if(++count <= 10) {
            item.badgeValue = [NSString stringWithFormat:@"%ld",count];
        }else {
            item.badgeValue = nil;
        }
    }
    return shouldSelectViewController;
}

//控制器页面切换完成时候调用
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == [alertView firstOtherButtonIndex]) {
        //页面跳转
        [tabBarController1 setSelectedIndex:5];
    }
}

@end
