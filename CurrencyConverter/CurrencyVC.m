//
//  CurrencyVC.m
//  CurrencyConverter
//
//  Created by Novus Logics on 03/09/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import "CurrencyVC.h"
#import <QuartzCore/QuartzCore.h>
#import "SettingVC.h"

@interface CurrencyVC ()

@end

@implementation CurrencyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reset"] style:UIBarButtonItemStylePlain target:self action:@selector(btnResetPress:)];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(historyTapped)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [lblHistory addGestureRecognizer:tapGestureRecognizer];
    
    
    [self setData];
    
  //  self.view.backgroundColor = CRGB(0, 129, 160);
    
    self.view.backgroundColor = CThemeColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Method
#pragma mark

- (void)setData
{
    btnConvert.layer.borderWidth = 1.0f;
    btnConvert.layer.borderColor = [UIColor whiteColor].CGColor;
    
    btnHistory.layer.cornerRadius = 5;
    btnHistory.layer.shadowColor = [UIColor blackColor].CGColor;
    btnHistory.layer.shadowOffset = CGSizeMake(1, 1);
    btnHistory.layer.shadowOpacity = 5;
    btnHistory.layer.shadowRadius = 1;
    
    btnHistory.layer.masksToBounds = NO;
    
    txtEnterPrice.layer.cornerRadius = txtDiscount.layer.cornerRadius = txtFromCurrency.layer.cornerRadius = txtFromPerUnit.layer.cornerRadius = txtToCurrency.layer.cornerRadius = txtToPerUnit.layer.cornerRadius = lblTotalPrice.layer.cornerRadius = btnConvert.layer.cornerRadius = 5.0f;
    txtEnterPrice.layer.masksToBounds = txtDiscount.layer.masksToBounds = txtFromCurrency.layer.masksToBounds = txtFromPerUnit.layer.masksToBounds = txtToCurrency.layer.masksToBounds = txtToPerUnit.layer.masksToBounds = lblTotalPrice.layer.masksToBounds = btnConvert.layer.masksToBounds = true;
    
    [txtEnterPrice setLeftImage:[UIImage imageNamed:@"ic_price"] withSize:CGSizeMake((CScreenWidth * 45)/375, (CScreenWidth * 45)/375)];
    [txtDiscount setLeftImage:[UIImage imageNamed:@"ic_discount"] withSize:CGSizeMake((CScreenWidth * 45)/375, (CScreenWidth * 45)/375)];
    [txtFromCurrency setLeftImage:[UIImage imageNamed:@"ic_currency"] withSize:CGSizeMake((CScreenWidth * 45)/375, (CScreenWidth * 45)/375)];
    [txtFromPerUnit setLeftImage:[UIImage imageNamed:@"ic_measure"] withSize:CGSizeMake((CScreenWidth * 38)/375, (CScreenWidth * 38)/375)];
    [txtToCurrency setLeftImage:[UIImage imageNamed:@"ic_currency"] withSize:CGSizeMake((CScreenWidth * 45)/375, (CScreenWidth * 45)/375)];
    [txtToPerUnit setLeftImage:[UIImage imageNamed:@"ic_measure"] withSize:CGSizeMake((CScreenWidth * 38)/375, (CScreenWidth * 38)/375)];
    
    [txtFromCurrency setRightImage:[UIImage imageNamed:@"ic_dropdown"] withSize:CGSizeMake(25, 25)];
    [txtFromPerUnit setRightImage:[UIImage imageNamed:@"ic_dropdown"] withSize:CGSizeMake(25, 25)];
    [txtToCurrency setRightImage:[UIImage imageNamed:@"ic_dropdown"] withSize:CGSizeMake(25, 25)];
    [txtToPerUnit setRightImage:[UIImage imageNamed:@"ic_dropdown"] withSize:CGSizeMake(25, 25)];
    
    [self setPriceValue];
    [self setHistory];
    
    lblTotalPrice.backgroundColor = CThemeColor;
}

