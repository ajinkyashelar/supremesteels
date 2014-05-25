//
//  DemoViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Michael Frederick on 4/9/13.
//  Copyright (c) 2013 Michael Frederick. All rights reserved.
//

#import "DemoViewController.h"
#import "MFSideMenu.h"
#import <MediaPlayer/MediaPlayer.h>

@interface DemoViewController ()
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;
@end

@implementation DemoViewController
@synthesize moviePlayerController;
@synthesize videoView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Home";
    
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Intro" ofType:@"mp4"];
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
    self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [self.moviePlayerController setControlStyle:MPMovieControlStyleNone];
    [self.moviePlayerController.view setFrame:videoView.frame];
    [self.view addSubview:self.moviePlayerController.view];
    
    [self.moviePlayerController play];

}

#pragma mark Left Button
- (IBAction)showLeftMenuPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}



@end
