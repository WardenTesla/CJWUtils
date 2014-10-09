//
//  NSString+Validate.h
//  Album
//
//  Created by cen on 3/9/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)

-(BOOL)isValidateEmail:(NSString *)email;
-(BOOL)isValidateMobile:(NSString *)mobile;
-(BOOL)validateCarNo:(NSString *)carNo;
@end
