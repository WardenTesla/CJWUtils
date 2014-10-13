//
//  CJWCrypt.h
//  Pods
//
//  Created by cen on 13/10/14.
//
//

#import <Foundation/Foundation.h>

@interface CJWCrypt : NSObject


+ (NSData *)aesEncrypt:(NSString *)plainText;
+ (NSString *)aesDecrypt:(NSData *)encryptedData;

+ (NSData *)aesEncrypt:(NSString *)plainText key:(NSString *)key;
+ (NSString *)aesDecrypt:(NSData *)encryptedData  key:(NSString *)key;

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