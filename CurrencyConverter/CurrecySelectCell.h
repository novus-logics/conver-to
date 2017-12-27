//
//  CurrecySelectCell.h
//  CurrencyConverter
//
//  Created by Novus Logics on 03/09/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrecySelectCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblCode;
@property (strong, nonatomic) IBOutlet UIView *viewLine;

@end
