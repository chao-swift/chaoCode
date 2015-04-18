//
//  EntityOne.h
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-30.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EntityOne : NSManagedObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * pwd;

+ (NSString *)entityName;

@end
