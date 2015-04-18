//
//  DataSourceOneViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "DataSourceOneViewController.h"
#import "FileManagerController.h"

@interface DataSourceOneViewController ()

@end

@implementation DataSourceOneViewController

-(id)init
{
    if(self == [super init])
    {
        self.title = [NSString stringWithFormat:@"%@",[self class]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeAppearance];
}

-(void)initializeAppearance
{
    self.btnNames = @[@"UserDefaults",@"Plist",@"文件和归档"];
}

- (void)buttonPressed:(UIButton *)sender
{
    switch (sender.tag - 11) {
        case 0:
        {
            [self testUserDefaults];
            break;
        }
        case 1:
        {
            [self textPlist];
            break;
        }
        case 2:
        {
            [self testFile];
            break;
        }
        default:
            break;
    }
}

//测试UserDefaults
- (void)testUserDefaults
{
    static BOOL hasSaved = NO;
    if(!hasSaved) {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:@"username" forKey:@"username"];
    [userDefaults synchronize];
        hasSaved = YES;
    } else {
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"username"]);
        hasSaved = NO;
    }
}

//测试Plist
- (void)textPlist
{
    static BOOL hasSaved = NO;
    if(!hasSaved) {
    NSMutableArray *contentArray = [NSMutableArray arrayWithContentsOfFile:[self createPlist]];
    [contentArray addObject:@{@"username":@"username",@"pwd":@"123456"}];
    [contentArray writeToFile:[self createPlist] atomically:YES];
        hasSaved = YES;
    } else {
        NSMutableArray *contentArray = [NSMutableArray arrayWithContentsOfFile:[self createPlist]];
        NSLog(@"%@",contentArray);
        hasSaved = NO;
    }
}

- (NSString *)createPlist
{
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [document stringByAppendingPathComponent:@"contacts.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:filePath]) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array writeToFile:filePath atomically:YES];
    }
    return filePath;
}

//测试文件保存
- (void)testFile
{
    FileManagerController *controller = [[FileManagerController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
