//
//  ViewController.m
//  CJWUtils
//
//  Created by cen on 9/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "ViewController.h"
#import "CJWUtils.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *phone = @"13631290232";

    CJWUserManager *user = [[CJWUserManager alloc] initWithAccount:@"frank"];
//    [user setPhoneNumber:phone];
//    [user setPhoneNumber:@"cao"];
    NSString *ppp = user.phoneNumber;
    NSLog(@"phone [%@]",ppp);
//    user.nickName = @"蠢蠢猪🐷";
    NSLog(@"{[[[%@",user.nickName);
//    NSLog(@"\n%@",[AESCrypt encrypt:phone password:@"hello"]);
//    NSLog(@"\n\n%@\n",[[phone aesEncrypt] aesDecrypt]);
//    NSLog(@"\n\n%@\n",[[phone aesEncryptToString] aesDecrypt]);
//    NSLog(@"\n\n%@",[[phone encrypt] decrypt]);
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)dateToString:(NSDate *)date {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
@end
