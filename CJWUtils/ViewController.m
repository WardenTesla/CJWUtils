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

    CJWUserManager *user = [[CJWUserManager alloc] initWithAccount:@"frank"];
//    [user saveDefault:@"abc" forKey:@"def"];
    //
    NSLog(@"%@",[user getDefaultByKey:@"def"]);
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
