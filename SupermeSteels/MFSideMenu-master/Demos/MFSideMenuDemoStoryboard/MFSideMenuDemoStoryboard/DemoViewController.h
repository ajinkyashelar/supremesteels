//
//  DemoViewController.h
//  MFSideMenuDemoStoryboard
//
//  Created by Michael Frederick on 4/9/13.
//  Copyright (c) 2013 Michael Frederick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *videoView;
- (IBAction)showLeftMenuPressed:(id)sender;

@end
