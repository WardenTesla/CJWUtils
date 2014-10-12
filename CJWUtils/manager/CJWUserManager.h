//
//  CJWUserManager.h
//  CJWUtils
//
//  Created by cen on 11/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJWUserManager : NSObject
-(instancetype)initWithAccount:(NSString *)account;

@property (nonatomic,weak) NSString *phoneNumber;
@property (nonatomic,weak) NSString *nickName;
@property (nonatomic,weak) NSString *password;


@end
