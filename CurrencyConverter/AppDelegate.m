//
//  AppDelegate.m
//  CurrencyConverter
//
//  Created by Novus Logics on 03/09/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Add IQKeyboardManager
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
    
    CurrencyVC *currencyVC = [[CurrencyVC alloc] initWithNibName:@"CurrencyVC" bundle:nil];
    SuperNavigationController *superVC = [[SuperNavigationController alloc] initWithRootViewController:currencyVC];
    self.window.rootViewController = superVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Helper Mehtod
#pragma mark

+ (void)downloadDataFromURL:(NSURL *)url withCompletionHandler:(void (^)(NSData *))completionHandler{
    // Instantiate a session configuration object.
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Instantiate a session object.
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    // Create a data task object to perform the data downloading.
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error != nil) {
            // If any error occurs then just display its description on the console.
            NSLog(@"%@", [error localizedDescription]);
        }
        else{
            // If no error occurs, check the HTTP status code.
            NSInteger HTTPStatusCode = [(NSHTTPURLResponse *)response statusCode];
            
            // If it's other than 200, then show it on the console.
            if (HTTPStatusCode != 200) {
                NSLog(@"HTTP status code = %ld", (long)HTTPStatusCode);
            }
            
            // Call the completion handler with the returned data on the main thread.
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                completionHandler(data);
            }];
        }
    }];
    
    // Resume the task.
    [task resume];
}

- (bool)isNumeric:(NSString*)checkText {
    return [[NSScanner scannerWithString:checkText] scanFloat:NULL];
}

- (MKUnit *)getMassUnit:(NSString *)strCode
{
    MKUnit *getMassUnit;
    
    SWITCH (strCode) {
        CASE (@"gr") {
            getMassUnit = [MKMassUnit grain];
            break;
        }
        CASE (@"dr") {
            getMassUnit = [MKMassUnit drachm];
            break;
        }
        CASE (@"oz") {
            getMassUnit = [MKMassUnit ounce];
            break;
        }
        CASE (@"lb") {
            getMassUnit = [MKMassUnit pound];
            break;
        }
        CASE (@"st") {
            getMassUnit = [MKMassUnit stone];
            break;
        }
        CASE (@"qtr") {
            getMassUnit = [MKMassUnit quarter];
            break;
        }
        CASE (@"cwt") {
            getMassUnit = [MKMassUnit hundredweight];
            break;
        }
        CASE (@"t") {
            getMassUnit = [MKMassUnit ton];
            break;
        }
        CASE (@"mg") {
            getMassUnit = [MKMassUnit milligram];
            break;
        }
        CASE (@"g") {
            getMassUnit = [MKMassUnit gram];
            break;
        }
        CASE (@"dag") {
            getMassUnit = [MKMassUnit decagram];
            break;
        }
        CASE (@"kg") {
            getMassUnit = [MKMassUnit kilogram];
            break;
        }
        CASE (@"Mg") {
            getMassUnit = [MKMassUnit megagram];
            break;
        }
        CASE (@"hg") {
            getMassUnit = [MKMassUnit hectogram];
            break;
        }
        // Volume
        CASE (@"US gal") {
            getMassUnit = [MKVolumeUnit us_gallon];
            break;
        }
        CASE (@"US qt") {
            getMassUnit = [MKVolumeUnit us_quart];
            break;
        }
        CASE (@"US pt") {
            getMassUnit = [MKVolumeUnit us_pint];
            break;
        }
        CASE (@"US cp") {
            getMassUnit = [MKVolumeUnit us_cup];
            break;
        }
        CASE (@"US fl oz") {
            getMassUnit = [MKVolumeUnit us_fluidounce];
            break;
        }
        CASE (@"US tbsp") {
            getMassUnit = [MKVolumeUnit us_tablespoon];
            break;
        }
        CASE (@"US tsp") {
            getMassUnit = [MKVolumeUnit us_teaspoon];
            break;
        }
        CASE (@"l") {
            getMassUnit = [MKVolumeUnit litre];
            break;
        }
        CASE (@"ml") {
            getMassUnit = [MKVolumeUnit millilitre];
            break;
        }
        CASE (@"gal") {
            getMassUnit = [MKVolumeUnit gallon];
            break;
        }
        CASE (@"qt") {
            getMassUnit = [MKVolumeUnit quart];
            break;
        }
        CASE (@"pt") {
            getMassUnit = [MKVolumeUnit pint];
            break;
        }
        CASE (@"cp") {
            getMassUnit = [MKVolumeUnit cup];
            break;
        }
        CASE (@"fl oz") {
            getMassUnit = [MKVolumeUnit fluidounce];
            break;
        }
        CASE (@"tbsp") {
            getMassUnit = [MKVolumeUnit tablespoon];
            break;
        }
        CASE (@"tsp") {
            getMassUnit = [MKVolumeUnit teaspoon];
            break;
        }
        DEFAULT {
            break;
        }
    }
    
    return getMassUnit;
}

@end
