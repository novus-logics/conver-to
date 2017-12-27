//
//  PPLoader.h
//  CommonTester
//
//  Created by MIND INVENTORY on 10/12/12.
//  Copyright (c) 2012 MIND INVENTORY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface PPLoader : NSObject
{

    UIActivityIndicatorView *activityView;
    UIView *loadingView;
    MBProgressHUD *mhud;
}

@property (nonatomic, assign) NSUInteger LoaderCounter;
@property (nonatomic, assign) NSUInteger NetworkActivityIndicatorCounter;

+ (PPLoader *)sharedLoader;

-(void)setHudLoaderCustomView:(UIView *)view;

-(void)showLoaderWithType:(int)loaderType;
-(void)showLoaderWithType:(int)loaderType withText:(NSString *)string;
-(void)hideLoaderWithType:(int)loaderType;


- (void)start;
- (void)stop;

-(void)ShowActivityIndicatorWithText:(NSString *)text;
-(void)HideActivityIndicator;
-(void)DestroyLoadingIndicator;

-(void)ShowHudLoaderWithText:(NSString *)text;
-(void)ShowHudLoader;
-(void)HideHudLoader;



+(void)roundView:(UIView *)view onCorner:(UIRectCorner)rectCorner radius:(float)radius;



@end



/*

 [[PPLoader sharedLoader] showLoaderWithType:0 withText:@"Searching"];

 [[PPLoader sharedLoader] hideLoaderWithType:0];


*/