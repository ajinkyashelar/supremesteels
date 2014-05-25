//
//  DetailProductTableViewController.h
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 02/05/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentDetialTableViewCell.h"
@interface DetailProductTableViewController : UITableViewController

@property (nonatomic, strong) NSString * productSubCategory;
@property (nonatomic, strong) NSString * productCategory;
@property (nonatomic, strong) NSMutableArray * productContentArr;
@end
