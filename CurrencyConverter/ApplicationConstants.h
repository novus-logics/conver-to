
//#define NSLog(__FORMAT__, ...) TFLog((@"%s [Line %d] " __FORMAT__), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
//#define NSLog(__FORMAT__, ...) NSLog(@"")

#define CDocumentsFolder [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"]

#define IS_IPHONE_6L (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define FormatString(format, ...) [NSString stringWithFormat:format, ##__VA_ARGS__]

#define CUSERDEFAULTSUSERID @"UserDefaultsUserId"
#define CUSERTOKENID @"UserTokenId"
#define CMOMENTCACHED(Year) [NSString stringWithFormat:@"MomentChached%@",Year]
#define CLASTHISTORY @"lasthistory"
#define CDEFAULT_FROMCURRENCY @"fromCurrency"
#define CDEFAULT_TOCURRENCY @"toCurrency"
/*======== AppDelegate =========*/

#define appDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

/*======== Application =========*/

#define ISREMEMBER @"isrememberuniversity"
#define AUTHTOKEN  @"userToken"
#define DEVICETOKEN  @"deviceToken"
#define OBSERVERUPDATEDATA  @"observerupdatadata"
#define OBSERVERUPDATELOCATIONDATA  @"observerupdatalocationdata"

/*======== Color =========*/

#define CThemeColor       CRGB(102, 51, 153)

/*======== Custom Font =========*/

#define CFontHelviticaRegular(fontSize) [UIFont fontWithName:@"HelveticaNeue" size:fontSize]
#define CHelviticaNeueLight(fontSize) [UIFont fontWithName:@"HelveticaNeue-Light" size:fontSize]
#define CHelviticaNeueMedium(fontSize) [UIFont fontWithName:@"HelveticaNeue-Medium" size:fontSize]
#define CHelviticaNeueBold(fontSize) [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize]

//#define AVENIRNEXTLTPROCONDENSED(fontSize) [UIFont fontWithName:@"AvenirNextLTPro-Cn" size:fontSize]
//#define AVENIRNEXTLTPROMEDIUMCONDENSED(fontSize) [UIFont fontWithName:@"AvenirNextLTPro-MediumCn" size:fontSize]
