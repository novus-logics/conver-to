//
//  SettingVC.h
//  CurrencyConverter
//
//  Created by Novus Logics on 12/09/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingVC : SuperViewController
{
    IBOutlet UITextField *txtToCurrency;
    IBOutlet UITextField *txtToPerUnit;
    IBOutlet UIButton *btnSave;

    NSDictionary *isToCurrency;
    NSDictionary *isUnitTo;

}

@property (copy, nonatomic) void(^handlerBlock)(NSDictionary *selectData);
- (void)setCloseEventWithHandler:(void (^)(NSDictionary *selectData))handlerBlock;

@end
