//
//  CJWNetworkActivityIndicator.m
//  Coupon
//
//  Created by cen on 8/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "CJWNetworkActivityIndicator.h"

@implementation CJWNetworkActivityIndicator


+(void)startIndicator{
    [[self sharedActivityIndicator] startActivity];
}

+(void)stopIndicator{
    [[self sharedActivityIndicator] stopActivity];
}

@end
