//
//  UIView+AutoLayer.m
//  UCook
//
//  Created by scihi on 14/11/3.
//  Copyright (c) 2014年 huangrun. All rights reserved.
//

#import "UIView+AutoLayer.h"

@implementation UIView (AutoLayer)


//利用控件的位置和大小得出所在屏幕的比例
+(CGRect)getOrgX:(double)x
         getOrgY:(double)y
    getSizeWidth:(double)width
   getSizeHeight:(double)height
      whatiPhone:(int)device
{
    //获取当前模拟器的尺寸
    CGRect currentDevice;
    switch (device)
    {
        case iPhone4S:currentDevice.size.width = 320;
            currentDevice.size.height = 480; break;
            
        case iPhone5S:currentDevice.size.width = 320;
            currentDevice.size.height = 568; break;
            
        case iPhone6:currentDevice.size.width = 750;
            currentDevice.size.height = 1334; break;
            
        case iPhone6plus:currentDevice.size.width = 1080;
            currentDevice.size.height = 1920; break;
            
        case iPadMini:currentDevice.size.width = 768;
            currentDevice.size.height = 1024; break;
            
        case iPad3:currentDevice.size.width = 1536;
            currentDevice.size.height = 2048; break;
            
        default:currentDevice.size.width = 320;
            currentDevice.size.height = 568;break;
    }
    //得出视图在该模拟器的比例
    double _x = x/currentDevice.size.width;
    double _y = y/currentDevice.size.height;
    double _w = width/currentDevice.size.width;
    double _h = height/currentDevice.size.height;
    
    //得出视图在当前模拟器或真机上的尺寸和位置
    double a = SCREEN_Width;
    double b = SCREEN_Height;
    return CGRectMake( _x*a,_y*b,_w*a,_h*b);
}

//返回等比例的宽度
+(double)getWidth:(double)width
    getSuperWidth:(double)supWidth
{
    return width*supWidth;
}

//返回等比例的高度
+(double)getHeight:(double)height
    getSuperHeight:(double)supHeight
{
    return height *supHeight;
    
}

//距离上下左右的适配
+(CGRect)distanceTop:(double)top
      distanceBottom:(double)bottom
        distanceLeft:(double)left
       distanceRight:(double)right
            supeView:(UIView *)supView
{
    double x = OrangeX(supView)+left;
    double y = OrangeY(supView)+top;
    double w = SizeX(supView)-left-right;
    double h = SizeY(supView)-top-bottom;
    
    return CGRM(x , y,w, h);
}












@end
