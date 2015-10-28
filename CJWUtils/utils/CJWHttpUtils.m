//
//  CJWHttpUtils.m
//  Coupon
//
//  Created by cen on 8/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "CJWHttpUtils.h"
#import "CJWCacheUtils.h"
#import "CJWNetworkActivityIndicator.h"

@interface CJWHttpUtils(){
    AFHTTPRequestOperationManager *http;
}

@end

@implementation CJWHttpUtils

-(AFHTTPRequestOperationManager * )modifyManager:(AFHTTPRequestOperationManager *)manager{
    [manager securityPolicy].allowInvalidCertificates = YES;
    return manager;
}

-(AFHTTPSessionManager *)requestUrl2:(NSString *)url param:(NSDictionary *)param success:(CJWSuccessBlock)success fail:(CJWFailBlock)fail{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [CJWNetworkActivityIndicator startIndicator];
    [mgr POST:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [CJWNetworkActivityIndicator stopIndicator];
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [CJWNetworkActivityIndicator stopIndicator];
        NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        NSDictionary *serializedData = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];

    }];
    return mgr;
}

-(void)requestUrl:(NSString *)url param:(NSDictionary *)param success:(CJWSuccessBlock)success fail:(CJWFailBlock)fail{
    [CJWNetworkActivityIndicator startIndicator];
    if (http == nil) {
        http = [AFHTTPRequestOperationManager manager];
    }
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    http = [self modifyManager:http];
    [http POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
        
        NSInteger statusCode = operation.response.statusCode;
        if (statusCode == 200) {
            success(operation.responseString);
            return;
            //            NSLog(@"%@",operation.responseString);
        }else{
            NSLog(@"status code %ld",operation.response.statusCode);
            NSLog(@"error code %ld",error.code);
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
    __block BOOL returnFlag = NO;
    NSString *cacheKey = [CJWCacheUtils generateCacheKey:url param:param];
    __weak __block id cacheObject;
    if (flag) {
        NSString *cacheKey = [CJWCacheUtils generateCacheKey:url param:param];
        [CJWCacheUtils getCache:cacheKey block:^(id object) {
            cacheObject = object;
            returnFlag = YES;
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
        if (!returnFlag) {
            fail();
        }
    }];
}


-(void)upload:(NSString *)URLString parameters:(NSDictionary *)parameters
        image:(UIImage *)uploadImage paramName:(NSString *)paramName imageName:(NSString *)name success:(void (^)(id resp))success failure:(void (^)(NSError *error))failure{
    [self upload:URLString parameters:parameters image:uploadImage paramName:paramName imageName:name success:success failure:failure uploadWith:nil];
}

-(void)upload:(NSString *)URLString parameters:(NSDictionary *)parameters
        image:(UIImage *)uploadImage paramName:(NSString *)paramName imageName:(NSString *)name success:(void (^)(id resp))success failure:(void (^)(NSError *error))failure uploadWith:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))block{
    AFHTTPRequestOperationManager *manager  = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestOperation *operation = [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData *dataObj = UIImageJPEGRepresentation(uploadImage, 1.0);
        [formData appendPartWithFileData:dataObj name:paramName fileName:name mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        DDLogDebug(@"resp\n%@",responseObject);
        if ([responseObject isKindOfClass:[NSString class]]) {
            if ([responseObject length]<50) {
                success(responseObject);
            }else{
            }
        }else{
//            DDLogError(@"upload response exception");
        }
        //        success(operation,responseObject);
        failure(nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        DDLogDebug(@"upload exception\n%@",error);
//        NSLog(@"status code %ld",operation.response.statusCode);
//        NSLog(@"error code %ld",error.code);
        NSInteger statusCode = operation.response.statusCode;
        if (statusCode == 200) {
            success(operation.responseString);
            return;
            //NSLog(@"%@",operation.responseString);
        }else{
            failure(error);
        }
    }];
    
    [operation setUploadProgressBlock:block];
//    return operation;
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
