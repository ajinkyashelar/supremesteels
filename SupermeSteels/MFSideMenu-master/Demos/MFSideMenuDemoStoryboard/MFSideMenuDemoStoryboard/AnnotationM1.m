
#import "AnnotationM1.h"

@implementation AnnotationM1 

@synthesize image, idAnno, title, subtitle;
@synthesize latitude;
@synthesize longitude;
@synthesize location;
@synthesize isEnstock;

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = self.location.latitude;
    theCoordinate.longitude = self.location.longitude;
    return theCoordinate; 
}

- (NSNumber *)getIdAnno
{
	return self.idAnno;
}



@end
