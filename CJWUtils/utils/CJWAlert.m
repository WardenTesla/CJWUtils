//
//  CJWAlert.m
//  Album
//
//  Created by cen on 3/6/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "CJWAlert.h"

@interface CJWAlert()<UIAlertViewDelegate>{
}
@end

@implementation CJWAlert

@synthesize cjwCallback;

//(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
+(void)showWithTitle:(NSString *)title message:(NSString *)message style:(CJWAlertStyle)style callback:(CJWCB)callback{
    [[CJWAlert alert] showWithTitle:title message:message style:style alertStyle:UIAlertViewStyleDefault callback:callback];
}

+(void)showWithTitle:(NSString *)title message:(NSString *)message style:(CJWAlertStyle)style alertStyle:(UIAlertViewStyle)alertStyle callback:(CJWCB)callback{
    [[CJWAlert alert] showWithTitle:title message:message style:style alertStyle:alertStyle callback:callback];
}

+(void)showWithTitle:(NSString *)title message:(NSString *)message button0:(NSString *)button0 button1:(NSString *)button1 style:(CJWAlertStyle)style alertStyle:(UIAlertViewStyle)alertStyle callback:(CJWCB)callback{
    [[CJWAlert alert] showWithTitle:title message:message button0:button0 button1:button1 style:style alertStyle:alertStyle callback:callback];
}

+(void)showWithTitle:(NSString *)title message:(NSString *)message button0:(NSString *)button0 button1:(NSString *)button1 callback:(CJWCB)callback{
    [[CJWAlert alert] showWithTitle:title message:message button0:button0 button1:button1 callback:callback];
}

+(void)showWithTitle:(NSString *)title message:(NSString *)message button0:(NSString *)button0 callback:(CJWCB)callback{
    [[CJWAlert alert] showWithTitle:title message:message button0:button0 callback:callback];
}

-(void)showWithTitle:(NSString *)title message:(NSString *)message style:(CJWAlertStyle)style alertStyle:(UIAlertViewStyle)alertStyle callback:(CJWCB)callback{
    cjwCallback = [callback copy];
    UIAlertView *alert;
    if (alertStyle == UIAlertViewStyleSecureTextInput) {
        style = CJWAlertStyleConfirmCancel;
    }
    switch (style) {
        case CJWAlertStyleConfirmCancel:
            alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            break;
        case CJWAlertStyleOnlyConfirm:
            alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            break;
        default:
            break;
    }
    [alert setAlertViewStyle:alertStyle];
    [alert show];
}

-(void)showWithTitle:(NSString *)title message:(NSString *)message button0:(NSString *)button0 button1:(NSString *)button1 callback:(CJWCB)callback{
    [self showWithTitle:title message:message button0:button0 button1:button1 style:CJWAlertStyleConfirmCancel alertStyle:UIAlertViewStyleDefault callback:callback];
}

-(void)showWithTitle:(NSString *)title message:(NSString *)message button0:(NSString *)button0 callback:(CJWCB)callback{
    [self showWithTitle:title message:message button0:button0 button1:@"" style:CJWAlertStyleOnlyConfirm alertStyle:UIAlertViewStyleDefault callback:callback];
}


-(void)showWithTitle:(NSString *)title message:(NSString *)message button0:(NSString *)button0 button1:(NSString *)button1 style:(CJWAlertStyle)style alertStyle:(UIAlertViewStyle)alertStyle callback:(CJWCB)callback{
    cjwCallback = [callback copy];
    UIAlertView *alert;
    if (alertStyle == UIAlertViewStyleSecureTextInput) {
        style = CJWAlertStyleConfirmCancel;
    }
    switch (style) {
        case CJWAlertStyleConfirmCancel:
            alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:button0 otherButtonTitles:button1, nil];
            break;
        case CJWAlertStyleOnlyConfirm:
            alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:button0 otherButtonTitles: nil];
            break;
        default:
            break;
    }
    [alert setAlertViewStyle:alertStyle];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    cjwCallback(buttonIndex,alertView);
}

+(CJWAlert *)alert{
    static dispatch_once_t pred = 0;
    static CJWAlert *alert = nil;
    dispatch_once(&pred,
                  ^{
                      alert = [[CJWAlert alloc] init];
                  });
    return alert;
}
@end
