//
//  SettingVC.m
//  CurrencyConverter
//
//  Created by Novus Logics on 12/09/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import "SettingVC.h"

@interface SettingVC ()

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Settings";
    
    txtToCurrency.layer.cornerRadius = txtToPerUnit.layer.cornerRadius  = 5.0f;
    txtToCurrency.layer.masksToBounds = txtToPerUnit.layer.masksToBounds = true;
    
    [txtToCurrency setLeftImage:[UIImage imageNamed:@"ic_currency"] withSize:CGSizeMake((CScreenWidth * 45)/375, (CScreenWidth * 45)/375)];
    [txtToPerUnit setLeftImage:[UIImage imageNamed:@"ic_currency"] withSize:CGSizeMake((CScreenWidth * 45)/375, (CScreenWidth * 45)/375)];
    
    [txtToCurrency setRightImage:[UIImage imageNamed:@"ic_dropdown"] withSize:CGSizeMake(25, 25)];
    [txtToPerUnit setRightImage:[UIImage imageNamed:@"ic_dropdown"] withSize:CGSizeMake(25, 25)];
    
    btnSave.layer.borderWidth = 1.0f;
    btnSave.layer.borderColor = [UIColor whiteColor].CGColor;
    btnSave.layer.cornerRadius = 5.0f;
    btnSave.layer.masksToBounds = true;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reset"] style:UIBarButtonItemStylePlain target:self action:@selector(btnResetPress:)];
    
    if ([CUserDefaults valueForKey:CDEFAULT_FROMCURRENCY])
        isToCurrency = [CUserDefaults valueForKey:CDEFAULT_FROMCURRENCY];
    
    if ([CUserDefaults valueForKey:CDEFAULT_TOCURRENCY])
        isUnitTo = [CUserDefaults valueForKey:CDEFAULT_TOCURRENCY];
    
    [self setData];
    
    self.view.backgroundColor = CThemeColor;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Helper events:

- (void)setData
{
    if (isToCurrency)
        txtToCurrency.text = [isToCurrency valueForKey:@"code"];
    
    if (isUnitTo)
        txtToPerUnit.text = [isUnitTo valueForKey:@"code"];
}

- (void)setCloseEventWithHandler:(void (^)(NSDictionary *selectData))handlerBlock
{
    self.handlerBlock = handlerBlock;
}

#pragma mark action events:

-(IBAction)btnSavePress:(id)sender
{
    if (self.handlerBlock) {
        self.handlerBlock(nil);
    }
    
    if (txtToCurrency.text.length == 0)
        [CUserDefaults removeObjectForKey:CDEFAULT_FROMCURRENCY];
    else
        [CUserDefaults setValue:isToCurrency forKey:CDEFAULT_FROMCURRENCY];
    
    if (txtToPerUnit.text.length == 0)
        [CUserDefaults removeObjectForKey:CDEFAULT_TOCURRENCY];
    else
        [CUserDefaults setValue:isUnitTo forKey:CDEFAULT_TOCURRENCY];
    
    [CUserDefaults synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)btnResetPress:(UIBarButtonItem *)sender
{
    txtToCurrency.text = txtToCurrency.text = @"";
}

// Currency
- (IBAction)btnFromCurrency:(UIButton *)sender {
    
    SelectCurrencyVC *selectVC = [[SelectCurrencyVC alloc] initWithNibName:@"SelectCurrencyVC" bundle:nil];
    selectVC.isFrom = false;
    selectVC.isCurrency = true;
    [selectVC setHandlerBlock:^(NSDictionary *getToCurrency, BOOL isa, NSInteger section){
        isToCurrency = getToCurrency;
        [self setData];
    }];
    SuperNavigationController *superVC = [[SuperNavigationController alloc] initWithRootViewController:selectVC];
    [self presentViewController:superVC animated:YES completion:nil];
    
}

- (IBAction)btnToCurrency:(UIButton *)sender {
    
    SelectCurrencyVC *selectVC = [[SelectCurrencyVC alloc] initWithNibName:@"SelectCurrencyVC" bundle:nil];
    selectVC.isFrom = false;
    selectVC.isCurrency = false;
    selectVC.sectionUnit = 0;
    [selectVC setHandlerBlock:^(NSDictionary *getToMass, BOOL isa, NSInteger section){
        isUnitTo = getToMass;
        [self setData];
    }];
    SuperNavigationController *superVC = [[SuperNavigationController alloc] initWithRootViewController:selectVC];
    [self presentViewController:superVC animated:YES completion:nil];
    
}


@end