- (void)setPriceValue
{
    // From currency
    NSString *isFromString = @"";
    if (isFrom)
        isFromString = [NSString stringWithFormat:@"%@", [isFrom valueForKey:@"code"]];
    
    txtFromCurrency.text = isFromString;
    
    // To currency
    NSString *isToString = @"";
    if (isTo)
        isToString = [NSString stringWithFormat:@"%@", [isTo valueForKey:@"code"]];
    
    txtToCurrency.text = isToString;
    
    // From Mass
    NSString *strFromMass = @"";
    fromas = nil;
    if (isFromMass) {
        strFromMass = [NSString stringWithFormat:@"%@", [isFromMass valueForKey:@"code"]];
        fromas = [appDelegate getMassUnit:strFromMass];
    }
    
    txtFromPerUnit.text = strFromMass;
    
    // From Mass
    NSString *strToMass = @"";
    toMass = nil;
    if (isToMass) {
        strToMass = [NSString stringWithFormat:@"%@", [isToMass valueForKey:@"code"]];
        toMass = [appDelegate getMassUnit:strToMass];
    }
    
    txtToPerUnit.text = strToMass;
    
    btnUseDefault.hidden = YES;
    if (txtFromCurrency.text.length > 0 || txtFromPerUnit.text.length > 0)
        btnUseDefault.hidden = NO;
}

- (void)setHistory
{
    btnHistory.hidden = YES;
    NSDictionary *lastHistory = [CUserDefaults valueForKey:CLASTHISTORY];
    if (lastHistory) {
        btnHistory.hidden = NO;
        NSString *strHistory = @"Last History\n\n";
        NSString *price = [lastHistory valueForKey:@"price"];
        NSString *discount = [lastHistory valueForKey:@"discount"];
        NSString *from_currecy = [lastHistory valueForKey:@"from_currecy"];
        NSString *from_unit = [lastHistory valueForKey:@"from_unit"];
        NSString *to_currency = [lastHistory valueForKey:@"to_currency"];
        NSString *to_unit = [lastHistory valueForKey:@"to_unit"];
        NSString *total = [lastHistory valueForKey:@"total"];
        
        if (price.length > 0)
            strHistory = [strHistory stringByAppendingString:[NSString stringWithFormat:@"Value: %@\n", price]];
        
        if (discount.length > 0)
            strHistory = [strHistory stringByAppendingString:[NSString stringWithFormat:@"Discount: %@\n", discount]];
        
        if (from_currecy.length > 0)
            strHistory = [strHistory stringByAppendingString:[NSString stringWithFormat:@"From Currecy: %@\n", from_currecy]];
        
        if (from_unit.length > 0)
            strHistory = [strHistory stringByAppendingString:[NSString stringWithFormat:@"From Unit: %@\n", from_unit]];
        
        if (to_currency.length > 0)
            strHistory = [strHistory stringByAppendingString:[NSString stringWithFormat:@"To Currency: %@\n", to_currency]];
        
        if (to_unit.length > 0)
            strHistory = [strHistory stringByAppendingString:[NSString stringWithFormat:@"To Unit: %@\n", to_unit]];
        
        if (total.length > 0)
            strHistory = [strHistory stringByAppendingString:[NSString stringWithFormat:@"Results: %@\n", total]];
        
        lblHistory.text = strHistory;
    }
}

#pragma mark - Action Function
#pragma mark

