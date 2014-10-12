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

+(NSData *)encrypt:(NSString *)plainText key:(NSString *)key{
    NSData *data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSData *encryptedData = [RNEncryptor encryptData:data withSettings:kRNCryptorAES256Settings password:key error:&error];
    return encryptedData;
}

+(NSData *)encrypt:(NSString *)plainText{
    return [self encrypt:plainText key:PASSWORD];
}

+(NSString *)decrypt:(NSData *)encryptedData key:(NSString *)key{
    NSError *error;
    NSData *decryptedData = [RNDecryptor decryptData:encryptedData
                                        withPassword:key
                                               error:&error];
    if (error != nil) {
        return @"";
    }
    NSString *decrypted = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    return decrypted;
}

+(NSString *)decrypt:(NSData *)encryptedData{
    return [self decrypt:encryptedData key:PASSWORD];
}

@end

@implementation NSString (CJWAesEncrypt)

-(NSData *)aesEncrypt{
    return [CJWAesEncrypt encrypt:self];
}

-(NSData *)aesEncryptWithKey:(NSString *)key{
    return [CJWAesEncrypt encrypt:self key:key];
}

-(NSString *)aesEncryptToString{
    return [AESCrypt encrypt:self password:PASSWORD];
}

-(NSString *)aesEncryptToStringWithKey:(NSString *)key{
    return [AESCrypt encrypt:self password:key];
}

-(NSString *)aesDecrypt{
    return [AESCrypt decrypt:self password:PASSWORD];
}

-(NSString *)aesDecryptWithKey:(NSString *)key{
    return [AESCrypt decrypt:self password:key];
}

@end

@implementation NSData (CJWAesEncrypt)

-(NSString *)aesDecrypt{
    return [CJWAesEncrypt decrypt:self];
}

-(NSString *)aesDecryptWithKey:(NSString *)key{
    return [CJWAesEncrypt decrypt:self key:key];
}

@end
