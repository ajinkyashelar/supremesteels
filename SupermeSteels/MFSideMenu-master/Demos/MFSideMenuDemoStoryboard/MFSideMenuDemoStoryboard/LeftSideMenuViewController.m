//
//  LeftSideMenuViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 27/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import "LeftSideMenuViewController.h"
#import "DemoViewController.h"
#import "MFSideMenu.h"
#import "AboutViewController.h"
#import "ProductsTableViewController.h"
#import "WeightsViewController.h"
#import "ContactViewController.h"

@interface LeftSideMenuViewController ()

@end

@implementation LeftSideMenuViewController
@synthesize homeBtn, aboutBtn, productsBtn, weightsBtn, contactBtn;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)homeBtnClicked:(id)sender
{
    DemoViewController *demoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DemoViewController"];
    
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:demoViewController];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    
    [homeBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:26.0]];
    [aboutBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [productsBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [weightsBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [contactBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
}

- (IBAction)aboutBtnClicked:(id)sender {
    AboutViewController *aboutViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
    
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:aboutViewController];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    
    [homeBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [aboutBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:26.0]];
    [productsBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [weightsBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [contactBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
}

- (IBAction)productsBtnClicked:(id)sender {
    
    ProductsTableViewController *productsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductsTableViewController"];
    
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:productsViewController];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    
    [homeBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [aboutBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [productsBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:26.0]];
    [weightsBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [contactBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
}

- (IBAction)weightsBtnClicked:(id)sender {
    
    WeightsViewController *weightsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WeightsViewController"];
    
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    self.navigationItem.title  = @"Weights";
    NSArray *controllers = [NSArray arrayWithObject:weightsViewController];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    
    [homeBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [aboutBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [productsBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [weightsBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:26.0]];
    [contactBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
}

- (IBAction)contactBtnClicked:(id)sender {
    
    ContactViewController *contactViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactViewController"];
    
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:contactViewController];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    
    [homeBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [aboutBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [productsBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [weightsBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0]];
    [contactBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:26.0]];
}
@end
