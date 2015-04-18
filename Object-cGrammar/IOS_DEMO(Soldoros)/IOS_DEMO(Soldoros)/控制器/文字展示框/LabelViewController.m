//
//  LabelViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "LabelViewController.h"

@interface LabelViewController ()

@end

@implementation LabelViewController
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
    NSString *str = @"    已经36岁高龄的科比目前身体状态极佳，新赛季有望重返巅峰状态。虽然科比的天赋极佳，但从他的话语中可以看出，他对自己的要求极高，如果没有后天的努力，科比也绝无法达到目前的高度。希望勤勉和执着能一直伴随着“飞侠”，让他在NBA的舞台上继续自己的表演";
    self.contentLabel.hidden = NO;
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    self.contentLabel.text = str;
    self.contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentLabel sizeToFit];
    self.contentLabel.numberOfLines = 3;
}

@end
