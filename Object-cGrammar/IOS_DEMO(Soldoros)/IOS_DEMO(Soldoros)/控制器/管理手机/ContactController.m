//
//  ContactController.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-31.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "ContactController.h"
#import <AddressBookUI/AddressBookUI.h>


@interface ContactController ()<ABNewPersonViewControllerDelegate,ABPeoplePickerNavigationControllerDelegate>

@end

@implementation ContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    self.btnNames = @[@"添加联系人",@"显示指定联系人",@"选择联系人",@"显示未知联系人"];
}

- (void)buttonPressed:(UIButton *)sender
{
    switch (sender.tag - 11) {
        case 0:
        {
            ABNewPersonViewController *controller = [[ABNewPersonViewController alloc] init];
            controller.newPersonViewDelegate = self;
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
        case 1:
        {
            break;
        }
        case 2:
        {
            ABPeoplePickerNavigationController *controller = [[ABPeoplePickerNavigationController alloc] init];
            controller.peoplePickerDelegate = self;
            [self presentViewController:controller animated:YES completion:nil];
        }
            
        default:
            break;
    }
}

//新建联系人的回掉协议
- (void)newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(ABRecordRef)person
{
    if(person) {
        NSString *firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        NSLog(@"%@",firstName);
    }
    [newPersonView.navigationController popToRootViewControllerAnimated:YES];
}

//选定联系人回掉协议
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    [peoplePicker dismissViewControllerAnimated:YES completion:^{
        NSString *firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        NSLog(@"%@",firstName);
    }];
    return NO;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    NSLog(@"用户选择了取消");
}

@end
