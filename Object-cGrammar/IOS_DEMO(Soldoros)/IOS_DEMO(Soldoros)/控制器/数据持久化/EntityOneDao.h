//
//  EntityOneDao.h
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-30.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EntityOneDao : NSObject
+ (BOOL)insertObjectWithParameter:(NSDictionary *)parameters entityName:(NSString *)entityName;
+ (NSArray *)readObjectWithEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate;
+ (BOOL)deleteWithEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate;
+ (BOOL)modifyWithEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate modifyData:(NSDictionary *)dataDic;
@end
