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
#define ACCOUNT_KEY [@"account" encryptToAESString]
#define PASSWORD_KEY [@"password" encryptToAESString]

#define PHONE @"phone"
#define NICK_NAME @"nickName"
#define PASSWORD @"password"

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
//    NSLog(@"save %@",saveKey);
    id encrypt = [object encryptWithAES];
    [userDefault setObject:encrypt forKey:saveKey];
}

-(NSString *)getDefaultByKey:(NSString *)key{
    NSString *saveKey = [self getSaveKey:key];
    id object = [userDefault objectForKey:saveKey];
    if (object != nil) {
        if ([object isKindOfClass:[NSData class]]) {
            NSData *dataData = object;
            return [dataData decryptWithAES];
        }
        if ([object isKindOfClass:[NSString class]]) {
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
    userAccount = [userDefault objectForKey:ACCOUNT_KEY];
    return self;
}

-(instancetype)initWithAccount:(NSString *)account{
//    NSLog(@"%@",ACCOUNT_KEY);
    userDefault = [NSUserDefaults standardUserDefaults];
    [self login:account];
    return self;
}



+(CJWUserManager *)manager{
    static dispatch_once_t pred = 0;
    static CJWUserManager *manager = nil;
    dispatch_once(&pred,
                  ^{
                      manager = [[CJWUserManager alloc] init];
                  });
    return manager;
}

-(NSString *)phoneNumber{
    return [self getDefaultByKey:PHONE];
}

-(void)setPhoneNumber:(NSString *)phoneNumber{
    [self saveDefault:phoneNumber forKey:PHONE];
}

-(NSString *)nickName{
    return [self getDefaultByKey:NICK_NAME];
}

-(void)setNickName:(NSString *)nickName{
    [self saveDefault:nickName forKey:NICK_NAME];
}

-(NSString *)password{
    return [self getDefaultByKey:PASSWORD];
}

-(void)setPassword:(NSString *)password{
    [self saveDefault:password forKey:PASSWORD];
}

-(NSString *)myAccount{
    id account = [userAccount decryptAESString];
    if (account == nil) {
        return EMPTY_STRING;
    }
    return account;
}

-(void)setMyAccount:(NSString *)myAccount{
    return;
}

+(void)cleanUserInfomation{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

-(void)logout{
    [userDefault removeObjectForKey:[userAccount encryptToAESString]];
    userAccount = EMPTY_STRING;
    [CJWUserManager cleanUserInfomation];
}

-(void)login:(NSString *)account{
    userAccount = [account encryptToAESString];
    [userDefault setObject:userAccount forKey:ACCOUNT_KEY];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
}

@end
