//
//  TwoDidCodeScanViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/11/26.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "TwoDidCodeScanViewController.h"
//#import "ZBarSDK.h"



//@interface TwoDidCodeScanViewController ()<ZBarReaderViewDelegate>
//{
//
//    //扫描二维码
//    ZBarReaderView *_readerView;
//    ZBarCameraSimulator *cameraSimulator;
//
//    //计算扫描区域的宽和高
//    float a,b;
//    
//    int num;
//    BOOL upOrdown;
//    NSTimer * timer;
//}
//@property (nonatomic, retain) UIImageView * line;
//@end

@implementation TwoDidCodeScanViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
}

//-(void)initData
//{
//    //扫描线条的移动距离
//    num = 0;
//    //扫描线条上移还是下移
//    upOrdown = NO;
//    //扫描线条的定时器
//    timer = nil;
//    //二维码扫描类
//    [ZBarReaderView class];
//    
//}
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    [self initZBarReader];
//    [self initData];
//    self.view.backgroundColor = [UIColor whiteColor];
//
//    timer.fireDate = [NSDate date];
//    [_readerView start];
//}
//
////扫描二维码初始化
//-(void)initZBarReader
//{
//    _readerView = [[ZBarReaderView alloc]init];
//    _readerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    _readerView.readerDelegate = self;
//    //关闭闪光灯
//    _readerView.torchMode = 0;
//    //开启摄像头
//    if (TARGET_IPHONE_SIMULATOR)
//    {
//        cameraSimulator = [[ZBarCameraSimulator alloc]
//                           initWithViewController:self];
//        cameraSimulator.readerView = _readerView;
//    }
//    [self.view addSubview:_readerView];
//    //扫描区域计算
//    _readerView.scanCrop = CGRectMake(0.1,0.2,0.8,0.8);
//    [_readerView start];
//    
//    //遮罩层
//    for(int i=0;i<2;++i)
//    {
//        UIView * viewLR = [[UIView alloc] initWithFrame:AUTOLayer(i*290, 0,30, self.view.frame.size.height,1)];
//        viewLR.backgroundColor = [UIColor blackColor];
//        viewLR.alpha = 0.3;
//        [self.view addSubview:viewLR];
//        
//        UIView * viewTD = [[UIView alloc] initWithFrame:
//                           AUTOLayer(30,i*345,260, (self.view.frame.size.height-290)/2-32,1)];
//        viewTD.backgroundColor = [UIColor blackColor];
//        viewTD.alpha = 0.3;
//        [self.view addSubview:viewTD];
//    }
//    
//    
//    //添加扫描边框
//    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scanning_screen"]];
//    a  = _readerView.frame.size.width;
//    b  = _readerView.frame.size.height;
//    image.frame = AUTOLayer(0.1*a,0.2*b,0.8*a,0.4*b,1);
//    [_readerView addSubview:image];
//    
//    //定时器 保证中间的扫描线条不间断地扫描
//    _line = [[UIImageView alloc] initWithFrame:
//             AUTOLayer(0, 10, 0.8 * a, 3, 1)];
//    _line.image = [UIImage imageNamed:@"scanning_line"];
//    [image addSubview:_line];
//    [self startTimer];
//}
//
//-(void)startTimer
//{
//    if(!timer)
//    {
//        timer = [NSTimer scheduledTimerWithTimeInterval:0.01
//                                                 target:self
//                                               selector:@selector(lineAniMate)
//                                               userInfo:nil
//                                                repeats:YES];
//    }
//}
//
////扫描结束
//- (void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image
//{
//    //定时器从头开始 线条再上面预备
//    timer.fireDate = [NSDate distantFuture];
//    _line.frame = AUTOLayer(0, 0, 0.8 * a, 3, 1);
//    
//    for (ZBarSymbol *symbol in symbols)
//    {
//        
//        NSLog(@"%@", symbol.data);
//        break;
//    }
//    
//    //扫描成功后删除初始化的数据
//    // [_readerView stop];
//    
//}
//
//
////实现条形码中间的滚动条的上下移动
//-(void)lineAniMate
//{
//    if (upOrdown == NO)
//    {
//        num ++;
//        _line.frame = AUTOLayer(0,10+num,0.8*a, 3,1);
//        if (num >= 0.4*b-20)
//        {
//            upOrdown = YES;
//        }
//    }
//    else
//    {
//        _line.frame = AUTOLayer(0, 0, 0.8*a, 3, 1);
//        upOrdown = NO;
//        num = 0;
//    }
//}
//
//
//
//
//





@end
