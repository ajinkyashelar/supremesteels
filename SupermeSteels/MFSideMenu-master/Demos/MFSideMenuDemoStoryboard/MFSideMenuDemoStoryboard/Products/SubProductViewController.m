//
//  SubProductViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 28/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import "SubProductViewController.h"
#import "DetailProductTableViewController.h"
#import "MFSideMenu.h"
@interface SubProductViewController ()

@end

@implementation SubProductViewController
@synthesize subProductsArr;
@synthesize tableView, prodDescriptionLable;
@synthesize productCategory;
@synthesize prodDescription;
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
    
    self.title = productCategory;
    prodDescriptionLable.text = prodDescription;
    
    [self setupMenuBarButtonItems];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor darkGrayColor]];
    
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ProductsData" ofType:@"plist"]];
    
    subProductsArr = [[NSMutableArray alloc] initWithArray:[dictRoot objectForKey:productCategory]];

    [subProductsArr enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {

//        NSLog(@"Category name : %@",[obj valueForKey:@"Grade"]);
    }];
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
    return subProductsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableViewCell cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableViewCell dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    id obj = subProductsArr[indexPath.row];
    cell.textLabel.text = [obj valueForKey:@"Grade"];
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    DetailProductTableViewController * subProdVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    subProdVC.productCategory = productCategory;
    id obj = subProductsArr[indexPath.row];
    subProdVC.productSubCategory = [obj valueForKey:@"Grade"];
}



- (void)showLeftMenuPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (void)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupMenuBarButtonItems {
    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed &&
       [[self.navigationController.viewControllers objectAtIndex:0] isEqual:self])
    {
        self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
    } else
    {
        self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
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
