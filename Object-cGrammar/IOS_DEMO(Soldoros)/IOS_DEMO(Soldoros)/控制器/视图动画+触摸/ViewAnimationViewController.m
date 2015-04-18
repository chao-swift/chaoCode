//
//  ViewAnimationViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "ViewAnimationViewController.h"

@interface ViewAnimationViewController ()

@end

@implementation ViewAnimationViewController

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
    self.btnNames = @[@"移动",@"放大",@"旋转",@"UIView形式"];
}

-(void)initializeAppearance
{
    self.contentLabel.text = @"动画";
    self.contentLabel.hidden = NO;
    self.contentLabel.backgroundColor = [UIColor greenColor];
}

- (void)buttonPressed:(UIButton *)sender
{
    switch (sender.tag - 11) {
        case 0:
        {
            [self move];
            break;
        }
        case 1:
        {
            [self scale];
            break;
        }
        case 2:
        {
            [self rotation];
            break;
        }
        case 3:
        {
            [self animationView];
            break;
            
        }
            
        default:
            break;
    }
}

- (void)move
{
    static BOOL hasMove = NO;

    [UIView animateWithDuration:0.5 animations:^{
        if(hasMove) {
            self.contentLabel.center = CGPointMake(self.contentLabel.center.x, self.contentLabel.center.y + 100);

        } else {
        self.contentLabel.center = CGPointMake(self.contentLabel.center.x, self.contentLabel.center.y - 100);
        } }];
    hasMove = !hasMove;
}

- (void)scale
{
    static BOOL hasScale = NO;
    [UIView animateWithDuration:0.5 animations:^{
        if (hasScale) {
            self.contentLabel.center = CGPointMake(self.contentLabel.center.x, self.contentLabel.center.y + 100);
            self.contentLabel.transform = CGAffineTransformMakeScale(1, 1);

        } else {
            self.contentLabel.center = CGPointMake(self.contentLabel.center.x, self.contentLabel.center.y - 100);
        self.contentLabel.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }
    }];
    hasScale = !hasScale;
}

- (void)rotation
{
    static BOOL hasRot = NO;
    [UIView animateWithDuration:0.5 animations:^{
        if(hasRot) {
        self.contentLabel.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(1.5, 1.5), M_PI);
        } else {
            self.contentLabel.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(1, 1), 2 * M_PI);

        }
    }];
    hasRot = !hasRot;
}

- (void)animationView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.contentLabel cache:YES];
    [UIView commitAnimations];
}

- (void)endAnimation
{
    NSLog(@"结束动画");
}

@end
