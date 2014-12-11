//
//  ViewController.m
//  CJWUtils
//
//  Created by cen on 9/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "ViewController.h"
#import "CJWUtils.h"

#import "AFNetworkReachabilityManager.h"

#import "CJWVersion.h"
#import "CJWDateUtils.h"
#import "NSDate+Utilities.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *date = [[CJWDateUtils stringToDate:@"20140909 0000"] dateByAddingHours:3];
    
//    [CJWDateUtils ]
    NSLog(@"%@cc {{%@}}",[CJWVersion isiOS8]?@"yes":@"no",date);
//    NSURLCache *cache = [NSURLCache sharedURLCache];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@""] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30.0f];
//
//    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:0 diskCapacity:50 * 1024 * 1024 diskPath:nil];
//    [NSURLCache setSharedURLCache:URLCache];
    
    
    
   
    NSLog(@"hello");
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    
//    [CJWUserManager cleanUserInfomation];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(req)]];
    [self.view showLoading];
}

-(void)req{
    AFNetworkReachabilityStatus status = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    NSLog(@"status: %@", AFStringFromNetworkReachabilityStatus(status));

//    NSLog(@"%@".)
    [[CJWHttpUtils manager] requestUrl:@"http://115.29.141.172/CDesign/shop" param:nil shouldCache:true success:^(id response) {
        NSLog(@"suc");
    } fail:^{
        //
    }];
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
