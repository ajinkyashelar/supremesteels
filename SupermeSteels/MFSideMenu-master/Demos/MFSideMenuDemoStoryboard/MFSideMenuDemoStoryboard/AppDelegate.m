//
//  AppDelegate.m
//  MFSideMenuDemoStoryboard
//
//  Created by Michael Frederick on 3/15/13.
//  Copyright (c) 2013 Michael Frederick. All rights reserved.
//

#import "AppDelegate.h"
#import "MFSideMenuContainerViewController.h"

@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UIStoryboard *storyboard;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        storyboard= [UIStoryboard storyboardWithName:@"MainStoryboard-iPad" bundle:[NSBundle mainBundle]];
    }
    else
    {
        storyboard= [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    }
    
    MFSideMenuContainerViewController *container = (MFSideMenuContainerViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
    UIViewController *leftSideMenuViewController = [storyboard instantiateViewControllerWithIdentifier:@"leftMenuVC"];
    UITableViewController *rightSideMenuViewController = [storyboard instantiateViewControllerWithIdentifier:@"rightSideMenuViewController"];
    
    [container setLeftMenuViewController:leftSideMenuViewController];
    [container setRightMenuViewController:rightSideMenuViewController];
    [container setCenterViewController:navigationController];
    

        [[NSUserDefaults standardUserDefaults]setDouble:7.81 forKey:@"DensityValue"];
        [[NSUserDefaults standardUserDefaults]setObject:@"Steel"  forKey:@"GradeValue"];

    
    return YES;
}

@end
