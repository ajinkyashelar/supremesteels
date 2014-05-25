#import <MapKit/MKAnnotation.h>
@interface AnnotationM1 : NSObject <MKAnnotation>
{
    UIImage *image;
    NSNumber *latitude;
    NSNumber *longitude;
	
	NSNumber *idAnno;
	NSString *title;
	NSString *subtitle;
	
	CLLocationCoordinate2D location;
}

@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) NSNumber *latitude;
@property (nonatomic,strong) NSNumber *longitude;
@property (nonatomic,strong) NSNumber *idAnno;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property CLLocationCoordinate2D location;
@property (nonatomic,strong) NSNumber *isEnstock;

- (NSNumber *)getIdAnno;

@end


