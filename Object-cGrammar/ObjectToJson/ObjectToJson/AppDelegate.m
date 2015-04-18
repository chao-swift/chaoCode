//
//  AppDelegate.m
//  ObjectToJson
//
//  Created by Tang on 15/4/13.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString* num = @"495064.230000" ;
    
    NSString* num1 = @"495064" ;
    NSString* fomat = [self formatterd:num1] ;
    NSString* fomat1 = [self formatters:num] ;
    
    NSLog(@"fonmat = %@",fomat1) ;
    
    
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:0] ;
    NSDictionary* annxDic = [NSDictionary dictionaryWithObjectsAndKeys:@"111",@"pawnname",@"lujinglujinglijinglujing",@"imagePath", nil] ;
    [array addObject:annxDic] ;
    
    //数组转化成json
    NSString* strJson = [self arrayToJson:array] ;
    NSLog(@"转换后的strJson = %@",strJson) ;
    
    NSArray* ary = [self jsonToArray:strJson] ;
    NSLog(@"转化后的数组 = %@",ary) ;
    
    return YES;
}
//格式化字符串: double__stringFromIndex
-(NSString *)formatterd:(NSString *)times{
    
    double intString = [times doubleValue];
    NSLog(@"intString = %f",intString) ;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init] ;
    formatter.numberStyle = kCFNumberFormatterCurrencyStyle;
    NSString *string = [formatter stringFromNumber:[NSNumber numberWithDouble:intString]];
    NSLog(@"string = %@",string ) ;
    return [string substringFromIndex:1];
}
-(NSString *)formatters:(NSString *)times{
    float floatString = [times floatValue];
    NSNumberFormatter *formatter= [[NSNumberFormatter alloc] init] ;
    formatter.numberStyle = kCFNumberFormatterCurrencyStyle;
    NSString *string= [formatter stringFromNumber:[NSNumber numberWithFloat:floatString]];
    
    NSLog(@"---> string:%@",string);
    return string;
}
/**
 NSJSONWritingPrettyPrinted
 Specifies that the JSON data should be generated with whitespace designed to make the output more readable. If this option is not set, the most compact possible JSON representation is generated.
 if NSJSONWritingPrettyPrinted = 0 生成不带空格的json数据

 */
-(NSString*)arrayToJson:(NSMutableArray*)array
{
    if ([NSJSONSerialization isValidJSONObject:array])
    {
        NSError* error = error ;
#if 0
        NSData *dataArray = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
#endif
#if 1
        NSData *dataArray = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
#endif
        NSString *strJson = [[NSString alloc] initWithData:dataArray encoding:NSUTF8StringEncoding];
        NSLog(@"error = %@",error) ;
        return strJson ;
    }
    return @"" ;
}
-(NSArray*)jsonToArray:(NSString*)strJson
{
    NSArray* array = nil ;
    if (strJson && strJson.length)
    {
        NSData* strData = [strJson dataUsingEncoding:NSUTF8StringEncoding] ;
        array = [NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingMutableContainers error:nil] ;
        return array ;
    }
    return nil ;
}
@end
