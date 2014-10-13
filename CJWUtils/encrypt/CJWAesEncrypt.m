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
#define EMPTY_STRING @"BLANK"


#define Cencoding NSUTF8StringEncoding
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
        return EMPTY_STRING;
    }
    NSLog(@"data aesDecrypt");
    NSString *decrypted = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    return decrypted;
}

+(NSString *)aesDecrypt:(NSData *)encryptedData{
    return [self aesDecrypt:encryptedData key:PASSWORD];
}

@end


