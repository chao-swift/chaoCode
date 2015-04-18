//
//  SelfTPicture.h
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/12/8.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol  TPicteruDelegate <NSObject>

- (void)readPicture:(UIImage *)image;

@end

@interface SelfTPicture : NSObject

@property (nonatomic,strong) AVCaptureSession *session;
@property (nonatomic,strong) AVCaptureStillImageOutput *output;

@property (assign,nonatomic) id delegate;
- (void)captureStillImage;

@end
