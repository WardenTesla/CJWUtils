//
//  NSString+CJWString.h
//  CJWUtils
//
//  Created by cen on 6/12/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CJWString)

+(NSString *)generateUUID;

@end

@interface NSString (CJWWeekDay)

+(NSString *)weekDayByIndex:(int)index;

@end

