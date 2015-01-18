//
//  CJWLoginManager.m
//  CJWUtils
//
//  Created by cen on 18/1/15.
//  Copyright (c) 2015 cen. All rights reserved.
//

#import "CJWLoginManager.h"
#import "UICKeyChainStore.h"
#import <UIKit/UIKit.h>

/*
 let PASSWORD = "PASSWORD"
 let ACCOUNT = "ACCOUNT"
 */
#define PASSWORD @"PASSWORD"
#define ACCOUNT @"ACCOUNT"
#define IS_LOGIN @"IS_LOGIN"
#define LOGINED @"YES"
#define NOT_LOGIN @"NO"

@implementation CJWLoginManager


+(instancetype)manager{
    static dispatch_once_t pred = 0;
    static id manager = nil;
    dispatch_once(&pred,
                  ^{
                      manager = [[self alloc] init];
                  });
    return manager;
}


+(BOOL)isLogin{
    NSString *isLogin = [UICKeyChainStore stringForKey:IS_LOGIN];
    if (isLogin == nil){
        return NO;
    }else{
        if ([isLogin isEqualToString:LOGINED]) {
            return YES;
        }else{
            return NO;
        }
    }
}


-(void)autoLogin{
    if ([CJWLoginManager isLogin]) {
        [self login];
    }else{
        NSLog(@"not login");
    }
}

-(void)login{
    NSLog(@"login");
}

+(void)loginSuccess{
    [UICKeyChainStore setString:LOGINED forKey:IS_LOGIN];
}

+(void)logout{
    [UICKeyChainStore setString:NOT_LOGIN forKey:IS_LOGIN];
    [UICKeyChainStore setString:@"" forKey:PASSWORD];
}

-(NSString *)account{
    NSString *account = [UICKeyChainStore stringForKey:ACCOUNT];
    if (account == nil){
        return account;
    }else{
        return @"";
    }
}

-(NSString *)password{
    NSString *password = [UICKeyChainStore stringForKey:PASSWORD];
    if (password == nil){
        return password;
    }else{
        return @"";
    }
}

+(void)initUserInfo{
    
    [UICKeyChainStore setString:@"" forKey:IS_LOGIN];
    [UICKeyChainStore setString:@"" forKey:ACCOUNT];
    [UICKeyChainStore setString:@"" forKey:PASSWORD];
    [UICKeyChainStore removeAllItems];

}

-(void)sendLogoutNotification{
    
    if ([CJWLoginManager isLogin]) {
        [CJWLoginManager logout];
        [CJWLoginManager showLoginViewController:@"Main" controller:@"Login"];
    }else{
    }
}

+(void)showLoginViewController:(NSString *)storyboardName controller:(NSString *)controller{
    /*
     var storyboard = UIStoryboard(name: "Main", bundle: nil)
     var login = storyboard.instantiateViewControllerWithIdentifier("Login") as LoginViewController
     UIApplication.sharedApplication().keyWindow?.rootViewController = login
     */
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *login = [storyboard instantiateViewControllerWithIdentifier:controller];
    [[UIApplication sharedApplication] keyWindow].rootViewController = login;
}

/*
 class func login(userName:NSString,password:NSString,success:CJWSuccessBlock,failure:CJWFailBlock){
 SchoolInterfaceManager.login(userName, password: password, success: { (resp) -> Void in
 success(resp)
 
 }) { () -> Void in
 failure()
 }
 }

 
 class func account() -> NSString {
 var account = UICKeyChainStore.stringForKey("ACCOUNT")
 if account != nil {
 return account;
 }else{
 return ""
 }
 }
 
 class func password() ->NSString{
 var password = UICKeyChainStore.stringForKey("PASSWORD")
 if password != nil {
 return password;
 }else{
 return ""
 }
 
 }
 
 
 class func initUserInfo(){
 UICKeyChainStore.setString("", forKey: "IS_LOGIN")
 UICKeyChainStore.setString("", forKey: "PASSWORD")
 UICKeyChainStore.setString("", forKey: "ACCOUNT")
 UICKeyChainStore.removeAllItems()
 //        println("initUserInfo [\(account())] [\(password())]")
 
 }
 
 class func sendLogoutNotification(){
 if isLogin() {
 logout()
 showLoginViewController()
 }else{
 println("not login ")
 }
 
 }
 
 class func showLoginViewController(){
 var storyboard = UIStoryboard(name: "Main", bundle: nil)
 var login = storyboard.instantiateViewControllerWithIdentifier("Login") as LoginViewController
 UIApplication.sharedApplication().keyWindow?.rootViewController = login
 
 }
 */

@end
