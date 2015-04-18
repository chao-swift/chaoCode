//
//  ViewController.m
//  AlertController
//
//  Created by Tang on 15/4/17.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import "ViewController.h"
#import "AlertController.h"

@interface ViewController ()
{
    AlertController* alert ;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    alert = [AlertController alertControllerWithTitle:@"title" message:@"sdhjjfkshadfkssd" preferredStyle:10] ;
    
    
    
    [self performSelector:@selector(addView) withObject:self afterDelay:3.0] ;
}
-(void)addView
{
    [self.view addSubview:alert.view] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
