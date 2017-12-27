//
//  SuperViewController.m
//  ChamRDV
//
//  Created by mac-0005 on 12/21/13.
//  Copyright (c) 2013 MIND INVENTORY. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()

@end
@implementation SuperViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.topItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [[UINavigationBar appearance] setTintColor:CRGB(255, 255, 255)];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:CRGB(255, 255, 255),NSForegroundColorAttributeName,CFontHelviticaRegular(18), NSFontAttributeName,nil]];
    
    self.navigationController.navigationBar.translucent = NO;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
//    [[IQKeyboardManager sharedManager] resignFirstResponder];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
//    [[SDImageCache sharedImageCache] clearMemory];
//    [[SDImageCache sharedImageCache] clearDisk];
    [super didReceiveMemoryWarning];
}

@end
