//
//  CJWAesEncrypt.m
//  CJWUtils
//
//  Created by cen on 12/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "CJWAesEncrypt.h"
#import "RNEncryptor.h"
#import "RNDecryptor.h"
#import "AESCrypt.h"


#define PASSWORD @"ILOVEC+W"

@implementation CJWAesEncrypt

+(NSData *)aesEncrypt:(NSString *)plainText key:(NSString *)key{
    NSData *data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSData *encryptedData = [RNEncryptor encryptData:data withSettings:kRNCryptorAES256Settings password:key error:&error];
    return encryptedData;
}

+(NSData *)aesEncrypt:(NSString *)plainText{
    return [self aesEncrypt:plainText key:PASSWORD];
}

+(NSString *)aesDecrypt:(NSData *)encryptedData key:(NSString *)key{
    NSError *error;
    NSData *decryptedData = [RNDecryptor decryptData:encryptedData
                                        withPassword:key
                                               error:&error];
    if (error != nil) {
        return @"";
    }
    NSLog(@"here");
    NSString *decrypted = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    return decrypted;
}

+(NSString *)aesDecrypt:(NSData *)encryptedData{
    return [self aesDecrypt:encryptedData key:PASSWORD];
}

@end

@implementation NSString (CJWAesEncrypt)

-(NSData *)aesEncrypt{
    return [CJWAesEncrypt aesEncrypt:self];
}

-(NSData *)aesEncryptWithKey:(NSString *)key{
    return [CJWAesEncrypt aesEncrypt:self key:key];
}

-(NSString *)aesEncryptToString{
    return [AESCrypt encrypt:self password:PASSWORD];
}

-(NSString *)aesEncryptToStringWithKey:(NSString *)key{
    return [AESCrypt encrypt:self password:key];
}

-(NSString *)aesDecrypt{
    NSLog(@"str de");
    return [AESCrypt decrypt:self password:PASSWORD];
}

-(NSString *)aesDecryptWithKey:(NSString *)key{
    return [AESCrypt decrypt:self password:key];
}

@end

@implementation NSData (CJWAesEncrypt)

-(NSString *)aesDecrypt{
    NSLog(@"data de");
    return [CJWAesEncrypt aesDecrypt:self];
}

-(NSString *)aesDecryptWithKey:(NSString *)key{
    return [CJWAesEncrypt aesDecrypt:self key:key];
}

@end
