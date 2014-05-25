//
//  StoreMapViewController.m
//  PointP
//
//  Created by loic Queruel on 08/06/11.
//  Copyright 2011 mobicrea. All rights reserved.
//

#import "StoreMapViewController.h"
#import "AnnotationM1.h"

@implementation StoreMapViewController

@synthesize mapView, mapAnnotations;
@synthesize zoomLat, zoomLon, man;
@synthesize lati, longi;
@synthesize adresse,ville,cdpos,nom;




-(void)viewWillAppear:(BOOL)animated
{
    
    [self.navigationController setNavigationBarHidden:NO];
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    zoomLat = 0.1; // Change By Amrita For issue 3857
	zoomLon = 0.1;
    
	man = [[CLLocationManager alloc] init];
	man.delegate = self;
	[man setDesiredAccuracy:kCLLocationAccuracyKilometer];
	man.distanceFilter = 1000;
	
	[man startUpdatingLocation];
    
    
	[self initMapView];
	
	mapView.showsUserLocation = YES;
	mapView.hidden = NO;
    //  self.mapView.userLocation.coordinate.latitude
    
}

-(void) dealloc
{
    //    man = nil;
    //    mainDelegate = nil;
    mapView.delegate = nil;
    mapView.showsUserLocation = NO;
    [mapView removeAnnotations:mapView.annotations];
    man.delegate = nil;
    
}

- (void)initMapView
{

		MKCoordinateRegion region;
		MKCoordinateSpan span;
		span.latitudeDelta=zoomLat;
		span.longitudeDelta=zoomLon;
		
		CLLocationCoordinate2D location;
		location.latitude = lati; //48.857;
		location.longitude = longi; //2.351;
		region.span=span;
		region.center=location;
		
		[self.mapView setRegion:region animated:NO];
		[self.mapView regionThatFits:region];
		self.mapView.tag = 50;
        
        
        NSMutableArray *mapAnno = [[NSMutableArray alloc] init];
        AnnotationM1 *newAnnotation = [[AnnotationM1 alloc] init];
        newAnnotation.location = location;
        newAnnotation.title = nom;
        newAnnotation.subtitle = adresse;
        [mapAnno addObject:newAnnotation];
        [self.mapView setSelectedAnnotations:mapAnno];
        
        [self.mapView removeAnnotations:self.mapView.annotations];  // remove any annotations that exist
        [self.mapView addAnnotations:mapAnno];
        [self.mapView setSelectedAnnotations:mapAnno];

}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
 
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(AnnotationM1 *)annotation
{
	// if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
	
	if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
		return nil;
	}
	
	NSString *AnnotationIdentifier = [NSString stringWithFormat:@"AnnotationIdentifier%@",annotation.idAnno];
	MKAnnotationView *pinView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
	if (!pinView)
	{
        
		MKAnnotationView* customPinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
		
        [customPinView setImage: [UIImage imageNamed:@"zip_code_marker.png"]];
		customPinView.canShowCallout = YES;
        
		return customPinView;
	}
	else
	{
		pinView.annotation = annotation;
	}
	return pinView;
}


- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
	
	MKAnnotationView *aV;
	for (aV in views) {
		//AnnotationM1 *annotation = (AnnotationM1 *) aV.annotation;
        CGRect endFrame = aV.frame;
        aV.frame = CGRectMake(aV.frame.origin.x, aV.frame.origin.y - 230.0, aV.frame.size.width, aV.frame.size.height);
        [aV setFrame:endFrame];
		
	}
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

// Added by Amrita 10th Sept For Portrait mode only
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
    return YES;
}


- (IBAction)doneBtnClicked:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
