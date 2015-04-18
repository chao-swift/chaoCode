//
//  UIPickerViewController.h
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/11/27.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SearchGoodsViewControllerDelegate <NSObject>

@optional
-(void)searchOver:(NSMutableDictionary *)dictionary;

@end


@interface UIPickerViewController : UIViewController

@property(nonatomic,strong) NSMutableDictionary *searchDic;

@property(nonatomic,assign)id<SearchGoodsViewControllerDelegate>delegate;

@end
