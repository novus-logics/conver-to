//
//  UITextField+TextField.h
//  PreventFire
//
//  Created by mac-0007 on 30/03/15.
//  Copyright (c) 2015 mac-0004. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (TextField)

- (void)addLeftPaddingWithWidth:(CGFloat)width;
- (void)addRightPaddingWithWidth:(CGFloat)width;

-(void)setLeftImage:(UIImage *)img withSize:(CGSize)sizeImg;
-(void)setRightImage:(UIImage *)img withSize:(CGSize)sizeImg;

-(void)setLeftImage1:(UIImage *)img withSize:(CGSize)sizeImg;
-(void)setRightImage1:(UIImage *)img withSize:(CGSize)sizeImg;

@end
