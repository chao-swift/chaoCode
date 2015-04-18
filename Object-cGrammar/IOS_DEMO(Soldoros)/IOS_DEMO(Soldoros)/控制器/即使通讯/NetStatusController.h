//
//  NetStatusController.h
//  IOS_DEMO(Soldoros)
//
//  Created by ooo on 14-10-31.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetStatusController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *netLabel;
- (IBAction)testNetStatus:(id)sender;
- (IBAction)testWift:(id)sender;
- (IBAction)testInternet:(id)sender;

@end
