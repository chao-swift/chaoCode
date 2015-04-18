//
//  ScrollViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()<UIScrollViewDelegate>
{
    
    UIScrollView *srcollView;
    UIPageControl *page;
    BOOL isAnimation;
}

@end

@implementation ScrollViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    //不加上导航栏偏移量
    self.automaticallyAdjustsScrollViewInsets = NO;
    //显示大小,相当于一个边框
    srcollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, 320, 320)];
    srcollView.backgroundColor = [UIColor orangeColor];
    //总共大小,如果高度设置为0,则默认不可滑动
    srcollView.contentSize = CGSizeMake(6 * 320, 0);
    srcollView.pagingEnabled = YES;//设置按页滑动]
    //设置偏移量
    //    srcollView.contentOffset = CGPointMake(640, 0);
    srcollView.delegate = self;
    //  设置只能朝一个方向滑动,并不是禁止横向或者纵向滑动
    //    srcollView.directionalLockEnabled = YES;
    [self.view addSubview: srcollView];
    
    for (int i = 1 ;i <= 6;i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40 + 320 * (i - 1), 0, 240, 320)];
        //图片比较大的时候
        imageView.tag = i;
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",i] ofType:@"png"];
        imageView.image = [UIImage imageWithContentsOfFile:imagePath];
        [srcollView addSubview:imageView];
    }
    
    /*添加分页控件*/
    page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 480, 320, 20)];
    page.numberOfPages = 6;
    page.currentPage = 0;
    page.pageIndicatorTintColor = [UIColor greenColor];
    page.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:page];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一张" style:UIBarButtonItemStylePlain target:self action:@selector(nextImage:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上一张" style:UIBarButtonItemStylePlain target:self action:@selector(lastImage:)];
    isAnimation = NO;
}

- (void)nextImage:(UIBarButtonItem *)sender
{
    if(isAnimation) {
        return ;
    }
    if(srcollView.contentOffset.x < 5 * 320) {
        isAnimation = YES;
        [srcollView setContentOffset:CGPointMake(srcollView.contentOffset.x + 320, srcollView.contentOffset.y) animated:YES];
        [self performSelector:@selector(resetAnimation:) withObject:nil afterDelay:1];
    }
}

- (void)lastImage:(UIBarButtonItem *)sender
{
    if(isAnimation) {
        return ;
    }
    if(srcollView.contentOffset.x > 0) {
        isAnimation = YES;
        [srcollView setContentOffset:CGPointMake(srcollView.contentOffset.x - 320, srcollView.contentOffset.y) animated:YES];
        NSNumber *number = [NSNumber numberWithInt:1];
        //第二个参数可以用来传值
        [self performSelector:@selector(resetAnimation:) withObject:number afterDelay:0.5];
    }
}

- (void)resetAnimation:(NSObject *)obj
{
    isAnimation = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //contentOffset 偏移量
    NSInteger pageNumber = scrollView.contentOffset.x / 320.0  ;
    //求出当前偏移量对界面宽度的余数.
    NSInteger dis = (NSInteger)scrollView.contentOffset.x % 320;
    if(dis > 160) {
        page.currentPage = pageNumber + 1;
    }
    else {
        page.currentPage = pageNumber;
    }
}

@end
