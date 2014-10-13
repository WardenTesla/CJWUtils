//
//  CJWUserManager.m
//  CJWUtils
//
//  Created by cen on 11/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "CJWUserManager.h"
#import "CJWDesEncrypt.h"
#import "CJWCacheUtils.h"
#import "CJWCrypt.h"

#define EMPTY_STRING  @"blank";

@interface CJWUserManager (){
    NSString *userAccount;
    NSUserDefaults *userDefault;
}

 

@end

@implementation CJWUserManager

-(NSString *)getSaveKey:(NSString *)key{
    NSString *saveKey = [[NSString stringWithFormat:@"%@%@",userAccount,key] encryptToAESString];
    return saveKey;
}

-(void)saveDefault:(NSString *)object forKey:(NSString *)key{
    NSString *saveKey = [self getSaveKey:key];
//    NSLog(@"\n%@\n%@",saveKey,[object aesEncrypt]);
    id enc = [object encryptWithAES];
    NSLog(@"%@",enc);
    [userDefault setObject:enc forKey:saveKey];
}

-(NSString *)getDefaultByKey:(NSString *)key{
    NSString *saveKey = [self getSaveKey:key];
    id object = [userDefault objectForKey:saveKey];
    if (object != nil) {
        if ([object isKindOfClass:[NSData class]]) {
            NSLog(@"data");
            NSData *dataData = object;
            return [dataData decryptWithAES];
        }
        if ([object isKindOfClass:[NSString class]]) {
            NSLog(@"str");
            NSString *strData = object;
            return [strData decryptWithAES];
        }
        NSLog(@"nothing");
        return [object decryptWithAES];
    }else{
        return EMPTY_STRING;
    }
}

-(instancetype)init{
    userDefault = [NSUserDefaults standardUserDefaults];
    userAccount = [userDefault objectForKey:@"account"];
    return self;
}

-(instancetype)initWithAccount:(NSString *)account{
    userDefault = [NSUserDefaults standardUserDefaults];
    userAccount = account.encrypt;
    [userDefault setObject:userAccount forKey:@"account"];
    return self;
}

//+(CJWUserManager *)manager{
//    static dispatch_once_t pred = 0;
//    static CJWUserManager *manager = nil;
//    dispatch_once(&pred,
//                  ^{
//                      manager = [[CJWUserManager alloc] init];
//                  });
//    return manager;
//}

-(NSString *)phoneNumber{
    NSString *phoneNumber = [self getDefaultByKey:@"phone"];
    return phoneNumber;
}

-(void)setPhoneNumber:(NSString *)phoneNumber{
    [self saveDefault:phoneNumber forKey:@"phone"];
}

-(void)setNickName:(NSString *)nickName{
    [self saveDefault:nickName forKey:@"nickName"];
}

-(NSString *)nickName{
    return [self getDefaultByKey:@"nickName"];
}

-(NSString *)password{
    return [self getDefaultByKey:@"password"];
}

-(void)setPassword:(NSString *)password{
    [self saveDefault:password forKey:@"password"];
}

@end
