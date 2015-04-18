//
//  MultithreadingViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "MultithreadingViewController.h"
#import "NSThreadController.h"
#import "GCDController.h"
#import "BackgroundController.h"
#import "OperationController.h"
#import "SynLockController.h"

@interface MultithreadingViewController ()
{
    NSInteger _selected;
    NSMutableArray *_controllerNames;
}

- (void)threadRun;

@end

@implementation MultithreadingViewController

-(id)init
{
    if(self == [super init])
    {
        _selected = 0;
        _controllerNames = [[NSMutableArray alloc] init];
        [_controllerNames addObject:NSStringFromClass([NSThreadController class])];
        [_controllerNames addObject:NSStringFromClass([SynLockController class])];
        [_controllerNames addObject:NSStringFromClass([GCDController class])];
        [_controllerNames addObject:NSStringFromClass([BackgroundController class])];
        [_controllerNames addObject:NSStringFromClass([OperationController class])];

        self.title = [NSString stringWithFormat:@"%@",[self class]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.btnNames = @[@"NSThread",@"线程同步与通信",@"使用GCD",@"后台运行",@"NSOperation和NSOperationQueue"];
}

- (void)buttonPressed:(UIButton *)sender
{
    _selected = sender.tag - 11;
    [self threadRun];
}

//NSThread执行
- (void)threadRun
{
    Class Controller = NSClassFromString(_controllerNames[_selected]);
    UIViewController *controller = (UIViewController *)[[Controller alloc] init];
    
    
    [self.navigationController pushViewController:controller animated:YES];
}


@end
