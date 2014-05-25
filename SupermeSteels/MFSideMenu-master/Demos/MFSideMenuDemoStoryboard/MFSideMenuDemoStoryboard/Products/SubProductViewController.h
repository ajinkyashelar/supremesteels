//
//  SubProductViewController.h
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 28/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubProductViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *prodDescriptionLable;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * subProductsArr;
@property (nonatomic, strong) NSString * productCategory;
@property (nonatomic, strong) NSString * prodDescription;
@end
