//
//  PhotoViewController.h
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/12/8.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PhotoControllerDelegate <NSObject>

- (void)backController:(NSInteger)index;

@end


@interface PhotoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (assign,nonatomic) id delegate;
@property (assign,nonatomic) BOOL hasSingleToLocTem;//有单例,但还是存入临时
- (IBAction)takePhoto:(id)sender;


@end
