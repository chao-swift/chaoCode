//
//  ManagePhoneController.m
//  IOS_DEMO(Soldoros)
//
//  Created by rimi on 14-10-24.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "ManagePhoneController.h"
#import "ContactController.h"

@interface ManagePhoneController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation ManagePhoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnNames = @[@"管理联系人",@"打电话",@"发短信",@"发邮件",@"打开浏览器",@"本地相机相册"];
}

- (void)buttonPressed:(UIButton *)sender
{
    NSString *urlStr;
    switch (sender.tag - 11) {
        case 0:
        {
            ContactController *controller = [[ContactController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
        case 1:
        {            urlStr = @"tel:";
            break;
        }
        case 2:
        {
            urlStr = @"sms:10010";
            break;
        }
        case 3:
        {
            urlStr = @"mailto:277907803@qq.com";
            break;
        }
        case 4:
        {
            urlStr = @"http://www.baidu.com";
            break;
        }
        case 5:
        {
            [self localPictures];
        }
            
        default:
            break;
    }
    NSURL *url = [NSURL URLWithString:urlStr];
    NSLog(@"%d",[[UIApplication sharedApplication] canOpenURL:url]);
    [[UIApplication sharedApplication] openURL:url];
}

- (void)localPictures
{
    UIImagePickerController *controller = [UIImagePickerController new];
    controller.delegate = self;
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
        UIImageView *imageview = [UIImageView new];
        imageview.image = image;
        [self.view addSubview:imageview];
        [imageview autoSetDimensionsToSize:CGSizeMake(200, 200)];
        [imageview autoCenterInSuperview];
    }];
}

@end
