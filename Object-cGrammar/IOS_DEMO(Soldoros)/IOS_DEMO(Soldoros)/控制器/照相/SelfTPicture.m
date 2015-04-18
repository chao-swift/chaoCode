//
//  SelfTPicture.m
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/12/8.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "SelfTPicture.h"

@implementation SelfTPicture



- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initlizeCamera];
    }
    return self;
}

- (void)initlizeCamera
{
    //初始化相机设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //输入设备
    AVCaptureDeviceInput *videoIntput = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    //输出端
    //先获取图片质量
    
    
    _output = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSeetings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG,AVVideoCodecKey,AVVideoQualityKey,@1, nil];
    [_output setOutputSettings:outputSeetings];
    
    //Session对象
    _session = [[AVCaptureSession alloc] init];
    [_session addInput:videoIntput];
    [_session addOutput:_output];
    
}

- (void)captureStillImage
{
    AVCaptureConnection *stillImageConnection = nil;
    for (AVCaptureConnection *connection in _output.connections)
    {
        for (AVCaptureInputPort *port in [connection inputPorts])
        {
            if ([[port mediaType] isEqual:AVMediaTypeVideo] )
            {
                stillImageConnection = connection;
                break;
            }
        }}
    [_output captureStillImageAsynchronouslyFromConnection:stillImageConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if(imageDataSampleBuffer != nil)
        {
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            UIImage *image = [UIImage imageWithData:imageData];
            
            
            if(_delegate && [_delegate respondsToSelector:@selector(readPicture:)])
            {
                [_delegate readPicture:image];
            }
        }
    }];
}



@end
