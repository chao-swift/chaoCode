//
//  NSArray+RemoveLow50.h
//  多线程,block
//
//  Created by rimi on 14-8-15.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (RemoveWithBlock)

//返回数组中大于50的元素组成的数组
- (NSArray *)removeUsingMyBlock:(BOOL (^)(id aa))block;

//给数组排序
-(NSArray *)sortTheArray:(NSArray* (^)(NSArray*))block;



@end
