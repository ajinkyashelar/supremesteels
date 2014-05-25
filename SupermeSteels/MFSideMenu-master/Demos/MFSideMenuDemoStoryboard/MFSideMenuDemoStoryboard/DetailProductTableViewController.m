//
//  DetailProductTableViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 02/05/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import "DetailProductTableViewController.h"
#import "MFSideMenu.h"
@interface DetailProductTableViewController ()

@end

@implementation DetailProductTableViewController
@synthesize productSubCategory, productCategory, productContentArr;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    
    self.title = productSubCategory;
    
    [self setupMenuBarButtonItems];
    
//    productContentArr = [[NSMutableArray alloc] initWithObjects:@"Aluminium %",@"Cobalt %",@"Grade",@"Iron %",@"Niobium %",@"Nitrogen %",@"Phosphorous %",@"Titanium %", nil];
    
    productContentArr = [[NSMutableArray alloc] initWithObjects:@"Applicable Standards", @"Carbon %", @"Silicon %", @"Manganese %", @"Sulphur %", @"Chromium %", @"Molybdenum %", @"Copper %", @"Nickel %", @"Tungsten %", @"Hardness (BHN)", @"Density", @"U.T.S. (N/MM2)", @"Yeild Strength  (Mpa)", @"Elongation", @"Reduction Area",nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return productContentArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ContentDetialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ProductsData" ofType:@"plist"]];
    
    NSMutableArray* subProductsArr = [[NSMutableArray alloc] initWithArray:[dictRoot objectForKey:productCategory]];
    
    [subProductsArr enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
        
        
        if ([[obj valueForKey:@"Grade"] isEqualToString:productSubCategory])
        {
            NSString * strContent = [NSString stringWithFormat:@"%@", productContentArr[indexPath.row]];
            cell.attributeLable.text = strContent;
            cell.valueLable.text = [obj valueForKey:productContentArr[indexPath.row]];
        }
        

    }];
    
    return cell;
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */


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
