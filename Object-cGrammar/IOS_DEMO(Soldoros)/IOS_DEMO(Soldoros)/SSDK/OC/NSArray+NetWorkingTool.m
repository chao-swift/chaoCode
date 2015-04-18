//
//  NSArray+NetWorkingTool.m
//  UCook
//
//  Created by scihi on 14/11/2.
//  Copyright (c) 2014年 huangrun. All rights reserved.
//

#import "NSArray+NetWorkingTool.h"

@implementation NSArray (NetWorkingTool)

+ (NSArray *)setMyValue2:(NSArray*)array1 className:(NSString *)str
{
    Class MyClass = NSClassFromString(str);
    
    NSMutableArray *newArray = [NSMutableArray new];
    for (int i=0; i<array1.count; i++)
    {
        //降数据中每个元素用字典类型取出来
        NSDictionary *dics = array1[i];
        //新建一个模型类对象
        NSObject *obj = [MyClass new];
        //遍历字典中的key
        for(NSString *str in [dics allKeys])
        {
            //用模型类对象接收字典中的元素
            [obj setValue:dics[str] forKey:str];
        }
        //将模型对象添加到数组中并返回
        [newArray addObject:obj];
    }
    
    return newArray;
}

@end
