//
//  CJWDateUtils.m
//  CJWUtils
//
//  Created by cen on 9/12/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "CJWDateUtils.h"

@implementation CJWDateUtils

+(NSDate *)stringToDate:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd HHmmss"];
//    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    //20100804 1601
    NSString *str = [NSString stringWithFormat:@"%@00",dateString];
    NSDate *date = [dateFormatter dateFromString:str];
    
    //增加差了的时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    return localeDate;
}

+(NSString *)sampleInput{
    return @"yyyyMMdd HHmm";
}

@end
