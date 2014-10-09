//
//  CJWHttpUtils.m
//  Coupon
//
//  Created by cen on 8/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "CJWHttpUtils.h"
#import "AFNetworking.h"
#import "CJWCacheUtils.h"
#import "CJWNetworkActivityIndicator.h"

@interface CJWHttpUtils(){
}

@end

@implementation CJWHttpUtils


-(void)requestUrl:(NSString *)url param:(NSDictionary *)param success:(CJWSuccessBlock)success fail:(CJWFailBlock)fail{
    [CJWNetworkActivityIndicator startIndicator];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [CJWNetworkActivityIndicator stopIndicator];
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [CJWNetworkActivityIndicator stopIndicator];
        /*
         status code 404
         error code -1011
         
         status code 0
         error code -1004
         
         status code 200
         error code -1016
         
         */
        NSLog(@"status code %ld",operation.response.statusCode);
        NSLog(@"error code %ld",error.code);
        NSInteger statusCode = operation.response.statusCode;
        if (statusCode == 200) {
            success(operation.responseString);
            return;
            //            NSLog(@"%@",operation.responseString);
        }else{
        }
        NSLog(@"%@",error);
        fail();
    }];
}

+(CJWHttpUtils *)manager{
    static dispatch_once_t pred = 0;
    static CJWHttpUtils *manager = nil;
    dispatch_once(&pred,
                  ^{
                      manager = [[CJWHttpUtils alloc] init];
                  });
    return manager;
}


@end

@implementation CJWHttpUtils (httpWithCache)

-(void)requestUrl:(NSString *)url param:(NSDictionary *)param shouldCache:(BOOL)flag success:(CJWSuccessBlock)success fail:(CJWFailBlock)fail{
    
    NSString *cacheKey = [CJWCacheUtils generateCacheKey:url param:param];
    __weak __block id cacheObject;
    if (flag) {
        NSString *cacheKey = [CJWCacheUtils generateCacheKey:url param:param];
        [CJWCacheUtils getCache:cacheKey block:^(id object) {
            cacheObject = object;
            success(object);
        }];
    }
    [self requestUrl:url param:param success:^(id response) {
        if ( cacheObject != nil) {
            if ([cacheObject isEqual:response
                 ]) {
                return;
            }else{
            }
        }else{
        }
        success(response);
        if (flag) {
            [CJWCacheUtils cache:response forKey:cacheKey];
        }
    } fail:^{
        fail();
    }];
}

-(void)hello{
    
    BOOL flag;
    NSString *url;
    id param;
    CJWSuccessBlock success;
    CJWFailBlock fail;
    [CJWNetworkActivityIndicator startIndicator];
    NSString *cacheKey = [CJWCacheUtils generateCacheKey:url param:param];
    __weak __block id cacheObject;
    if (flag) {
        NSString *cacheKey = [CJWCacheUtils generateCacheKey:url param:param];
        [CJWCacheUtils getCache:cacheKey block:^(id object) {
            cacheObject = object;
            success(object);
        }];
    }
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [CJWNetworkActivityIndicator stopIndicator];
        if ( cacheObject != nil) {
            if ([cacheObject isEqual:responseObject
                 ]) {
                return;
            }else{
            }
        }else{
        }
        success(responseObject);
        if (flag) {
            [CJWCacheUtils cache:responseObject forKey:cacheKey];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [CJWNetworkActivityIndicator stopIndicator];
        /*
         status code 404
         error code -1011
         
         status code 0
         error code -1004
         
         status code 200
         error code -1016
         
         */
        NSInteger statusCode = operation.response.statusCode;
        if (statusCode == 200) {
            //            NSLog(@"%@",operation.responseString);
        }else{
        }
        NSLog(@"status code %ld",operation.response.statusCode);
        NSLog(@"error code %ld",error.code);
        NSLog(@"%@",error);
        if ( cacheObject == nil) {
            fail();
        }
    }];
}


@end
