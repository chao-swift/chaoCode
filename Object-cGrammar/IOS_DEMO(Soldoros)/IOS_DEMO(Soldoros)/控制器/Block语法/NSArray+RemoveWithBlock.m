//
//  NSArray+RemoveLow50.m
//  多线程,block
//
//  Created by rimi on 14-8-15.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "NSArray+RemoveWithBlock.h"

@implementation NSArray (RemoveWithBlock)



- (NSArray *)removeUsingMyBlock:(BOOL (^)(id aa))block
{
    //self是存储了100个元素的数组
    
    if(!block) {return  self;}
    
    NSMutableArray *filteredArray = [NSMutableArray array];
    
    for( id item in self)
    {
        if(block(item))
        {
            [filteredArray addObject:item];
        }
    }
    return filteredArray;
    
}


//给数组排序
-(NSArray *)sortTheArray:(NSArray* (^)(NSArray*))block
{
    
    if(!block)
    {
        return self;
    }
    
    return block(self);
}














@end
