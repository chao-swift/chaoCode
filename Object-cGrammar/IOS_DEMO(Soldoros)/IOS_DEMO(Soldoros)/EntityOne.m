//
//  EntityOne.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-30.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "EntityOne.h"


@implementation EntityOne

@dynamic username;
@dynamic pwd;

+ (NSString *)entityName
{
    return @"EntityOne";
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"username:%@  pwd:%@",self.username,self.pwd];
}

@end
