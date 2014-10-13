//
//  CJWCrypt.h
//  Pods
//
//  Created by cen on 13/10/14.
//
//

#import <Foundation/Foundation.h>

@interface CJWCrypt : NSObject


+ (NSData *)encryptWithAES:(NSString *)plainText;
+ (NSString *)decryptWithAES:(NSData *)encryptedData;

+ (NSData *)encryptWithAES:(NSString *)plainText key:(NSString *)key;
+ (NSString *)decryptWithAES:(NSData *)encryptedData  key:(NSString *)key;


+(NSString *)encryptToAESString:(NSString *)string;
+(NSString *)encryptToAESString:(NSString *)string withKey:(NSString *)key;

+(NSString *)decryptAESString:(NSString *)string;
+(NSString *)decryptAESString:(NSString *)string withKey:(NSString *)key;

@end


@interface NSString (CJWAesEncrypt)

-(NSData *)encryptWithAES;
-(NSData *)encryptWithAES:(NSString *)key;

-(NSString *)decryptWithAES;
-(NSString *)decryptWithAES:(NSString *)key;

-(NSString *)encryptToAESString;
-(NSString *)encryptToAESStringWithKey:(NSString *)key;

-(NSString *)decryptAESString;
-(NSString *)decryptAESStringWithKey:(NSString *)key;

@end

@interface NSData (CJWAesEncrypt)

-(NSString *)decryptWithAES;
-(NSString *)decryptWithAES:(NSString *)key;

@end