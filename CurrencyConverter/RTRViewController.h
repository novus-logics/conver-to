// ABBYY® Real-Time Recognition SDK 1 © 2016 ABBYY Production LLC.
// ABBYY is either a registered trademark or a trademark of ABBYY Software Ltd.

#import <UIKit/UIKit.h>

@interface RTRViewController : UIViewController

@property (copy, nonatomic) void(^handlerBlock)(NSString *getValue);
- (void)setCloseEventWithHandler:(void (^)(NSString *getValue))handlerBlock;

@end
