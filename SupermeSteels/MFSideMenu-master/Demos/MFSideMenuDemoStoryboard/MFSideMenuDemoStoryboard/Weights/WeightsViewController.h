//
//  WeightsViewController.h
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 27/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeightsViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *densityLable;
@property (weak, nonatomic) IBOutlet UITextField *diameterTxtField;
@property (weak, nonatomic) IBOutlet UITextField *lengthTxtField;
@property (weak, nonatomic) IBOutlet UILabel *volumeLable;
@property (weak, nonatomic) IBOutlet UILabel *surfaceAreaLable;
@property (weak, nonatomic) IBOutlet UILabel *weightLable;
@property (weak, nonatomic) IBOutlet UILabel *weightPoundsLable;
@property (weak, nonatomic) IBOutlet UIButton *diameterConversionBtn;
@property (weak, nonatomic) IBOutlet UILabel *diameterConvLable;
@property (weak, nonatomic) IBOutlet UIButton *lengthConversionBtn;
@property (weak, nonatomic) IBOutlet UILabel *lengthConvLable;
@property (weak, nonatomic) IBOutlet UIPickerView *unitConversionPickerViewDiameter;
@property (weak, nonatomic) IBOutlet UIPickerView *unitConversionPickerViewLength;
@property (weak, nonatomic) IBOutlet UIView *resultVIew;
@property (weak, nonatomic) IBOutlet UILabel *diaLengthLable;

- (IBAction)diameterConversion:(id)sender;
- (IBAction)lengthConversion:(id)sender;



@property (nonatomic, strong) UITapGestureRecognizer *keyboardDismissGestureRecognizer;
@property (strong, nonatomic) NSArray *convertUnits;
@property (nonatomic) double convertRatioDiameter;
@property (nonatomic) double convertRatioLength;
@property (nonatomic) BOOL convertLength;
@property (nonatomic) BOOL convertDiameter;
-(double)calculateVolumeWithDiameter:(double)diameter andLength:(double)length;
-(double)calculateSurfaceAreaWithDiameter:(double)diameter andLength:(double)length;
-(double)calculateWeightWithVolume:(double)volume andDensity:(double)density;
- (IBAction)caculateValues:(id)sender;

- (IBAction)doneCalculateView:(id)sender;
@end
