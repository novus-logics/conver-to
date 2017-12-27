//
//  PPAlerts.h
//  CommonTester
//
//  Created by MIND INVENTORY on 11/8/12.
//  Copyright (c) 2012 MIND INVENTORY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AlertType) {
    AlertTypeDefault          = 0,
    AlertTypeStatusBar,
    AlertTypeTapku,
    AlertTypeToast,
    AlertTypeDiscrete,
};


@interface PPAlerts : NSObject
{
}


+(PPAlerts *)sharedAlerts;

-(void)showAlertWithType:(AlertType)alertType withMessage:(NSString *)message;
-(void)showAlertWithType:(AlertType)alertType withMessage:(NSString *)message withTitle:(NSString *)title;
-(void)showAlertWithType:(AlertType)alertType withMessage:(NSString *)message withTitle:(NSString *)title withTimeoutImterval:(NSTimeInterval)interval;


-(void)iOsAlert:(NSString *)title withmessage:(NSString *)message withDelegate:(id)delegate;
-(void)statusBarAlert:(NSString *)message withTimeoutImterval:(NSTimeInterval)interval withDelegate:(id)delegate;
-(void)tapkuAlert:(NSString *)message withImage:(UIImage *)image;
-(void)ToastAlert:(NSString *)message withTimeoutImterval:(NSTimeInterval)interval;
-(void)DiscreteAlert:(NSString *)message inView:(UIView *)view maxWidth:(CGFloat)maxWidth delay:(NSTimeInterval)delay;

@end

