//
//  PPLoader.m
//  CommonTester
//
//  Created by MIND INVENTORY on 10/12/12.
//  Copyright (c) 2012 MIND INVENTORY. All rights reserved.
//

#import "PPLoader.h"

#import "NSObject+NewProperty.h"

static PPLoader *sharedLoader = nil;
#define LoadingText @"Loading..."

@interface PPLoader ()
{
    UIView *cusotmView;
}
@end


@implementation PPLoader

@synthesize LoaderCounter,NetworkActivityIndicatorCounter;

+(void)roundView:(UIView *)view onCorner:(UIRectCorner)rectCorner radius:(float)radius
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    [view.layer setMask:maskLayer];
}


+ (PPLoader *)sharedLoader {
	if (sharedLoader == nil) {
		sharedLoader = [[PPLoader alloc] init];
	}
	return sharedLoader;
}

-(void)setHudLoaderCustomView:(UIView *)view
{
    cusotmView = view;
}

//- (id)init {
//    
//	if (self = [super init]) {
//		LoaderCounter = 0;
//        NetworkActivityIndicatorCounter=0;
//	}
//	return self;
//}

#pragma mark - Common Methods For Loaders

-(void)showLoaderWithType:(int)loaderType
{
    [self showLoaderWithType:loaderType withText:LoadingText];
}

-(void)showLoaderWithType:(int)loaderType withText:(NSString *)string
{
    switch (loaderType)
    {
        case 0:
            [self start];
            break;
        case 1:
        {
            if (LoaderCounter==0)
                [self ShowActivityIndicatorWithText:string];
            
            LoaderCounter++;
        }
            break;
        case 2:
            [self ShowHudLoaderWithText:string];
            break;
    }
    
}

-(void)hideLoaderWithType:(int)loaderType
{
    switch (loaderType)
    {
        case 0:
            [self stop];
            break;
        case 1:
            [self HideActivityIndicator];
            break;
        case 2:
            [self HideHudLoader];
            break;
    }
}



#pragma mark - Default StatusBar Network Indicator


- (void)start {
	if (NetworkActivityIndicatorCounter == 0)
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

	NetworkActivityIndicatorCounter++;
}

- (void)stop {
    
    if (NetworkActivityIndicatorCounter>0)
        NetworkActivityIndicatorCounter--;

	if (NetworkActivityIndicatorCounter == 0)
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


#pragma mark - Loader at Center



-(void)ShowActivityIndicatorWithText:(NSString *)text
{
    if(loadingView != nil) {
		[self DestroyLoadingIndicator];
	}

    
    {
        if (![[UIDevice currentDevice] userInterfaceIdiom])
            loadingView = [[UIView alloc] initWithFrame:CGRectMake(100, 230, 120, 40)];
        else
            loadingView = [[UIView alloc] initWithFrame:CGRectMake(324, 492, 120, 40)];
        
        activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        CGRect frame = activityView.frame;
        frame.origin.x = 10;
        frame.origin.y = 10;
        activityView.frame = frame;
        
        
        [loadingView addSubview:activityView];
        loadingView.backgroundColor = [UIColor colorWithWhite:0 alpha:.8];
        
        UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(40,0,80,40)];
        loadingLabel.backgroundColor = [UIColor clearColor];
        loadingLabel.textColor = [UIColor whiteColor];
        loadingLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        loadingLabel.text = text;
        [loadingView addSubview:loadingLabel];
        [activityView startAnimating];
        
        [[[UIApplication sharedApplication] keyWindow] addSubview:loadingView];
    }
}


-(void)HideActivityIndicator
{
    if (LoaderCounter>0)
        LoaderCounter--;
    else
        LoaderCounter=0;
    
    
	if (LoaderCounter == 0)
    {
        [activityView stopAnimating];
        
        [self DestroyLoadingIndicator];
        [UIView beginAnimations:@"hideLoadingLabel" context:nil];
        [UIView setAnimationDuration:.8];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView commitAnimations];
    }
}

-(void)DestroyLoadingIndicator
{
	if (loadingView != nil) {
		[loadingView removeFromSuperview];
		loadingView = nil;
	}
}




#pragma mark - HUD Loader

-(void)ShowHudLoaderWithText:(NSString *)text
{
    mhud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
    
    if (cusotmView)
    {
        mhud.customView = cusotmView;
        mhud.mode = MBProgressHUDModeCustomView;
    }

    mhud.labelText = text;
}

-(void)ShowHudLoader
{
        [self ShowHudLoaderWithText:LoadingText];
}

-(void)HideHudLoader
{
//    [MBProgressHUD hideHUDForView:appDelegate.window animated:YES];
    
    if (![MBProgressHUD hideHUDForView:[[UIApplication sharedApplication] keyWindow] animated:YES])
    {
        if (mhud)
        {
            mhud.removeFromSuperViewOnHide = YES;
            [mhud hide:YES];
        }
    }
}

@end
