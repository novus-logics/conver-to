//
//  StatusBarNotifierView.h
//  StatusBarNotifier
//
//  Created by Francesco Di Lorenzo on 05/09/12.
//  Copyright (c) 2012 Francesco Di Lorenzo. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface FDStatusBarNotifierView : UIView

@property (strong, nonatomic) NSString *message;
@property (nonatomic,assign) BOOL shouldHideOnTap;
@property NSTimeInterval timeOnScreen; // seconds, default: 2s
@property id delegate;


- (id)initWithMessage:(NSString *)message;
- (id)initWithMessage:(NSString *)message delegate:(id /**<>*/)delegate;

- (void)showInWindow:(UIWindow *)window;

@end


@protocol StatusBarNotifierViewDelegate <NSObject>
@optional

- (void)willPresentNotifierView:(FDStatusBarNotifierView *)notifierView;  // before animation and showing view
- (void)didPresentNotifierView:(FDStatusBarNotifierView *)notifierView;   // after animation
- (void)willHideNotifierView:(FDStatusBarNotifierView *)notifierView;     // before hiding animation
- (void)didHideNotifierView:(FDStatusBarNotifierView *)notifierView;      // after animation

- (void)notifierViewTapped:(FDStatusBarNotifierView *)notifierView; // user tap the status bar message

@end


/*


 - (IBAction)showMessage {
 NSString *text = self.messageField.text;
 FDStatusBarNotifierView *notifierView = [[FDStatusBarNotifierView alloc] initWithMessage:text delegate:self];
 notifierView.timeOnScreen = 3.0;
 [notifierView showInWindow:self.view.window];
 }
 
 // **Optional** StatusBarNotifierViewDelegate methods
 
 - (void)willPresentNotifierView:(FDStatusBarNotifierView *)notifierView {
 NSLog(@"willPresentNotifierView");
 }
 
 - (void)didPresentNotifierView:(FDStatusBarNotifierView *)notifierView {
 NSLog(@"didPresentNotifierView");
 }
 
 - (void)willHideNotifierView:(FDStatusBarNotifierView *)notifierView {
 NSLog(@"willHideNotifierView");
 }
 
 - (void)didHideNotifierView:(FDStatusBarNotifierView *)notifierView {
 NSLog(@"didHideNotifierView");
 }
 
 - (void)notifierViewTapped:(FDStatusBarNotifierView *)notifierView {
 NSLog(@"notifierViewTapped");
 }

*/
