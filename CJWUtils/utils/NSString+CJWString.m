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
