//
//  CJWDateUtils.m
//  CJWUtils
//
//  Created by cen on 9/12/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "CJWDateUtils.h"


@interface CJWDateUtils(){
//    NSDateComponents *components;
}
@end

@implementation CJWDateUtils

+(NSDate *)stringToDate:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH-mm"];
    //20100804 1601
//    NSString *str = [NSString stringWithFormat:@"%@00",dateString];
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    //增加差了的时区
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [CJWDateUtils addTimeZone:date];
    
    return localeDate;
}

+(NSDate *)addTimeZone:(NSDate *)date{
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate: date];
//    date = [date dateByAddingTimeInterval:interval];
    return date;
}

+(NSString *)sampleInput{
    return @"yyyyMMdd HHmm";
}

+(void)today:(NSString *)hour minute:(NSString *)min{
}


+(NSDate *)now{
    NSDate *date = [NSDate date];
    
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    
//    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [CJWDateUtils addTimeZone:date];
    return localeDate;
}

+(NSDateFormatter *)dateFormatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    return dateFormatter;
}

//+(NSDate *)tomorrowDate{
//    NSTimeInterval secondsPerDay = 24*60*60;
//    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
//    return tomorrow;
//}

@end


@implementation CJWDateUtils (dateMethod)

+(NSString *)tomorrowDate{
    NSTimeInterval secondsPerDay = 24*60*60;
    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
    NSDateFormatter *formatter = [self dateFormatter];
    NSString *date = [formatter stringFromDate:tomorrow];
    return date;
}

+(NSDateComponents *)components{
    NSDate *date = [[NSDate alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitDay|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitCalendar fromDate:date];
    return components;
}

+(NSString *)thisYear{
    NSString *year = [NSString stringWithFormat:@"%ld",[[self components] year]];
    return year;
}

+(NSString *)thisMonth{
    NSDateComponents *comp = [self components];
    NSString *month = [NSString stringWithFormat:@"%ld",[comp month]];
    return month;
}

+(NSString *)thisDate{
    NSDateFormatter *formatter = [self dateFormatter];
    NSString *date = [formatter stringFromDate:[[NSDate alloc] init]];
    return date;
}

+(NSString *)thisDay{
    NSDateComponents *comp = [self components];
    NSString *day = [NSString stringWithFormat:@"%ld",[comp day]];
    return day;
}

+(NSString *)thisTime{
    NSDateComponents *comp = [self components];
    NSString *time = [NSString stringWithFormat:@"%ld%ld",[comp hour],[comp minute]];
    return time;
}

@end




