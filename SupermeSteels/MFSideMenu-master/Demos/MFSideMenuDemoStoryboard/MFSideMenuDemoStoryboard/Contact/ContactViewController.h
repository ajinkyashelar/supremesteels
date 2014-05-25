//
//  ContactViewController.h
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 27/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import <UIKit/UIKit.h>
 #import <MapKit/MapKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ContactViewController : UIViewController <MKMapViewDelegate, MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)feedBackBtnClicked:(id)sender;

@end
