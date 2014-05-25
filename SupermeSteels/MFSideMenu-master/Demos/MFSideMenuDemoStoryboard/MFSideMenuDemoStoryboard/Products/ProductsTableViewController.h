//
//  ProductsTableViewController.h
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 28/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductsTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray * productsArr;
@property (nonatomic, strong) NSMutableArray * productsDescArr;
@end
