//
//  ContactViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 27/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import "ContactViewController.h"
#import "MFSideMenu.h"
#import "AnnotationM1.h"
#import "StoreMapViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface ContactViewController ()

@end

@implementation ContactViewController
@synthesize mapView;
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
	self.navigationItem.title = @"Contact us";
    [self setupMenuBarButtonItems];
    
    [self initMapView];
	
	mapView.showsUserLocation = YES;
	mapView.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initMapView
{
	if(self.mapView.tag != 50){
		MKCoordinateRegion region;
		MKCoordinateSpan span;
		span.latitudeDelta=0.1;
		span.longitudeDelta=0.1;
		
		CLLocationCoordinate2D location;
		location.latitude = 18.791983;
		location.longitude = 73.34554;
		region.span=span;
		region.center=location;
		
		[self.mapView setRegion:region animated:NO];
		[self.mapView regionThatFits:region];
		self.mapView.tag = 50;
        
        
        NSMutableArray *mapAnno = [[NSMutableArray alloc] init];
        AnnotationM1 *newAnnotation = [[AnnotationM1 alloc] init];
        newAnnotation.location = location;
        newAnnotation.title = @"Supreme Special Steels";
        newAnnotation.subtitle = @"Village Vihar, Opp. Khopoli Railway Station. Khopoli,";
        [mapAnno addObject:newAnnotation];
        [self.mapView setSelectedAnnotations:mapAnno];
        
        [self.mapView removeAnnotations:self.mapView.annotations];  // remove any annotations that exist
        [self.mapView addAnnotations:mapAnno];
        [self.mapView setSelectedAnnotations:mapAnno];
        
	}
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    StoreMapViewController * sMapVC = [segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"corporate"])
    {
        sMapVC.lati = 19.1145829;
        sMapVC.longi = 73.008555;
        sMapVC.adresse = @"Supreme Special Steels";
        sMapVC.nom = @"R-223, M.I.D.C. Complex, Rabale, Thane Belapur Road, Navi Mumbai - 400 701. Maharashtra, INDIA.";
    }
    else if ([segue.identifier isEqualToString:@"works"])
    {
        sMapVC.lati = 18.791983;
        sMapVC.longi = 73.34554;
        sMapVC.nom = @"Supreme Special Steels";;
        sMapVC.adresse = @"Village Vihar, Opp. Khopoli Railway Station. Khopoli,";
        
    }
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


#pragma mark FeedBackMail
// Displays an email composition interface inside the application. Populates all the Mail fields.
-(void)displayComposerSheet
{
	
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    //MailCompose *picker = [[MailCompose alloc] init];
	picker.mailComposeDelegate = self;
    
    NSString *emailSubject = @"";
    
    NSArray *toRecipents = [NSArray arrayWithObject:@"info@supremesteels.com"];
	
    emailSubject = [NSString stringWithFormat:@"Supreme Steels Enquiry"];
    
    
    NSMutableString *HTMLBody = [[NSMutableString alloc] initWithFormat:@""];
    [HTMLBody appendFormat:@"</ul>"];
    
	[picker setSubject:emailSubject ];
    [picker setToRecipients:toRecipents ];
	[picker setMessageBody:HTMLBody isHTML:YES];
    //    picker.navigationBar.tintColor = [UIColor colorWithRed:(float)231/255 green:(float)79/255 blue:(float)17/255 alpha:1];
	[self presentViewController:picker animated:YES completion:nil];
}

// Launches the Mail application on the device.
- (void)launchMailAppOnDevice
{
    NSString* recipients = [NSString stringWithFormat:@"mailto:%@?&subject=%@",@"info@supremesteels.com",  @"Supreme Steels Enquiry"];
    
    NSMutableString *HTMLBody = [[NSMutableString alloc] initWithFormat:@""]; // Added     [HTMLBody appendFormat:@"</ul>"];
	
    
	NSString *body = [NSString stringWithFormat:@"?&body=%@",HTMLBody];
	NSString *email = [NSString stringWithFormat:@"%@%@",recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    NSString *message;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
        {
            
            message=NSLocalizedString(@"Result: Mail canceled", nil);
        }
			break;
		case MFMailComposeResultSaved:
        {
            message=NSLocalizedString(@"Result: Mail saved", nil);
        }
			break;
		case MFMailComposeResultSent:
        {
            message=NSLocalizedString(@"Result: Mail sent", nil);
        }
			break;
		case MFMailComposeResultFailed:
        {
            message=NSLocalizedString(@"Result: Mail failed", nil);
        }
			break;
		default:
        {
            message=NSLocalizedString(@"Result: Mail not sent", nil);
        }
			break;
	}
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
//    [alert show];
//    alert.delegate = nil;
    
	[self dismissViewControllerAnimated:YES completion:nil];
}




- (IBAction)feedBackBtnClicked:(id)sender {
    
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet];
		}
		else
		{
			[self launchMailAppOnDevice];
		}
	}
	else
	{
		[self launchMailAppOnDevice];
	}

}
@end
