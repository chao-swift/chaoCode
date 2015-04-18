//
//  NSObject+ObjectToJson.h
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/11/18.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DicToJson(_dic) [NSObject dictionaryToJson:_dic]
#define ArrToJson(_arr) [NSObject arrayToJson:_arr]

@interface NSObject (ObjectToJson)

//字典转json
+(NSString *)dictionaryToJson:(NSDictionary *)dictionary;

// 数组转json
+(NSString *)arrayToJson:(NSArray *)array;

@end
