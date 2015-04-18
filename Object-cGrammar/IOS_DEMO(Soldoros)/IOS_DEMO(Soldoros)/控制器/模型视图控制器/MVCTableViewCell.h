//
//  MVCTableViewCell.h
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/11/19.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVCModel.h"

@interface MVCTableViewCell : UITableViewCell

@property(nonatomic,strong) MVCModel *mavModel;
@property(nonatomic,assign) NSInteger index;

@end
