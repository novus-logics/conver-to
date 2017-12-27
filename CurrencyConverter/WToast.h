/**
 * @class WToast
 */

#import <UIKit/UIKit.h>

#define RGB(a, b, c) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:1.0f]
#define RGBA(a, b, c, d) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:d]

typedef enum {
	kWTShort = 1,
	kWTLong = 5
} WToastLength;

@interface WToast : UIView

+ (void)showWithText:(NSString *)text;
+ (void)showWithImage:(UIImage *)image;

+ (void)showWithText:(NSString *)text length:(WToastLength)length;
+ (void)showWithImage:(UIImage *)image length:(WToastLength)length;

// MI
+ (void)showWithText:(NSString *)text length:(WToastLength)length backgroundcolor:(UIColor *)backgroundColor textColor:(UIColor *)textColor;

@end



/*

 - (IBAction)showShortMessage {
 [self.textField resignFirstResponder];
 NSString *text = self.textField.text;
 if (!text || ![text length]) {
 text = @"No text!";
 }
 [WToast showWithText:text];
 }
 
 - (IBAction)showLongMessage {
 [self.textField resignFirstResponder];
 NSString *text = self.textField.text;
 if (!text || ![text length]) {
 text = @"No text!";
 }
 [WToast showWithText:text length:kWTLong];
 }
 
 - (IBAction)showShortImage {
 [WToast showWithImage:[UIImage imageNamed:@"test.png"]];
 }
 
 - (IBAction)showLongImage {
 [WToast showWithImage:[UIImage imageNamed:@"test.png"] length:kWTLong];
 }

*/