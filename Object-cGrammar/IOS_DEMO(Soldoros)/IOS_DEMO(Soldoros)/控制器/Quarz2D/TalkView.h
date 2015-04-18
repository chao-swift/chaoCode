//
//  TalkView.h
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-11-5.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    DLeft,
    DRight,
    DUp,
    DDown,
}Direction;

@interface TalkView : UIButton

@property (nonatomic,assign) Direction direction;

@end
