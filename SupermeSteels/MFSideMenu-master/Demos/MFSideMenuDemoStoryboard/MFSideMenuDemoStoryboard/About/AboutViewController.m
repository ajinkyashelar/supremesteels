//
//  AboutViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 27/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import "AboutViewController.h"
#import "MFSideMenu.h"
@interface AboutViewController ()

@end

@implementation AboutViewController

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
    
    self.navigationItem.title = @"About";
    
    [self setupMenuBarButtonItems];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