-(void)historyTapped
{
    if ([CUserDefaults valueForKey:CLASTHISTORY]) {
        txtEnterPrice.text = [[CUserDefaults valueForKey:CLASTHISTORY] valueForKey:@"price"];
        txtDiscount.text = [[CUserDefaults valueForKey:CLASTHISTORY] valueForKey:@"discount"];
        txtFromCurrency.text = [[CUserDefaults valueForKey:CLASTHISTORY] valueForKey:@"from_currecy"];
        txtFromPerUnit.text = [[CUserDefaults valueForKey:CLASTHISTORY] valueForKey:@"from_unit"];
        txtToCurrency.text = [[CUserDefaults valueForKey:CLASTHISTORY] valueForKey:@"to_currency"];
        txtToPerUnit.text = [[CUserDefaults valueForKey:CLASTHISTORY] valueForKey:@"to_unit"];
        lblTotalPrice.text = [[CUserDefaults valueForKey:CLASTHISTORY] valueForKey:@"total"];
        
        NSNumber *intSection =[[CUserDefaults valueForKey:CLASTHISTORY] valueForKey:@"section_unit"];
        
        if (txtFromCurrency.text.length > 0) {
            NSError *deserializingError;
            NSString *pathStringToLocalFile = [[NSBundle mainBundle] pathForResource:@"currency" ofType:@"json"];
            NSURL *localFileURL = [NSURL fileURLWithPath:pathStringToLocalFile];
            NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
            NSArray *allCurrency = [[[NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                          options:kNilOptions
                                                            error:&deserializingError] objectAtIndex:0] valueForKey:@"value"];
            
            NSArray *arr = [allCurrency filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"code == %@",txtFromCurrency.text]];
            
            if (arr.count > 0) {
                isFrom = [arr objectAtIndex:0];
            }
        }
        
        if (txtToCurrency.text.length > 0) {
            NSError *deserializingError;
            NSString *pathStringToLocalFile = [[NSBundle mainBundle] pathForResource:@"currency" ofType:@"json"];
            NSURL *localFileURL = [NSURL fileURLWithPath:pathStringToLocalFile];
            NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
            NSArray *allCurrency = [[[NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                                     options:kNilOptions
                                                                       error:&deserializingError] objectAtIndex:0] valueForKey:@"value"];
            
            NSArray *arr = [allCurrency filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"code == %@",txtToCurrency.text]];
            
            if (arr.count > 0) {
                isTo = [arr objectAtIndex:0];
            }
        }
        
        if (txtFromPerUnit.text.length > 0 && intSection >= 0) {
            
            NSError *deserializingError;
            NSString *pathStringToLocalFile = [[NSBundle mainBundle] pathForResource:@"mass" ofType:@"json"];
            NSURL *localFileURL = [NSURL fileURLWithPath:pathStringToLocalFile];
            NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
            NSArray *allCurrency = [[NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                             options:kNilOptions
                                                               error:&deserializingError] objectAtIndex:[intSection integerValue]];
           
            NSArray *arr = [[allCurrency valueForKey:@"value"] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"code == %@", txtFromPerUnit.text]];
            
            if (arr.count > 0) {
                isFromMass = [arr objectAtIndex:0];
            }
        }
        
        if (txtToPerUnit.text.length > 0 && intSection >= 0) {
            
            NSError *deserializingError;
            NSString *pathStringToLocalFile = [[NSBundle mainBundle] pathForResource:@"mass" ofType:@"json"];
            NSURL *localFileURL = [NSURL fileURLWithPath:pathStringToLocalFile];
            NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
            NSArray *allCurrency = [[NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                                      options:kNilOptions
                                                                        error:&deserializingError] objectAtIndex:[intSection integerValue]];
            
            NSArray *arr = [[allCurrency valueForKey:@"value"] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"code == %@", txtToPerUnit.text]];
            
            if (arr.count > 0) {
                isToMass = [arr objectAtIndex:0];
            }
        }
        
        [self setPriceValue];
        
        [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void){
            lblTotalPrice.hidden = NO;
        } completion:nil];
    }
}

- (void)btnResetPress:(UIBarButtonItem *)sender
{
    [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void){
        lblTotalPrice.hidden = YES;
    } completion:nil];
    
    isFrom = nil;
    isTo = nil;
    isFromMass = nil;
    isToMass = nil;
    
    fromas = nil;
    toMass = nil;
    
    txtEnterPrice.text = txtDiscount.text = lblTotalPrice.text  = @"";
    
    [self setPriceValue];
    
}

