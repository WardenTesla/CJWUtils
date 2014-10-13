//
//  CJWCrypt.m
//  Pods
//
//  Created by cen on 13/10/14.
//
//

#import "CJWCrypt.h"

#define PASSWORD @"ILOVEC+W"
#import "RNEncryptor.h"
#import "RNDecryptor.h"
#import "AESCrypt.h"

@implementation CJWCrypt

+(NSData *)encryptWithAES:(NSString *)plainText key:(NSString *)key{
    NSData *data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSData *encryptedData = [RNEncryptor encryptData:data withSettings:kRNCryptorAES256Settings password:key error:&error];
    return encryptedData;
}

+(NSData *)encryptWithAES:(NSString *)plainText{
    return [self encryptWithAES:plainText key:PASSWORD];
}

+(NSString *)decryptWithAES:(NSData *)encryptedData key:(NSString *)key{
    NSError *error;
    NSData *decryptedData = [RNDecryptor decryptData:encryptedData
                                        withPassword:key
                                               error:&error];
    if (decryptedData == nil) {
        return @"blank";
    }
    NSLog(@"here");
    NSString *decrypted = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    return decrypted;
}

+(NSString *)decryptWithAES:(NSData *)encryptedData{
    return [self decryptWithAES:encryptedData key:PASSWORD];
}

+(NSString *)encryptToAESString:(NSString *)string{
    return [AESCrypt encrypt:string password:PASSWORD];
}

+(NSString *)encryptToAESString:(NSString *)string withKey:(NSString *)key{
    return [AESCrypt encrypt:string password:key];
}

+(NSString *)decryptAESString:(NSString *)string{
    return [AESCrypt decrypt:string password:PASSWORD];
}

+(NSString *)decryptAESString:(NSString *)string withKey:(NSString *)key{
    return [AESCrypt decrypt:string password:key];
}

@end

@implementation NSString (CJWAesEncrypt)

-(NSData *)encryptWithAES{
    return [CJWCrypt encryptWithAES:self];
}

-(NSData *)encryptWithAES:(NSString *)key{
    return [CJWCrypt encryptWithAES:self key:key];
}

-(NSString *)decryptWithAES{
    return [CJWCrypt decryptAESString:self];
}

-(NSString *)decryptWithAES:(NSString *)key{
    return [CJWCrypt decryptAESString:self withKey:key];
}

-(NSString *)encryptToAESString{
    return [CJWCrypt encryptToAESString:self];
}

-(NSString *)encryptToAESStringWithKey:(NSString *)key{
    return [CJWCrypt encryptToAESString:self withKey:key];
}

-(NSString *)decryptAESString{
    return [CJWCrypt decryptAESString:self];
}

-(NSString *)decryptAESStringWithKey:(NSString *)key{
    return [CJWCrypt decryptAESString:self withKey:key];
}

@end

@implementation NSData (CJWAesEncrypt)


-(NSString *)decryptWithAES{
    return [CJWCrypt decryptWithAES:self];
}

-(NSString *)decryptWithAES:(NSString *)key{
    return [CJWCrypt decryptWithAES:self key:key];
}

@end

