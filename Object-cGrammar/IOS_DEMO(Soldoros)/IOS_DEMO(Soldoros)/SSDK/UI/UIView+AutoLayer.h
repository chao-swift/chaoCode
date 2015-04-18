//
//  UIView+AutoLayer.h
//  UCook
//
//  Created by scihi on 14/11/3.
//  Copyright (c) 2014年 huangrun. All rights reserved.
//

#import <UIKit/UIKit.h>


//默认竖屏
typedef enum
{
    iPhone4S = 0,   //320*480
    iPhone5S,       //320*568
    iPhone6,        //1334*750
    iPhone6plus,    //1920*1080
    iPadMini,       //768*1024
    iPad3           //1536*2048
    
}theiPhone;

//相对于窗口的自动比例
#define AUTOLayer(_x,_y,_width,_height,iPhone)\
[UIView getOrgX:_x getOrgY:_y getSizeWidth:_width getSizeHeight:_height whatiPhone:iPhone]
//相对于父视图的比例宽度
#define AUTOSuperWidth(_x,_supWidth)\
[UIView getWidth:_x getSuperWidth:_supWidth];
//相对于父视图的比例高度
#define AUTOSuperHeight(_y,_supHeight)\
[UIView getHeight:_y getSuperHeight:_supHeight];
//距离上下左右的适配
#define AUTODistance(_top,_bottom,_left,_right,_supView)\
[UIView distanceTop:_top distanceBottom:_bottom distanceLeft:_left distanceRight:_right supeView:_supView]


@interface UIView (AutoLayerView)

+(CGRect)getOrgX:(double)x
         getOrgY:(double)y
    getSizeWidth:(double)width
   getSizeHeight:(double)height
      whatiPhone:(int)device;

//返回等比例的宽度
+(double)getWidth:(double)width
    getSuperWidth:(double)supWidth;

//返回等比例的高度
+(double)getHeight:(double)height
    getSuperHeight:(double)supHeight;

//距离上下左右的适配
+(CGRect)distanceTop:(double)top
      distanceBottom:(double)bottom
        distanceLeft:(double)left
       distanceRight:(double)right
            supeView:(UIView *)supView;















@end

