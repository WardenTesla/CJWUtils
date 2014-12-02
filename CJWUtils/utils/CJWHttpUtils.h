//
//  CJWHttpUtils.h
//  Coupon
//
//  Created by cen on 8/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CJWSuccessBlock)(id response);
typedef void (^CJWFailBlock)();

@interface CJWHttpUtils : NSObject

-(void)requestUrl:(NSString *)url param:(NSDictionary *)param success:(CJWSuccessBlock)success fail:(CJWFailBlock)fail;

+(CJWHttpUtils *)manager;

@end


@interface CJWHttpUtils (httpWithCache)

-(void)requestUrl:(NSString *)url param:(NSDictionary *)param shouldCache:(BOOL)flag success:(CJWSuccessBlock)success fail:(CJWFailBlock)fail;

-(void)upload:(NSString *)URLString parameters:(NSDictionary *)parameters
        image:(UIImage *)uploadImage paramName:(NSString *)paramName imageName:(NSString *)name success:(void (^)(id resp))success failure:(void (^)(NSError *error))failure uploadWith:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))block;

-(void)upload:(NSString *)URLString parameters:(NSDictionary *)parameters
        image:(UIImage *)uploadImage paramName:(NSString *)paramName imageName:(NSString *)name success:(void (^)(id resp))success failure:(void (^)(NSError *error))failure;


@end