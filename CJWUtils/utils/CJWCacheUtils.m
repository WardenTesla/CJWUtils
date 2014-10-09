//
//  CJWCacheUtils.m
//  Coupon
//
//  Created by cen on 8/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "CJWCacheUtils.h"
#import "TMCache.h"

@implementation CJWCacheUtils


+(void)cache:(id)cacheObject forKey:(NSString *)cacheKey{
    
//    if ([cacheObject isKindOfClass:[NSString class]]) {
//        NSString *cache = cacheObject;
//    }else if([cacheObject isKindOfClass:[NSString class]]){
//    }else if([cacheObject isKindOfClass:[NSString class]]){
//    }
    @try {
        [[TMCache sharedCache] setObject:cacheObject forKey:cacheKey];
        NSLog(@"cached");
    }
    @catch (NSException *exception) {
        NSLog(@"cache type error");
    }
    @finally {
    }
}

+(void)getCache:(NSString *)cacheKey block:(void (^)(id object))block{
    [[TMCache sharedCache] objectForKey:cacheKey block:^(TMCache *cache, NSString *key, id object) {
        if (object != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                block(object);
            });
//            block(object);
        }else{
            NSLog(@"no cache");
        }
    }];
}

+(NSString *)generateCacheKey:(NSString *)url param:(NSDictionary *)param{
    if ( param != nil) {
        NSString *cacheKey = [NSString stringWithFormat:@"%@%@",url,param];
        return cacheKey;
    }
    return url;
}

+(void)clearCache{
    [[TMCache sharedCache] removeAllObjects];
}

@end
