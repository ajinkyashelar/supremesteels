//
//  StoreMapViewController.h
//  PointP
//
//  Created by loic Queruel on 08/06/11.
//  Copyright 2011 mobicrea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface StoreMapViewController : UIViewController < MKMapViewDelegate, CLLocationManagerDelegate>{
    
    
    IBOutlet MKMapView *mapView;
    NSMutableArray *mapAnnotations;
    CLLocationManager *man;
    CGFloat zoomLat;
	CGFloat zoomLon;
    double lati;
    double longi;
    NSString *adresse;
    NSString *nom;

}
- (IBAction)doneBtnClicked:(id)sender;
@property (nonatomic,strong) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) NSMutableArray *mapAnnotations;
@property (nonatomic,strong) CLLocationManager *man;
@property (nonatomic) double lati;
@property (nonatomic) double longi;
@property CGFloat zoomLat;
@property CGFloat zoomLon;
@property (nonatomic,strong) NSString *cdpos;
@property (nonatomic,strong) NSString *ville;
@property (nonatomic,strong) NSString *adresse;
@property (nonatomic,strong) NSString *nom;


- (void)initMapView;

@end
