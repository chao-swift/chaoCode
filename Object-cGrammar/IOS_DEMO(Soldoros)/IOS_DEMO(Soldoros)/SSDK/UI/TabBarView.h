

//==================================================


//工具栏的封装


//==================================================

#import <UIKit/UIKit.h>

//不同风格的工具栏
typedef enum
{
    UITabBarWithAnimation =1,
    UITabBarWithImage,
    
}UITabBarStyle;



//添加协议
@protocol TabBarViewDelegate <NSObject>

@optional

- (void)tabbarViewDidClicButton:(NSInteger)index;

@end



@interface TabBarView : UIView

@property (nonatomic,strong) UIButton *currentBtn;
@property (nonatomic,assign) int numOfBtn;
@property (nonatomic,strong) UIView *shadeLayer;
@property (nonatomic,assign) UITabBarStyle tabBarStyle;

- (id)initWithFrame:(CGRect)frame getNumOfBtn:(int)num;
-(UIButton *)getTabBarButton:(int)count;
@property (assign,nonatomic) id <TabBarViewDelegate> delegate;















@end