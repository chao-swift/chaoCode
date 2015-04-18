//
//  QQController.m
//  IOS_DEMO(Soldoros)
//
//  Created by rimi on 14-10-24.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "QQController.h"
#import "NetStatusController.h"


@interface QQController ()

@end

@implementation QQController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnNames = @[@"检测网络状态",@"即时通讯"];
}

- (void)buttonPressed:(UIButton *)sender
{
    switch (sender.tag - 11) {
        case 0:
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"netstatus"];
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
            
        default:
            break;
    }
}






@end
