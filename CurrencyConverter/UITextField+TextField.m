//
//  UITextField+TextField.m
//  PreventFire
//
//  Created by mac-0007 on 30/03/15.
//  Copyright (c) 2015 mac-0004. All rights reserved.
//

#import "UITextField+TextField.h"

@implementation UITextField (TextField)

- (void)addLeftPaddingWithWidth:(CGFloat)width
{
    UIView *textFieldPadding = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    self.leftView = textFieldPadding;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)addRightPaddingWithWidth:(CGFloat)width
{
    UIView *textFieldPadding = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    self.rightView = textFieldPadding;
    self.rightViewMode = UITextFieldViewModeAlways;
}

-(void)setLeftImage:(UIImage *)img withSize:(CGSize)sizeImg
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (CScreenWidth * 21)/375, (CScreenWidth * 21)/375)];
    imgView.image = img;
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.layer.masksToBounds = false;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeImg.width, sizeImg.height)];
    [paddingView addSubview:imgView];
   // paddingView.backgroundColor = CRGBA(0, 158, 217, 0.6);
    imgView.center = paddingView.center;
    
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void)setRightImage:(UIImage *)img withSize:(CGSize)sizeImg
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 13, 13)];
    imgView.image = img;
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.layer.masksToBounds = false;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeImg.width, sizeImg.height)];
    [paddingView addSubview:imgView];
    imgView.center = paddingView.center;
    
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
    
}

-(void)setLeftImage1:(UIImage *)img withSize:(CGSize)sizeImg
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 13, 13)];
    imgView.image = img;
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.layer.masksToBounds = false;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeImg.width, sizeImg.height)];
    [paddingView addSubview:imgView];
    imgView.center = CGPointMake(paddingView.center.x, paddingView.center.y - 5);
    
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void)setRightImage1:(UIImage *)img withSize:(CGSize)sizeImg
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 13, 13)];
    imgView.image = img;
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.layer.masksToBounds = false;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeImg.width, sizeImg.height)];
    [paddingView addSubview:imgView];
    imgView.center = CGPointMake(paddingView.center.x, paddingView.center.y - 5);
    
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
    
}

@end
