//
//  CJWAesEncrypt.h
//  CJWUtils
//
//  Created by cen on 12/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJWAesEncrypt : NSObject


+ (NSData *)encrypt:(NSString *)plainText;
+ (NSString *)decrypt:(NSData *)encryptedData;

+ (NSData *)encrypt:(NSString *)plainText key:(NSString *)key;
+ (NSString *)decrypt:(NSData *)encryptedData  key:(NSString *)key;

@end


@interface NSString (CJWAesEncrypt)

-(NSData *)aesEncrypt;
-(NSData *)aesEncryptWithKey:(NSString *)key;

-(NSString *)aesEncryptToString;
-(NSString *)aesEncryptToStringWithKey:(NSString *)key;

-(NSString *)aesDecrypt;
-(NSString *)aesDecryptWithKey:(NSString *)key;

@end

@interface NSData (CJWAesEncrypt)

-(NSString *)aesDecrypt;
-(NSString *)aesDecryptWithKey:(NSString *)key;

@end