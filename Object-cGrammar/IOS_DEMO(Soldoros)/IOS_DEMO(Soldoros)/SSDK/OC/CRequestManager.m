//
//  CRequestManager.m
//  UCook
//
//  Created by scihi on 14/11/1.
//  Copyright (c) 2014年 huangrun. All rights reserved.
//


//封装网络请求
#import "CRequestManager.h"
#import "AFNetworking.h"

@implementation CRequestManager


//请求的参数字典  地址取公共地址后面一段    请求成功   请求失败
+(void)requestWith:(NSDictionary *)paramars
            method:(NSString *)method
     requestSucess:(void (^)(id object))sucess
    requestFailure:(void (^)(void))failer
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",@"text/javascript", nil];

    [manager POST:method parameters:paramars success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
             sucess(responseObject);
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         failer();
     }];

}

//带图片的POST异步请求
+(void)requestWith:(NSDictionary *)dic
             andURL:(NSString *)string
             reques:(void (^) (id result))success
              faile:(void (^) (void))file
            setFile:(id)imageFile
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",@"text/javascript", nil];

    
    [manager POST:string parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
     {
         
         if (imageFile)
         {
             [formData appendPartWithFileData:UIImagePNGRepresentation(imageFile) name:@"photo" fileName:@"headggg.jpg" mimeType:@"image/jpeg"];
         }
         
     }
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         success(responseObject);
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         file();
     }];
}

//GET异步请求
+(void)requestWith:(NSString *)string
            reques:(void (^) (id result))success
             faile:(void (^) (void))file
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",@"text/javascript", nil];
    
    [manager GET:nil parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
        success(responseObject);
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        file();
    }];
    
    
}















@end
