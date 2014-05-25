//
//  GradesTableViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 03/05/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import "GradesTableViewController.h"
#import "WeightsViewController.h"
#import "MFSideMenu.h"
@interface GradesTableViewController ()

@end

@implementation GradesTableViewController
@synthesize gradesArray;
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
    
    UIView *fotterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300,30)];

    
    [self.tableView setTableHeaderView:fotterView];
    
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ProductsData" ofType:@"plist"]];
    
    NSMutableArray*  productsArr = [[NSMutableArray alloc] initWithObjects: @"Duplex stainless steels",@"Super-duplex stainless steels", @"Super-austenitic stainless steels", @"Nickel-based Super Alloys", nil];
    
    gradesArray = [[NSMutableArray alloc] init];
    
    // Add Steel
    NSDictionary * dicSteel = [[NSDictionary alloc] initWithObjectsAndKeys:@"Steel",@"Grade",@"7.81",@"Density", nil];
    [gradesArray addObject:dicSteel];
    
    for (int i = 0; i < productsArr.count; i++)
    {
        NSMutableArray *subProductsArr = [[NSMutableArray alloc] initWithArray:[dictRoot objectForKey:productsArr[i]]];
        
        [subProductsArr enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
            
            if (![[obj valueForKey:@"Density"] isEqualToString:@""]) {
                [gradesArray addObject:subProductsArr[index]];
            }
        }];
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return gradesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    id obj = gradesArray[indexPath.row];
    cell.textLabel.text = [obj valueForKey:@"Grade"];
    
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id obj = gradesArray[indexPath.row];
    
    [[NSUserDefaults standardUserDefaults]setDouble:[[obj valueForKey:@"Density"] doubleValue] forKey:@"DensityValue"];
    [[NSUserDefaults standardUserDefaults]setObject:[obj valueForKey:@"Grade"]  forKey:@"GradeValue"];
    
    WeightsViewController *weightsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WeightsViewController"];
    
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    self.navigationItem.title  = @"Weights";
    NSArray *controllers = [NSArray arrayWithObject:weightsViewController];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 

@end
