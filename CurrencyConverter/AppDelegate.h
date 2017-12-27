//
//  AppDelegate.h
//  CurrencyConverter
//
//  Created by Novus Logics on 03/09/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrencyVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (void)downloadDataFromURL:(NSURL *)url withCompletionHandler:(void(^)(NSData *data))completionHandler;
- (bool)isNumeric:(NSString*)checkText;
- (MKUnit *)getMassUnit:(NSString *)strCode;

@end

