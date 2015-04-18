//
//  CRequestManager.h
//  UCook
//
//  Created by scihi on 14/11/1.
//  Copyright (c) 2014年 huangrun. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CRequestManager : NSObject

//普通字典类型做参数的POST异步网络请求
+(void)requestWith:(NSDictionary *)paramars
            method:(NSString *)method
     requestSucess:(void (^)(id object))sucess
    requestFailure:(void (^)(void))failer;

//有图片做参数的POST异步网络请求
+(void)requestWith:(NSDictionary *)dic
            andURL:(NSString *)string
            reques:(void (^) (id result))success
             faile:(void (^) (void))file
           setFile:(id)imageFile;

//GET请求
+(void)requestWith:(NSString *)string
            reques:(void (^) (id result))success
             faile:(void (^) (void))file;

@end
