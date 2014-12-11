//
//  NSString+CJWString.m
//  CJWUtils
//
//  Created by cen on 6/12/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "NSString+CJWString.h"

@implementation NSString (CJWString)

+(NSString *)generateUUID{
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    // Get the string representation of CFUUID object.
    NSString *uuidStr = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidObject));
    uuidStr = [uuidStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return uuidStr;
}

@end

@implementation NSString (CJWWeekDay)

+(NSString *)weekDayByIndex:(NSInteger)index{
    
    NSString *weekDay = @"";
    switch (index) {
        case 1:
            weekDay = @"周一";
            break;
        case 2:
            weekDay = @"周二";break;
        case 3:
            weekDay = @"周三";break;
        case 4:
            weekDay = @"周四";break;
        case 5:
            weekDay = @"周五";break;
        case 6:
            weekDay = @"周六";break;
        case 7:
            weekDay = @"周日";break;
        default:weekDay = @"周n";break;
    }
    return weekDay;
}
@end