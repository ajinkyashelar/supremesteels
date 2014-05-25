//
//  ProductsTableViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 28/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import "ProductsTableViewController.h"
#import "MFSideMenu.h"
#import "SubProductViewController.h"
@interface ProductsTableViewController ()

@end

@implementation ProductsTableViewController
@synthesize productsArr, productsDescArr;
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"Products";
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self setupMenuBarButtonItems];
    
    productsArr = [[NSMutableArray alloc] initWithObjects: @"Duplex stainless steels",@"Super-duplex stainless steels", @"Super-austenitic stainless steels", @"Nickel-based Super Alloys", nil];
    
    productsDescArr = [[NSMutableArray alloc] initWithObjects:@"Duplex Stainless Steels are replacing the conventional stainless steels due to higher strength and corrosion resistant properties. The balance of ferrite and austenite in the steels helps to achieve both the properties of corrosion resistance along with high mechanical properties. These steels are exceptional in offshore & sour oil & gas applications. They are also replacing stainless steels in chemical, waste, salt water, marine and pulp & paper industries.", @"Super duplex is by definition a duplex stainless steel with a Pitting Resistance Equivalent Number (PREN) > 40. Usually super duplex grades have 25% chromium or more.",@"Super-austenitic stainless steels", @"Nickel-Based Super Alloys have additional advantages for high temperature applications and hence are popularly used as bolting material, trim parts in valve application, and various aerospace, oil & gas and petroleum applications. These grades help in life-cycle improvement and usually have corrosion resistant properties even better than Duplex & Super-duplex Stainless steels.", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return productsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableViewCell cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableViewCell dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = productsArr[indexPath.row];
    cell.detailTextLabel.text = productsDescArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Change the selected background view of the cell.
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    SubProductViewController * subProdVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    subProdVC.productCategory = productsArr[indexPath.row];
    subProdVC.prodDescription = productsDescArr[indexPath.row];
    
}


#pragma mark Left Button

- (void)showLeftMenuPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (void)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupMenuBarButtonItems {
    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed &&
       [[self.navigationController.viewControllers objectAtIndex:0] isEqual:self]) {
        self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
    } else {
        self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
    }
}

- (UIBarButtonItem *)leftMenuBarButtonItem {
    UIBarButtonItem * leftBarButton =  [[UIBarButtonItem alloc]
                                        initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStyleBordered
                                        target:self
                                        action:@selector(showLeftMenuPressed:)];
    [leftBarButton setTintColor:[UIColor darkGrayColor]];
    
    return leftBarButton;
}

- (UIBarButtonItem *)backBarButtonItem {
    UIBarButtonItem * leftbackButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-arrow.png"]
                                                                        style:UIBarButtonItemStyleBordered
                                                                       target:self
                                                                       action:@selector(backButtonPressed:)];
    [leftbackButton setTintColor:[UIColor darkGrayColor]];
    return leftbackButton;
}

@end
