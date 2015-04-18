//
//  FileManagerController.m
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-30.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "FileManagerController.h"

@interface FileManagerController ()
{
    UITextView *_textView;
    NSFileManager *_fileManager;
}

@end

@implementation FileManagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文件保存";
    _fileManager = [NSFileManager defaultManager];
    [self initializeApperance];
}

- (void)initializeApperance {
    
    self.view.backgroundColor = COLOR(230, 230, 230, 1);
    
    _textView = [[UITextView alloc] initForAutoLayout];
    [self.view addSubview:_textView];
    [_textView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.7];
    [_textView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.view withMultiplier:0.3];
    [_textView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [_textView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_textView layoutIfNeeded];
    _textView.layer.cornerRadius = 5;
    
    //增加按钮,增删查改;
    NSArray *namesArray = @[@"增加文件",@"删除文件",@"查看文件",@"修改文件",@"归档",@"恢复归档"];
    NSMutableArray *buttons = [NSMutableArray array];
    for (int i = 0 ; i < namesArray.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.backgroundColor = COLOR(50, 120, 50, 1);
        [button setTitle:namesArray[i] forState:UIControlStateNormal];
        [buttons addObject:button];
        button.titleLabel.font = [UIFont systemFontOfSize:10];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 21 + i;
    }
    [buttons[0] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_textView withOffset:15];
    [buttons[0] autoSetDimension:ALDimensionHeight toSize:25];
    [buttons autoMatchViewsDimension:ALDimensionHeight];
    [buttons autoDistributeViewsAlongAxis:ALAxisHorizontal withFixedSpacing:10 alignment:NSLayoutFormatAlignAllCenterY];
}

- (void)buttonPressed:(UIButton *)sender
{
    switch (sender.tag - 21) {
        case 0:
        {
            [self saveFile];
            break;
        }
        case 1:
        {
            [self deleteFile];
            break;
        }
        case 2:
        {
            [self getFile];
            break;
        }
        case 3:
        {
            [self modifyFile];
            break;
        }
        case 4:
        {
            [self archiver];
            break;
        }
        case 5:
        {
            [self unarchiver];
            break;
        }
            
            
        default:
            break;
    }
}

//文件路劲
- (NSString *)getPath
{
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [document stringByAppendingPathComponent:@"fileOne"];
    NSLog(@"%@",filePath);
    return filePath;
}

//保存文件
- (void)saveFile
{
    [self deleteFile];
    if (![_fileManager fileExistsAtPath:[self getPath]]) {
        [_fileManager createFileAtPath:[self getPath] contents:[_textView.text dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    }
}

//删除文件
- (void)deleteFile
{
    [_fileManager removeItemAtPath:[self getPath] error:nil];
}

//查看文件
- (void)getFile
{
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:[self getPath]];

    NSData *data = [fileHandle readDataToEndOfFile];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"------%@-------",str);
    [fileHandle closeFile];
}

//修改文件
- (void)modifyFile
{
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:[self getPath]];
    [fileHandle seekToEndOfFile];//文件指针移动到文件结尾处,用于在文件尾追加数据
    [fileHandle writeData:[_textView.text dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile];

}

//文件归档 - 归档自定义对象,需要实现NSCoding协议,和copy类似
- (void)archiver
{
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [document stringByAppendingPathComponent:@"myDic.archive"];
    NSDictionary *dic = @{@"username":@"admin",@"pwd":@"123"};
    [NSKeyedArchiver archiveRootObject:dic toFile:filePath];
}
//归档恢复
- (void)unarchiver
{
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [document stringByAppendingPathComponent:@"myDic.archive"];
    NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",dic);
}


@end
