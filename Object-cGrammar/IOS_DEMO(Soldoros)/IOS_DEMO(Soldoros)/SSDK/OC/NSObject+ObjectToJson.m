//
//  NSObject+ObjectToJson.m
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/11/18.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "NSObject+ObjectToJson.h"

@implementation NSObject (ObjectToJson)


#pragma mark - 字典转json
+(NSString *)dictionaryToJson:(NSDictionary *)dictionary
{
    
    NSError *parseError = nil;
    
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

}

#pragma mark 数组转json
+(NSString *)arrayToJson:(NSArray *)array
{
    NSError *parseError = nil;
    
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
