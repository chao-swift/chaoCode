

//==================================================


//导航控制器的封装 这个主要用于覆盖掉系统提供的导航控制器
//并且能直接承载视图控制器 不是去导航控制器原有的功能

//==================================================

#import "NavigationVC.h"

@interface NavigationVC ()

@end

@implementation NavigationVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)dealloc
{
   // NSLog(@"旧试图控制器释放完毕");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRM(0, 0, NAV_Width,NAV_Height);
}













@end
