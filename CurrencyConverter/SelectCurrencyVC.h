//
//  SelectCurrencyVC.h
//  CurrencyConverter
//
//  Created by Novus Logics on 03/09/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import "SuperViewController.h"
#import "CurrecySelectCell.h"

@interface SelectCurrencyVC : SuperViewController <UISearchBarDelegate>
{
    IBOutlet UISearchBar *searchBarCurrency;
    IBOutlet UITableView *tblCurrnecy;
    
    NSMutableArray *arrCurrency;
    NSArray *allCurrency;
}

@property (nonatomic, assign) BOOL isFrom;
@property (nonatomic, assign) BOOL isCurrency;
@property (nonatomic, assign) NSInteger sectionUnit;
@property (copy, nonatomic) void(^handlerBlock)(NSDictionary *selectData, BOOL isFrom, NSInteger unit);
- (void)setCloseEventWithHandler:(void (^)(NSDictionary *selectData, BOOL isFrom, NSInteger unit))handlerBlock;

@end