- (void)setDefaultCurrency
{
    if([CUserDefaults valueForKey:CDEFAULT_FROMCURRENCY] && txtFromCurrency.text.length > 0)
        isTo = [CUserDefaults valueForKey:CDEFAULT_FROMCURRENCY];
    
    if([CUserDefaults valueForKey:CDEFAULT_TOCURRENCY] && sectionUnit == 0 && txtFromPerUnit.text.length > 0)
        isToMass = [CUserDefaults valueForKey:CDEFAULT_TOCURRENCY];
    
     [self setPriceValue];
}

// Currency
- (IBAction)btnFromCurrency:(UIButton *)sender {
    
    SelectCurrencyVC *selectVC = [[SelectCurrencyVC alloc] initWithNibName:@"SelectCurrencyVC" bundle:nil];
    selectVC.isFrom = true;
    selectVC.isCurrency = true;
    [selectVC setHandlerBlock:^(NSDictionary *getToCurrency, BOOL isa, NSInteger section){
        isFrom = getToCurrency;
        [self setPriceValue];
    }];
    SuperNavigationController *superVC = [[SuperNavigationController alloc] initWithRootViewController:selectVC];
    [self presentViewController:superVC animated:YES completion:nil];
    
}

- (IBAction)btnToCurrency:(UIButton *)sender {
    
//    if (isFrom) {
        SelectCurrencyVC *selectVC = [[SelectCurrencyVC alloc] initWithNibName:@"SelectCurrencyVC" bundle:nil];
        selectVC.isFrom = false;
        selectVC.isCurrency = true;
        [selectVC setHandlerBlock:^(NSDictionary *getToCurrency, BOOL isa, NSInteger section){
            isTo = getToCurrency;
            [self setPriceValue];
        }];
        SuperNavigationController *superVC = [[SuperNavigationController alloc] initWithRootViewController:selectVC];
        [self presentViewController:superVC animated:YES completion:nil];
//    }else
//        [[PPAlerts sharedAlerts] showAlertWithType:0 withMessage:@"Please first select from currency." withTitle:@""];
    
}

// Unit
- (IBAction)btnFromUnitPress:(UIButton *)sender {
    
    SelectCurrencyVC *selectVC = [[SelectCurrencyVC alloc] initWithNibName:@"SelectCurrencyVC" bundle:nil];
    selectVC.isFrom = true;
    selectVC.isCurrency = false;
    selectVC.sectionUnit = -1;
    [selectVC setHandlerBlock:^(NSDictionary *getFromMass, BOOL isa, NSInteger section){
        isFromMass = getFromMass;
        sectionUnit = section;
        isToMass = nil;
        [self setPriceValue];
    }];
    SuperNavigationController *superVC = [[SuperNavigationController alloc] initWithRootViewController:selectVC];
    [self presentViewController:superVC animated:YES completion:nil];
    
}

- (IBAction)btnToUnitPress:(UIButton *)sender {
    
    if (isFromMass) {
        SelectCurrencyVC *selectVC = [[SelectCurrencyVC alloc] initWithNibName:@"SelectCurrencyVC" bundle:nil];
        selectVC.isFrom = false;
        selectVC.isCurrency = false;
        selectVC.sectionUnit = sectionUnit;
        [selectVC setHandlerBlock:^(NSDictionary *getToMass, BOOL isa, NSInteger section){
            isToMass = getToMass;
            [self setPriceValue];
        }];
        SuperNavigationController *superVC = [[SuperNavigationController alloc] initWithRootViewController:selectVC];
        [self presentViewController:superVC animated:YES completion:nil];
    }else
        [[PPAlerts sharedAlerts] showAlertWithType:0 withMessage:@"Please first select from per unit." withTitle:@""];
    
}

// Switch
- (IBAction)btnSwitch:(UIButton *)sender {
    
    if (isTo && isFrom) {
        NSDictionary *tempIsFrom = isFrom;
        isFrom = isTo;
        isTo = tempIsFrom;
    }
    
    if (isFromMass && isToMass) {
        NSDictionary *tempIsFromMass = isFromMass;
        isFromMass = isToMass;
        isToMass = tempIsFromMass;
    }
    
    [self setPriceValue];
    
    lblTotalPrice.text = @"";
    [self loadURL];
}

