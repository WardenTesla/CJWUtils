//
//  CJWCacheUtils.h
//  Coupon
//
//  Created by cen on 8/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "TMCache.h"

@interface CJWCacheUtils : TMCache

+(void)cache:(id)cacheObject forKey:(NSString *)cacheKey;
+(void)getCache:(NSString *)cacheKey block:(void (^)(id object))block;
+(NSString *)generateCacheKey:(NSString *)url param:(NSDictionary *)param;
+(void)clearCache;

+(id)getCacheBy:(NSString *)key;
@end
