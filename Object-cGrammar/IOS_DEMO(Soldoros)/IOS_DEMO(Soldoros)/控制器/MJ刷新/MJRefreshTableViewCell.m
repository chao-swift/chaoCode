//
//  MJRefreshTableViewCell.m
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/12/8.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "MJRefreshTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface MJRefreshTableViewCell()
{
    UIImageView *imageView;
    UILabel *cellLabel;
}

@end

@implementation MJRefreshTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self initMainView];
    }
    return self;
}

//初始化主视图
-(void)initMainView
{
    imageView = [[UIImageView alloc]init];
    imageView.frame = AUTOLayer(5, 5, 40, 40, 1);
    imageView.backgroundColor = [UIColor lightGrayColor];
    imageView.layer.cornerRadius = 5;
    [self addSubview:imageView];
    
    
    cellLabel = [[UILabel alloc]init];
    cellLabel.frame = AUTOLayer(80, 10, 120, 30, 1);
    cellLabel.layer.borderColor = Gray;
    cellLabel.layer.borderWidth = 1;
    [self addSubview:cellLabel];
    
    
}

-(void)setDataSource:(NSDictionary *)DataSource
{
    _DataSource = DataSource;
    
    [imageView setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    
    cellLabel.text = @"";
}











- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
