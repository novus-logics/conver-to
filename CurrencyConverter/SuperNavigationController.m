//
//  SuperNavigationController.m
//  ChamRDV
//
//  Created by Novus Logics on 12/17/13.
//  Copyright (c) 2013 MIND INVENTORY. All rights reserved.
//

#import "SuperNavigationController.h"

@interface SuperNavigationController ()

@end

@implementation SuperNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
       
    
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back"]];
    
    //[[UINavigationBar appearance] setBarTintColor:CRGBA(0, 129, 160, 1)];
    [[UINavigationBar appearance] setBarTintColor:CThemeColor];

    
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    
    [self.navigationBar setTintColor:CRGB(255, 255, 255)];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:CRGB(255, 255, 255),NSForegroundColorAttributeName,CFontHelviticaRegular(18), NSFontAttributeName,nil]];
    
    self.navigationBar.translucent = NO;
 
    self.navigationController.navigationBar.topItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self preferredStatusBarStyle];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
   // [[UINavigationBar appearance] setBackgroundImage:[self imageWithColor:CRGB(0, 129, 160)] forBarMetrics:UIBarMetricsDefault];
    //[[UINavigationBar appearance] setShadowImage:[self imageWithColor:CRGB(0, 129, 160)]];
    
    [[UINavigationBar appearance] setBackgroundImage:[self imageWithColor:CThemeColor] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[self imageWithColor:CThemeColor]];

}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/// # MI-r5
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    for (UIViewController *viewController in [self viewControllers])
    {
        if ([viewController canPerformAction:@selector(navigationControllerDidDisappear) withSender:nil])
            [viewController performSelector:@selector(navigationControllerDidDisappear)];
    }
    [self navigationControllerDidDisappear];
}

/// # MI-r5
-(void)navigationControllerDidDisappear
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)showMenu
{
//    [kMainViewController showLeftViewAnimated:YES completionHandler:nil];
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
