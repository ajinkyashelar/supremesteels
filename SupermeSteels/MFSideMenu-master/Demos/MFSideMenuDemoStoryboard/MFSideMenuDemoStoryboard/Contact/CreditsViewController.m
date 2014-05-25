//
//  CreditsViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 02/05/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import "CreditsViewController.h"

@interface CreditsViewController ()

@end

@implementation CreditsViewController

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

- (IBAction)dismissBtnClicked:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
