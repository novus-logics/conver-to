//
//  SelectCurrencyVC.m
//  CurrencyConverter
//
//  Created by Novus Logics on 03/09/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import "SelectCurrencyVC.h"

@interface SelectCurrencyVC ()

@end

@implementation SelectCurrencyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    arrCurrency = [[NSMutableArray alloc] init];
    
    [tblCurrnecy registerNib:[UINib nibWithNibName:@"CurrecySelectCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CurrecySelectCell"];
    tblCurrnecy.estimatedRowHeight = 55;
    tblCurrnecy.rowHeight = UITableViewAutomaticDimension;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_close"] style:UIBarButtonItemStylePlain target:self action:@selector(btnClosePress:)];
    
    //searchBarCurrency.backgroundImage = [self imageWithColor:CRGB(0, 129, 160)];
    searchBarCurrency.backgroundImage = [self imageWithColor:CThemeColor];

    if (self.isCurrency) {
        
        self.title = @"Select Currency";
        
        searchBarCurrency.placeholder = @"Search for currency...";
        
        NSError *deserializingError;
        NSString *pathStringToLocalFile = [[NSBundle mainBundle] pathForResource:@"currency" ofType:@"json"];
        NSURL *localFileURL = [NSURL fileURLWithPath:pathStringToLocalFile];
        NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
        allCurrency = [NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                      options:kNilOptions
                                                        error:&deserializingError];
    }else {
        
        self.title = @"Select Mass";
        
        searchBarCurrency.placeholder = @"Search for mass...";
        
        NSError *deserializingError;
        NSString *pathStringToLocalFile = [[NSBundle mainBundle] pathForResource:@"mass" ofType:@"json"];
        NSURL *localFileURL = [NSURL fileURLWithPath:pathStringToLocalFile];
        NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
        switch (self.sectionUnit) {
            case -1:
                allCurrency = [NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                              options:kNilOptions
                                                                error:&deserializingError];
                break;
                
            default:
            {
                allCurrency = @[[[NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                                 options:kNilOptions
                                                                   error:&deserializingError] objectAtIndex:self.sectionUnit]];
            }
                break;
        }
    }
    
    [self getDataFromLocal:searchBarCurrency.text];
    
    self.view.backgroundColor = CThemeColor;
    tblCurrnecy.backgroundColor = CThemeColor;

    
}

- (void)btnClosePress:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Search Bar Delegate
#pragma mark

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = true;
    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = false;
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"Search Text: %@", searchText);
    [self getDataFromLocal:searchText];
}

#pragma mark - Get Data From Local and Server

- (void)getDataFromLocal:(NSString *)strSearch
{
    [arrCurrency removeAllObjects];
    if (strSearch.length > 0) {
        
        for (NSDictionary *obj in allCurrency) {
            NSArray *getValue = [obj valueForKey:@"value"];
            NSArray *findCurrency = [getValue filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@ OR code CONTAINS[cd] %@", strSearch, strSearch]];
            NSDictionary *findObject = @{@"name": [obj valueForKey:@"name"], @"value": findCurrency};
            [arrCurrency addObject:findObject];
        }
        
    }else
        [arrCurrency addObjectsFromArray:allCurrency];
    
    [tblCurrnecy reloadData];
}

- (void)setCloseEventWithHandler:(void (^)(NSDictionary *selectData, BOOL isFrom, NSInteger unit))handlerBlock
{
    self.handlerBlock = handlerBlock;
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - Table view data source
#pragma mark

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return arrCurrency.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[arrCurrency objectAtIndex:section] valueForKey:@"value"] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.0;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 1. The view for the header
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CScreenWidth, 45)];
    
    // 2. Set a custom background color and a border
//    headerView.backgroundColor = CRGB(0, 129, 160);
//    headerView.layer.borderColor = CRGB(0, 129, 160).CGColor;
    headerView.backgroundColor = CThemeColor;
    headerView.layer.borderColor = CThemeColor.CGColor;
    headerView.layer.borderWidth = 1.0;
    
    // 3. Add a label
    UILabel* headerLabel = [[UILabel alloc] init];
    headerLabel.frame = CGRectMake(0, 0, CScreenWidth, 45);
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:16.0];
    headerLabel.text = [[arrCurrency objectAtIndex:section] valueForKey:@"name"];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    
    // 4. Add the label to the header view
    [headerView addSubview:headerLabel];
    
    // 5. Finally return
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CurrecySelectCell";
    CurrecySelectCell *cell = (CurrecySelectCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
        cell = [[CurrecySelectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *getData = [[[arrCurrency objectAtIndex:indexPath.section] valueForKey:@"value"] objectAtIndex:indexPath.row];
    
    cell.lblName.text = [getData objectForKey:@"name"];
    cell.lblCode.text = [getData objectForKey:@"code"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *getData = [[[arrCurrency objectAtIndex:indexPath.section] valueForKey:@"value"] objectAtIndex:indexPath.row];
    if (self.handlerBlock)
        self.handlerBlock(getData, self.isFrom, indexPath.section);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
