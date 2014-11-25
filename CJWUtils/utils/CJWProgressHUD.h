//
//  CJWProgressHUD.h
//  Coupon
//
//  Created by cen on 29/9/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "MBProgressHUD.h"

@interface CJWProgressHUD : MBProgressHUD


+(CJWProgressHUD *)showTemporaryAt:(UIView *)view text:(NSString *)text;
+(CJWProgressHUD *)showDefaultAt:(UIView *)view text:(NSString *)text;

@end



@interface UIView (CJWProgressHUD)

-(void)showHUDwith:(NSString *)text;
-(void)hideHUD;
-(void)showTemporary:(NSString *)text;
-(void)hideAllHUD;
-(void)showLoading;

@end