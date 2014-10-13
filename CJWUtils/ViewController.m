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

//    CJWUserManager *user = [[CJWUserManager alloc] initWithAccount:@"frank"];
//    user.password = @"abcABC123";
//    [user saveDefault:@"frankcjwen" forKey:@"def"];
//    [user logout];
//    [user login:@"frank2"];
//    NSLog(@"%@",[user getDefaultByKey:@"def"]);
//    [user setMyAccount:@"asd"];
//    NSLog(@"%@",user.password);
//    NSLog(@"%@",user.nickName);
//    NSLog(@"%@",user.phoneNumber);
//    NSLog(@"%@",user.myAccount);
//    [[CJWUserManager manager] login:@"frank1"];
    
    [[CJWUserManager manager] login:@"frank"];

    NSString *account = [CJWUserManager manager].myAccount;
//    NSLog(@"%@ %@",account,[CJWUserManager manager].password);
    

//    [CJWUserManager cleanUserInfomation];
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
