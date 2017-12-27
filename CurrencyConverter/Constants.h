#import <CoreData/CoreData.h>

#ifndef asyncMain

#define asyncMain(block) {\
if([NSThread isMainThread])\
{\
block();\
}\
else\
{\
dispatch_async(dispatch_get_main_queue(), block);\
}\
};

#endif


#ifndef syncMain

#define syncMain(block) {\
if([NSThread isMainThread])\
{\
block();\
}\
else\
{\
dispatch_sync(dispatch_get_main_queue(), block);\
}\
};

#endif


//#define NSLog(__FORMAT__, ...) NSLogv([NSString stringWithFormat:@"[%@] [%@ %@] [Line %d] %@",[NSThread currentThread],NSStringFromClass([self class]), NSStringFromSelector(_cmd),__LINE__,[NSString stringWithFormat:(__FORMAT__), ##__VA_ARGS__]],nil)

#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT

#define GCDBackgroundThread dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define GCDBackgroundThreadHighPriority dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
#define GCDBackgroundThreadLowPriority dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
#define GCDMainThread dispatch_get_main_queue()

#define IosFullVersion [[UIDevice currentDevice] systemVersion]
#define IosVersion ((NSUInteger)[[[UIDevice currentDevice] systemVersion] doubleValue])
#define IS_Ios9 (((NSUInteger)[[[UIDevice currentDevice] systemVersion] doubleValue])>=9)
#define IS_Ios8 (((NSUInteger)[[[UIDevice currentDevice] systemVersion] doubleValue])>=8)
#define IS_Ios7 (((NSUInteger)[[[UIDevice currentDevice] systemVersion] doubleValue])==7)
#define IS_Ios6 (((NSUInteger)[[[UIDevice currentDevice] systemVersion] doubleValue])==6)
#define IS_Ios5 (((NSUInteger)[[[UIDevice currentDevice] systemVersion] doubleValue])==5)
#define IS_Ios4 (((NSUInteger)[[[UIDevice currentDevice] systemVersion] doubleValue])==4)
#define IS_Ios3 (((NSUInteger)[[[UIDevice currentDevice] systemVersion] doubleValue])==3)

#define DeviceModel [UIDevice platformString]
#define IS_IPHONE_SIMULATOR TARGET_IPHONE_SIMULATOR
#define IS_IPHONE ([[[UIDevice currentDevice] model] rangeOfString:@"iPhone"].location!=NSNotFound)
#define IS_IPOD   ([[[UIDevice currentDevice] model] rangeOfString:@"iPod"].location!=NSNotFound)
#define IS_IPAD   ([[[UIDevice currentDevice] model] rangeOfString:@"iPad"].location!=NSNotFound)
#define IS_HEIGHT_GTE_568 CScreenHeight >= 568.0f
#define IS_HEIGHT_LTE_568 CScreenHeight < 568.0f
#define IS_RETINA ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))
#define IS_RETINA_HD ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 3.0))
#define IS_IPHONE_6_PLUS (IS_SIZE_OF_IPHONE6PLUS || [DeviceModel isEqualToString:@"iPhone 6 Plus"])
#define IS_IPHONE_6 (IS_SIZE_OF_IPHONE6 || [DeviceModel isEqualToString:@"iPhone 6"])
#define IS_IPHONE_5 (( IS_IPHONE || IS_IPOD) && IS_HEIGHT_GTE_568 )
#define IS_IPHONE_4 (( IS_IPHONE || IS_IPOD) && IS_HEIGHT_LTE_568 && IS_RETINA)
#define IS_IPHONE_3 (( IS_IPHONE || IS_IPOD) && IS_HEIGHT_LTE_568 && !IS_RETINA)
#define IS_IPAD_2 (IS_IPAD && !IS_RETINA)
#define IS_IPAD_3 (IS_IPAD && IS_RETINA)

#define IS_SIZE_OF_IPHONE5 CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(640, 1136))
#define IS_SIZE_OF_IPHONE6PLUS CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(1242, 2208))
#define IS_SIZE_OF_IPHONE6PLUS_Zoomed CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(1125, 2001))
#define IS_SIZE_OF_IPHONE6 CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(750, 1334))




#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)





#define IS_CLASS_AVAILABLE(class) NSClassFromString(class)?1:0


#define CKeyboardHeightPortraitIPhone 216
#define CKeyboardHeightLandscapeIPhone 162
#define CKeyboardHeightPortraitIPad 264
#define CKeyboardHeightLandscapeIPad 352

#define CKeyboardHeightPortrait ( IS_IPHONE || IS_IPOD)?216:264
#define CKeyboardHeightLandscape ( IS_IPHONE || IS_IPOD)?162:352


#define CTableDefaultSepratorColor [UIColor colorWithRed:0.88 green:0.88 blue:0.88 alpha:1]




#define CBundleIdentifier [[NSBundle mainBundle] bundleIdentifier]
#define CBundleDictionary [[NSBundle  mainBundle] infoDictionary]
#define CVersionNumber [CBundleDictionary objectForKey:@"CFBundleShortVersionString"]
#define CBuildNumber [CBundleDictionary objectForKey:@"CFBundleVersion"]
#define CApplicationName [CBundleDictionary objectForKey:@"CFBundleDisplayName"]

#define CCachesDirectory [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"]
#define CDocumentsDirectory [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

