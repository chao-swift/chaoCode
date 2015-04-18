

//==================================================


//工具栏的封装


//==================================================

#import "TabBarView.h"

@interface TabBarView ()

@end


@implementation TabBarView

//工具栏视图的初始化
- (id)initWithFrame:(CGRect)frame
        getNumOfBtn:(int)num
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initData];
        _numOfBtn = num;
        [self initTabBar];
    }
    return self;
}

//初始化数据
-(void)initData
{
    //默认未选择风格
    _tabBarStyle = -1;
}

//定义工具栏按钮
-(void)initTabBar
{
    [self setBackgroundColor:COLOR(89, 118, 84, 1)];

    for (int i = 0; i < _numOfBtn; i++)
    {
        NSString *titleStr = [NSString stringWithFormat:@"%d",1+i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:AUTOLayer(0+i*_Width/_numOfBtn,0,_Width/_numOfBtn, _Height, 1)];
        [button setTag:10 + i];
        [button setTitle:titleStr forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btnClick:)forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        i==0?_currentBtn = button:NULL;
    }
    _currentBtn.selected = YES;
}

//工具栏按钮响应及委托代理
- (void)btnClick:(UIButton *)sender
{
    //同一个按钮不能两次点击
    if (_currentBtn == sender)
    {
        return;
    }
    _currentBtn = sender;
    
    //判断是何种风格
    if(_tabBarStyle == UITabBarWithAnimation)
    {
        [UIView animateWithDuration:0.3
                         animations:^
        {
                             _shadeLayer.frame = _currentBtn.frame;
        } completion:nil];
    }
    if(_tabBarStyle == UITabBarWithImage)
    {
        
    }
    //设置按钮的委托代理
    if (_delegate && [_delegate respondsToSelector:@selector(tabbarViewDidClicButton:)])
    {
        [_delegate tabbarViewDidClicButton:sender.tag - 10];
    }
}

//获取到工具栏不同的按钮  并设置
-(UIButton *)getTabBarButton:(int)count
{
    UIButton *btn = (UIButton *)[self viewWithTag:count+9];
    return btn;
}

//定制的不同风格的工具栏
-(void)setTabBarStyle:(UITabBarStyle)tabBarStyle
{
    _tabBarStyle = tabBarStyle;
    switch (tabBarStyle)
    {
        case UITabBarWithAnimation:[self tabBarWithAnimationStyle];break;
        case UITabBarWithImage:[self tabBarWithImageStyle];break;
        default: break;
    }
}

//动画风格
-(void)tabBarWithAnimationStyle
{
    _shadeLayer = [[UIView alloc]init];
    _shadeLayer.frame = AUTOLayer(0, 0, _Width/_numOfBtn, _Height, 1);
    _shadeLayer.backgroundColor = COLOR(50, 80, 40, 1);
    [self addSubview:_shadeLayer];
    
    for(int i=0;i<_numOfBtn;++i)
    {
        UIButton *btn = (UIButton *)[self viewWithTag:i+10];
        [self bringSubviewToFront:btn];
    }
}
//图片风格
-(void)tabBarWithImageStyle
{
    
}

















@end
