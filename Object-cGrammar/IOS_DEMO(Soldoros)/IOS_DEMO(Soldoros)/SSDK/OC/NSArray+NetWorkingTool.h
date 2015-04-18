//
//  NSArray+NetWorkingTool.h
//  UCook
//
//  Created by scihi on 14/11/2.
//  Copyright (c) 2014年 huangrun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (NetWorkingTool)

//将网络请求回的数据转换成为模型对象的数组
+ (NSArray *)setMyValue2:(NSArray*)array1
               className:(NSString *)str;


@end
