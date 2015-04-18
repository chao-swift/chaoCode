//
//  ViewController.m
//  CustomTextField
//
//  Created by Tang on 15/4/16.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

#import "ViewController.h"
#import "CustomTextField.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CustomTextField* userName = [[CustomTextField alloc] initWithFrame:CGRectMake(100, 100, 200, 40)] ;
    userName.leftImage = [UIImage imageNamed:@"用户"] ;
    userName.delegate = self ;
    userName.keyboardType = UIKeyboardTypeDecimalPad ;
    [self.view addSubview:userName] ;
    
}
//只能输入数字
//#define NUMBERS @"0123456789."
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSString *localTextMessage=[textField.text stringByReplacingCharactersInRange:range withString:string];
//    NSCharacterSet*cs;
//    cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
//    NSString*filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
//    BOOL basicTest = [string isEqualToString:filtered];
//    if (!basicTest)
//    {
//        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"温馨提示"
//                                                        message:@"请输入有效金额"
//                                                       delegate:nil
//                                              cancelButtonTitle:@"好"
//                                              otherButtonTitles:nil];
//        
//        [alert show];
//        return NO;
//    }
//    else if ([localTextMessage rangeOfString:@"."].length>0)//当@“.“的数量大于1或者小数点后2位以上时不改变字符串(只能输入小数点后两位)
//    {
//        NSArray *goestArray=[localTextMessage componentsSeparatedByString:@"."];//临时数组，用完请释放
//        NSLog(@"goest = %@",goestArray) ;
//        if ([goestArray count]>2||[[goestArray objectAtIndex:1] length]>2)
//        {
//            return NO;
//        }
//    }
//    //判断位数大于7就不让输入
//    if (localTextMessage.length>7) {
//        return  NO;
//    }
//    return YES ;
//}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSString *text = [textField text];
    
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
//    NSLog(@"string = -%@-",string) ;
    //替换空格
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSLog(@"string = =%@=",string) ;
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *newString = @"";
    while (text.length > 0) {
        NSString *subString = [text substringToIndex:MIN(text.length, 4)];
        NSLog(@"subString =  .%@.",subString ) ;
        newString = [newString stringByAppendingString:subString];
        NSLog(@"newString = |%@|",newString ) ;
        if (subString.length == 4) {
            newString = [newString stringByAppendingString:@" "];
        }
        text = [text substringFromIndex:MIN(text.length, 4)];
    }
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    if (newString.length >= 24) {
        return NO;
    }
    [textField setText:newString];
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
