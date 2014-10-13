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
@property (nonatomic,weak) NSString *myAccount;

+(CJWUserManager *)manager;

-(NSString *)getDefaultByKey:(NSString *)key;
-(void)saveDefault:(NSString *)object forKey:(NSString *)key;

+(void)cleanUserInfomation;
-(void)logout;
-(void)login:(NSString *)account;

@end
