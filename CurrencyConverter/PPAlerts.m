//
//  PPAlerts.m
//  CommonTester
//
//  Created by MIND INVENTORY on 11/8/12.
//  Copyright (c) 2012 MIND INVENTORY. All rights reserved.
//

#import "PPAlerts.h"
#import "FDStatusBarNotifierView.h"
#import "TKAlertCenter.h"
#import "WToast.h"
#import "KGDiscreetAlertView.h"

static PPAlerts *sharedAlert = nil;

@implementation PPAlerts

+ (PPAlerts *)sharedAlerts
{
	if (sharedAlert == nil) {
		sharedAlert = [[PPAlerts alloc] init];
	}
	return sharedAlert;
}

#pragma mark - Alerts

-(void)showAlertWithType:(AlertType)alertType withMessage:(NSString *)message
{
    [self showAlertWithType:alertType withMessage:message withTitle:nil];
}

-(void)showAlertWithType:(AlertType)alertType withMessage:(NSString *)message withTitle:(NSString *)title
{
    [self showAlertWithType:alertType withMessage:message withTitle:title withTimeoutImterval:2.0];
}

-(void)showAlertWithType:(AlertType)alertType withMessage:(NSString *)message withTitle:(NSString *)title withTimeoutImterval:(NSTimeInterval)interval
{
    NSString *msg;
    
    if (!title)
        msg=message;
    else if (!message)
        msg=title;
    else
        msg=[NSString stringWithFormat:@"%@\n%@",title,message];
    
    switch (alertType)
    {
        case AlertTypeDefault:
            [self iOsAlert:title withmessage:message withDelegate:nil];
            break;
        case AlertTypeStatusBar:
            [self statusBarAlert:msg withTimeoutImterval:interval withDelegate:nil];
            break;
        case AlertTypeTapku:
            [self tapkuAlert:msg withImage:nil];
            break;
        case AlertTypeToast:
            [self ToastAlert:msg withTimeoutImterval:interval];
            break;
        case AlertTypeDiscrete:
            [self DiscreteAlert:msg inView:[[UIApplication sharedApplication] keyWindow] maxWidth:500 delay:interval];
            break;
    }
}



-(void)iOsAlert:(NSString *)title withmessage:(NSString *)message withDelegate:(id)delegate
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
}

-(void)statusBarAlert:(NSString *)message withTimeoutImterval:(NSTimeInterval)interval withDelegate:(id)delegate
{
    FDStatusBarNotifierView *notifierView = [[FDStatusBarNotifierView alloc] initWithMessage:message delegate:delegate];
    notifierView.timeOnScreen = interval;
    [notifierView showInWindow:[[UIApplication sharedApplication] keyWindow]];
}

-(void)tapkuAlert:(NSString *)message withImage:(UIImage *)image
{
    [[TKAlertCenter defaultCenter] postAlertWithMessage:message image:image];
}

-(void)ToastAlert:(NSString *)message withTimeoutImterval:(NSTimeInterval)interval
{
    [WToast showWithText:message length:interval];
}

-(void)DiscreteAlert:(NSString *)message inView:(UIView *)view maxWidth:(CGFloat)maxWidth delay:(NSTimeInterval)delay
{
    [KGDiscreetAlertView showDiscreetAlertWithText:message inView:view maxWidth:maxWidth delay:delay];
}


@end
