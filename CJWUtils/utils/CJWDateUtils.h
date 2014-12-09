//
//  CJWDateUtils.h
//  CJWUtils
//
//  Created by cen on 9/12/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJWDateUtils : NSDate

+(NSDate *)stringToDate:(NSString *)dateString;
+(NSString *)sampleInput;
+(void)testing;
@end


@interface CJWDateUtils(dateMethod)

+(NSDateComponents *)components;

+(NSString *)thisYear;

+(NSString *)thisMonth;

+(NSString *)thisDate;

+(NSString *)thisDay;

+(NSString *)thisTime;

+(NSString *)tomorrowDate;

@end