// Convert
- (IBAction)btnConvertPress:(UIButton *)sender {
    
    [[IQKeyboardManager sharedManager] resignFirstResponder];
    
    if (![appDelegate isNumeric:txtEnterPrice.text])
        [[PPAlerts sharedAlerts] showAlertWithType:0 withMessage:@"Please enter price." withTitle:@""];
    else
        [self loadURL];
    
}

- (IBAction)btnCameraPress:(UIButton *)sender {
    
//    CameraVC *cameraVC = [[CameraVC alloc] initWithNibName:@"CameraVC" bundle:nil];
//    [self presentViewController:cameraVC animated:YES completion:nil];
  
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    RTRViewController *cameraVC = [storyboard instantiateViewControllerWithIdentifier:@"RTRViewController"];
    [cameraVC setHandlerBlock:^(NSString *getValue){
        txtEnterPrice.text = getValue;
    }];
    [self presentViewController:cameraVC animated:YES completion:nil];
}

- (IBAction)btnProPress:(UIButton *)sender {
}

- (IBAction)btnSettingsPress:(UIButton *)sender {
    SettingVC *obj = [[SettingVC alloc] initWithNibName:@"SettingVC" bundle:nil];
    [obj setCloseEventWithHandler:^(NSDictionary *selectData) {
       
    }];
    
    [self.navigationController pushViewController:obj animated:YES];
}

- (IBAction)btnDefaultPress:(UIButton *)sender {
    [self setDefaultCurrency];
}

#pragma mark - Converter currency using google api
#pragma mark

