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

+(NSData *)aesEncrypt:(NSString *)plainText key:(NSString *)key{
    NSData *data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSData *encryptedData = [RNEncryptor encryptData:data withSettings:kRNCryptorAES256Settings password:key error:&error];
    return encryptedData;
}

+(NSData *)aesEncrypt:(NSString *)plainText{
    return [CJWCrypt aesEncrypt:plainText key:PASSWORD];
}

+(NSString *)aesDecrypt:(NSData *)encryptedData key:(NSString *)key{
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

+(NSString *)aesDecrypt:(NSData *)encryptedData{
    return [CJWCrypt aesDecrypt:encryptedData key:PASSWORD];
}

@end

@implementation NSString (CJWAesEncrypt)

-(NSData *)aesEncrypt{
    return [CJWCrypt aesEncrypt:self];
}

-(NSData *)aesEncryptWithKey:(NSString *)key{
    return [CJWCrypt aesEncrypt:self key:key];
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
    return [CJWCrypt aesDecrypt:self];
}

-(NSString *)aesDecryptWithKey:(NSString *)key{
    return [CJWCrypt aesDecrypt:self key:key];
}

@end
