//
//  CurrencyVC.h
//  CurrencyConverter
//
//  Created by Novus Logics on 03/09/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectCurrencyVC.h"
#import "RTRViewController.h"

#import "TFHpple.h"
#import "MKMassUnit+Imperial.h"
#import "MKMassUnit.h"

@interface CurrencyVC : SuperViewController <NSXMLParserDelegate>
{
    IBOutlet UITextField *txtEnterPrice;
    IBOutlet UITextField *txtDiscount;
    IBOutlet UITextField *txtFromCurrency;
    IBOutlet UITextField *txtFromPerUnit;
    IBOutlet UIButton *btnViceVersa;
    IBOutlet UITextField *txtToCurrency;
    IBOutlet UITextField *txtToPerUnit;
    IBOutlet UILabel *lblTotalPrice;
    IBOutlet UIButton *btnConvert;
    IBOutlet UILabel *lblHistory;
    IBOutlet UIButton *btnHistory;
    IBOutlet UIButton *btnUseDefault;

    NSDictionary *isFrom;
    NSDictionary *isTo;
    NSDictionary *isFromMass;
    NSDictionary *isToMass;
    
    MKUnit *fromas;
    MKUnit *toMass;
    
    NSInteger sectionUnit;
}


@end