- (void)loadURL
{
    [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void){
        lblTotalPrice.hidden = NO;
    } completion:nil];
    
    float floatPrice = [txtEnterPrice.text floatValue];
    float discount = 0.0f;
    if (txtDiscount.text.length > 0) {
        discount = [txtDiscount.text floatValue];
        floatPrice = floatPrice - ((floatPrice * discount)/100);
    }
    
    if (isFrom) {
        
        if (!isTo) {
            [[PPAlerts sharedAlerts] showAlertWithType:0 withMessage:@"Please select to currency." withTitle:@""];
            return;
        }
        
        if (isFromMass) {
            if (!isToMass) {
                [[PPAlerts sharedAlerts] showAlertWithType:0 withMessage:@"Please select to per unit." withTitle:@""];
                return;
            }
        }
        
//        NSString *URLString = [NSString stringWithFormat:@"https://www.google.com/finance/converter?a=%f&from=%@&to=%@", floatPrice, [isFrom valueForKey:@"code"], [isTo valueForKey:@"code"]];
        NSString *URLString = [NSString stringWithFormat:@"http://free.currencyconverterapi.com/api/v3/convert?q=%@_%@&compact=y", [isFrom valueForKey:@"code"], [isTo valueForKey:@"code"]];
        NSURL *url = [NSURL URLWithString:URLString];
        
        // Load a web page.
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:url completionHandler:
          ^(NSData *data, NSURLResponse *response, NSError *error) {
              
              dispatch_async(dispatch_get_main_queue(), ^{
                  NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                  if(httpResponse.statusCode == 200)
                  {
                      NSError *parseError = nil;
                      NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                      NSLog(@"The response is - %@",responseDictionary);
                      NSString *strValue = [NSString stringWithFormat:@"%@_%@", [isFrom valueForKey:@"code"], [isTo valueForKey:@"code"]];
                      NSDictionary *getValue  = [responseDictionary valueForKey:strValue];
                      if (getValue) {
                          NSString *strConvertValue = [getValue valueForKey:@"val"];
                          float convert = floatPrice * strConvertValue.floatValue;
                          lblTotalPrice.text = [NSString stringWithFormat:@"%.3f %@", convert, txtToCurrency.text];
                          if (fromas && toMass) {
                              NSNumber *amount = [MKUnit convertAmount:@1 from:fromas to:toMass];
                              convert = convert / amount.floatValue;
                              lblTotalPrice.text = [NSString stringWithFormat:@"%.3f %@ per %@", convert, txtToCurrency.text, txtToPerUnit.text];
                          }
                      }else
                          lblTotalPrice.text = [NSString stringWithFormat:@"%@ %@", txtEnterPrice.text, txtToCurrency.text];
                      
                      NSDictionary *dicHistory = @{@"price":txtEnterPrice.text, @"discount": txtDiscount.text, @"from_currecy":txtFromCurrency.text, @"from_unit":txtFromPerUnit.text, @"to_currency":txtToCurrency.text, @"to_unit":txtToPerUnit.text, @"total": lblTotalPrice.text,@"section_unit":[NSNumber numberWithUnsignedInteger:sectionUnit]};
                      
                      [CUserDefaults setValue:dicHistory forKey:CLASTHISTORY];
                      [CUserDefaults synchronize];
                      
                      [self setHistory];
                      
                  }else {
                      NSLog(@"Error");
                  }
              });
              
//              dispatch_async(dispatch_get_main_queue(), ^{
//                  TFHpple *doc       = [[TFHpple alloc] initWithHTMLData:data];
//                  NSArray *elements  = [doc searchWithXPathQuery:@"//*[@id=\"currency_converter_result\"]/span"];
//                  
//                  if (elements.count > 0) {
//                      TFHppleElement *element = [elements objectAtIndex:0];
//                      float convert = [[element.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@" %@", txtToCurrency.text] withString:@""] floatValue];
//                      lblTotalPrice.text = [NSString stringWithFormat:@"%.3f %@", convert, txtToCurrency.text];
//                      if (fromas && toMass) {
//                          NSNumber *amount = [MKUnit convertAmount:@1 from:fromas to:toMass];
//                          convert = convert / amount.floatValue;
//                          lblTotalPrice.text = [NSString stringWithFormat:@"%.3f %@ per %@", convert, txtToCurrency.text, txtToPerUnit.text];
//                      }
//                      
//                  } else
//                      lblTotalPrice.text = [NSString stringWithFormat:@"%@ %@", txtEnterPrice.text, txtToCurrency.text];
//                  
//                  NSDictionary *dicHistory = @{@"price":txtEnterPrice.text, @"discount": txtDiscount.text, @"from_currecy":txtFromCurrency.text, @"from_unit":txtFromPerUnit.text, @"to_currency":txtToCurrency.text, @"to_unit":txtToPerUnit.text, @"total": lblTotalPrice.text, @"section_unit":[NSNumber numberWithUnsignedInteger:sectionUnit]};
//                  
//                  [CUserDefaults setValue:dicHistory forKey:CLASTHISTORY];
//                  [CUserDefaults synchronize];
//                  
//                  [self setHistory];
//                  
//              });
              
          }] resume];
        
    }else {
        
        lblTotalPrice.text = [NSString stringWithFormat:@"%.3f", floatPrice];
        if (fromas && toMass && txtEnterPrice.text.length > 0) {
            NSNumber *amount = [MKUnit convertAmount:@1 from:fromas to:toMass];
            floatPrice = floatPrice / amount.floatValue;
            lblTotalPrice.text = [NSString stringWithFormat:@"%.3f %@", floatPrice, txtToPerUnit.text];
        }else if (fromas && toMass) {
            floatPrice = [MKUnit convertAmount:@1 from:fromas to:toMass].floatValue;
            lblTotalPrice.text = [NSString stringWithFormat:@"%.3f %@", floatPrice, txtToPerUnit.text];
        }
        
        NSDictionary *dicHistory = @{@"price":txtEnterPrice.text, @"discount": txtDiscount.text, @"from_currecy":txtFromCurrency.text, @"from_unit":txtFromPerUnit.text, @"to_currency":txtToCurrency.text, @"to_unit":txtToPerUnit.text, @"total": lblTotalPrice.text,@"section_unit":[NSNumber numberWithUnsignedInteger:sectionUnit]};
        
        [CUserDefaults setValue:dicHistory forKey:CLASTHISTORY];
        [CUserDefaults synchronize];
        
        [self setHistory];
    }
}

@end
