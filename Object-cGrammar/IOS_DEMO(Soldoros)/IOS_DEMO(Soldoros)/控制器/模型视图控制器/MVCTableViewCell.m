//
//  MVCTableViewCell.m
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/11/19.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "MVCTableViewCell.h"


@implementation MVCTableViewCell

-(instancetype)initWithTag:(NSInteger)count
{
    if(self == [super init])
    {
        _index = count;
        [self initView];
    }
    return  self;
}



-(void)setMavModel:(MVCModel *)mavModel
{
    _mavModel = mavModel;
    
    self.textLabel.text = _mavModel.name;

    self.detailTextLabel.text = _mavModel.key;
}


-(void)initView
{

}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
