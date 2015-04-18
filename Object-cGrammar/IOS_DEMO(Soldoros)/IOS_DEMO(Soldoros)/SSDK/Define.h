
//==================================================


//公共宏定义


//==================================================

#ifndef IOS_DEMO_Soldoros__Define_h
#define IOS_DEMO_Soldoros__Define_h

//更控制器的主题
#define TITLE @"TEST"
//网络请求公共地址
#define URL_RIMI @"http://192.168.7.56:8090/tpl"


//*************************************************
//*************************************************
//*************************************************
//关于尺寸和位置的计算宏定义

//当前屏幕的尺寸
#define SCREENBounds [UIScreen mainScreen ].bounds;
//当前窗口的高度 宽度
#define SCREEN_Height [[UIScreen mainScreen] bounds].size.height
#define SCREEN_Width  [[UIScreen mainScreen] bounds].size.width
//当前导航栏高度 宽度
#define NAV_Height self.navigationController.navigationBar.bounds.size.height
#define NAV_Width  self.navigationController.navigationBar.bounds.size.width
//当前工具栏的高度 宽度
#define TAB_Height self.navigationController.toolbar.bounds.size.height
#define TAB_Width  self.navigationController.toolbar.bounds.size.width
//主视图的高度 宽度
#define MAINVIEW_Height SCREEN_Height-NAV_Height-TAB_Height
#define MAINVIEW_Width  [[UIScreen mainScreen] bounds].size.width
//自身的高度 宽度
#define _Height  self.frame.size.height
#define _Width  self.frame.size.width
//自身的位置
#define _PointX  self.frame.origin.x
#define _PointY  self.frame.origin.y
//设置四维
#define CGRM(_X,_Y,_W,_H) CGRectMake(_X, _Y, _W, _H)
//设置位置
#define CGPT(_X,_Y) CGPointMake(_X, _Y)
//获取目标视图的位置 尺寸
#define SizeX(_View) _View.frame.size.width
#define SizeY(_View) _View.frame.size.height
#define OrangeX(_View) _View.frame.origin.x
#define OrangeY(_View) _View.frame.origin.y

//设置字体
#define FONT(_size)  [UIFont systemFontOfSize:_size]

//*************************************************
//*************************************************
//*************************************************
//颜色宏定义

//随机色
#define COLOR_a [UIColor colorWithRed:arc4random() % 250 / 255.0f green:arc4random() % 250 / 255.0f blue:arc4random() % 250 / 255.0f alpha:1]
//自定义颜色
#define COLOR(_R,_G,_B,_A) [UIColor colorWithRed:_R / 255.0f green: _G / 255.0f blue:_B / 255.0f alpha:_A]
//常用的颜色定义

#define Red     [[UIColor redColor]CGColor];
#define Orange  [[UIColor orangeColor]CGColor];
#define Yellow  [[UIColor yellowColor]CGColor];
#define Green   [[UIColor greenColor]CGColor];
#define Blue    [[UIColor blueColor]CGColor];
#define Brown   [[UIColor brownColor]CGColor];
#define Gray    [[UIColor grayColor]CGColor];
#define Magent  [[UIColor magentaColor]CGColor];
#define Purple  [[UIColor purpleColor]CGColor];
#define Clear   [[UIColor clearColor]CGColor];
#define Black   [[UIColor blackColor]CGColor];
#define White   [[UIColor whiteColor]CGColor];

//*************************************************
//*************************************************
//*************************************************

//设置大图片
#define IMAGE(_NAME) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:_NAME]]

#define NAVIGATION (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController]

//*************************************************
//*************************************************
//*************************************************
//关于对象封装










#endif
