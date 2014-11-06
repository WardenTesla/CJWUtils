//
//  CJWVersion.h
//  CJWUtils
//
//  Created by cen on 6/11/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define IS_IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >=8
@interface CJWVersion : NSObject

+ (BOOL)isiOS8;
@end