#define CUserDefaults                        [NSUserDefaults standardUserDefaults]
#define CSharedApplication                   [UIApplication sharedApplication]
#define CBundle                              [NSBundle mainBundle]
#define CMainScreen                          [UIScreen mainScreen]
#define CShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define CHideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define CNetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x
#define CNavigationController                self.navigationController
#define CTabBarConrtoller                    self.tabBarController
#define CNavBar                              self.navigationController.navigationBar
#define CTabBar                              self.tabBarController.tabBar
#define CNavBarHeight                        self.navigationController.navigationBar.bounds.size.height
#define CTabBarHeight                        self.tabBarController.tabBar.bounds.size.height
#define CStatusBarHeight                     [UIApplication sharedApplication].statusBarFrame.size.height
#define CDefaultToolbarHeight                self.navigationController.navigationBar.frame.size.height

#define CScreenRect                          [[UIScreen mainScreen] bounds]
#define CScreenWidth                        [UIScreen mainScreen].bounds.size.width
#define CScreenHeight                       [UIScreen mainScreen].bounds.size.height
#define CScreenWidthLandscape               [UIScreen mainScreen].bounds.size.height
#define CScreenHeightLandscape              [UIScreen mainScreen].bounds.size.width
#define CScreenCenter                       CGPointMake(CScreenWidth/2,CScreenHeight/2)
#define CScreenCenterForLandscape           CGPointMake(CScreenHeight/2,CScreenWidth/2)


#define CSelfViewHeight                      self.view.bounds.size.height
#define CSelfViewWidth                       self.view.bounds.size.width
#define CViewWidth(v)                        v.frame.size.width
#define CViewHeight(v)                       v.frame.size.height
#define CViewX(v)                            v.frame.origin.x
#define CViewY(v)                            v.frame.origin.y
#define CRectX(f)                            f.origin.x
#define CRectY(f)                            f.origin.y
#define CRectWidth(f)                        f.size.width
#define CRectHeight(f)                       f.size.height

#define CViewSetWidth(v, w)                  [v setFrame:CGRectMake(CViewX(v), CViewY(v), w, CViewHeight(v))]
#define CViewSetHeight(v, h)                 [v setFrame:CGRectMake(CViewX(v), CViewY(v), CViewWidth(v), h)]
#define CViewSetX(v, x)                      [v setFrame:CGRectMake(x, CViewY(v), CViewWidth(v), CViewHeight(v))]
#define CViewSetY(v, y)                      [v setFrame:CGRectMake(CViewX(v), y, CViewWidth(v), CViewHeight(v))]
#define CViewSetSize(v, w, h)                [v setFrame:CGRectMake(CViewX(v), CViewY(v), w, h)]
#define CViewSetOrigin(v, x, y)              [v setFrame:CGRectMake(x, y, CViewWidth(v), CViewHeight(v))]
#define CViewSetXnWidth(v, x, w)             [v setFrame:CGRectMake(x, CViewY(v), w, CViewHeight(v))]
#define CViewSetYnHeight(v, y, h)            [v setFrame:CGRectMake(CViewX(v), y, CViewWidth(v), h)]


#define CRectSetWidth(f, w)                  CGRectMake(CRectX(f), CRectY(f), w, CRectHeight(f))
#define CRectSetHeight(f, h)                 CGRectMake(CRectX(f), CRectY(f), CRectWidth(f), h)
#define CRectSetX(f, x)                      CGRectMake(x, CRectY(f), CRectWidth(f), CRectHeight(f))
#define CRectSetY(f, y)                      CGRectMake(CRectX(f), y, CRectWidth(f), CRectHeight(f))
#define CRectSetSize(f, w, h)                CGRectMake(CRectX(f), CRectY(f), w, h)
#define CRectSetOrigin(f, x, y)              CGRectMake(x, y, CRectWidth(f), CRectHeight(f))

#define CRect(x, y, w, h)                    CGRectMake(x, y, w, h)
#define CDATE_COMPONENTS                     NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
#define CTIME_COMPONENTS                     NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
#define CRGB(r, g, b)                        [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define CRGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]



#define isClassAvailable(class) NSClassFromString(class)


#define CStringFromID(obj) [NSString stringWithFormat:@"%@",obj]
#define CStringFromInt(obj) [NSString stringWithFormat:@"%d",obj]
#define CStringFromFloat(obj) [NSString stringWithFormat:@"%f",obj]


typedef void (^MIBooleanResultBlock)(BOOL succeeded, NSError *error);
typedef void (^MIIntegerResultBlock)(NSUInteger number, NSError *error);
typedef void (^MIArrayResultBlock)(NSArray *objects, NSError *error);
typedef void (^MIObjectResultBlock)(NSManagedObject *object, NSError *error);
typedef void (^MISetResultBlock)(NSSet *channels, NSError *error);
typedef void (^MIDataResultBlock)(NSData *data, NSError *error);
typedef void (^MIDataStreamResultBlock)(NSInputStream *stream, NSError *error);
typedef void (^MIStringResultBlock)(NSString *string, NSError *error);
typedef void (^MIIdResultBlock)(id object, NSError *error);
typedef void (^MIVoidBlock)(void);
typedef void (^MIProgressBlock)(int percentDone);
typedef void (^MIIdResult1Block)(id object, NSUInteger tag);

