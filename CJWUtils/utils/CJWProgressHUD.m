//
//  CJWProgressHUD.m
//  Coupon
//
//  Created by cen on 29/9/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "CJWProgressHUD.h"
#import <Foundation/Foundation.h>

@implementation CJWProgressHUD

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(CJWProgressHUD *)showTemporaryAt:(UIView *)view text:(NSString *)text{
    CJWProgressHUD *hud = [CJWProgressHUD showDefaultAt:view text:text];
    hud.mode = MBProgressHUDModeText;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [CJWProgressHUD hideHUDForView:view animated:YES];
    });
    return hud;
    
}

+(CJWProgressHUD *)showDefaultAt:(UIView *)view text:(NSString *)text{
    CJWProgressHUD *hud = [CJWProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = text;
    hud.animationType = MBProgressHUDAnimationFade;
    
    return hud;
}

@end

//UIView + CJWProgressHUD

@implementation UIView (CJWProgressHUD)

-(void)showHUDwith:(NSString *)text{
    [self hideAllHUD];
    [CJWProgressHUD showDefaultAt:self text:text];
}

-(void)showTemporary:(NSString *)text{
    [self hideAllHUD];
    [CJWProgressHUD showTemporaryAt:self text:text];
}

-(void)hideHUD{
    [CJWProgressHUD hideHUDForView:self animated:YES];
}

-(void)hideAllHUD{
    [CJWProgressHUD hideAllHUDsForView:self animated:YES];
}

-(void)showLoading{
    [self hideAllHUD];
    CJWProgressHUD *hud = [CJWProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"pls wait";
    hud.animationType = MBProgressHUDAnimationFade;

}

@end