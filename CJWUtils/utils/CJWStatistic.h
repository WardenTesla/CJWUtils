//
//  CJWStatistic.h
//  CJWUtils
//
//  Created by cen on 25/12/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJWStatistic : NSObject


-(int)statistic3G;
-(long long int)statisticWIFI;
-(NSString *)converFromLongLongInt:(long long int)bytes;
-(NSString *)converFromInt:(int)bytes;

- (NSArray *)getDataCounters;

@end
