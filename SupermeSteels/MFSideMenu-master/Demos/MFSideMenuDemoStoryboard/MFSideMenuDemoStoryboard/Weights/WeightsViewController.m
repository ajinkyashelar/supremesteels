//
//  WeightsViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 27/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import "WeightsViewController.h"
#import "MFSideMenu.h"
@interface WeightsViewController ()

@end

@implementation WeightsViewController
@synthesize densityLable, diameterTxtField, lengthTxtField, volumeLable, surfaceAreaLable, weightLable, weightPoundsLable, convertUnits;
@synthesize keyboardDismissGestureRecognizer;
@synthesize convertRatioDiameter;
@synthesize convertRatioLength;
@synthesize diameterConversionBtn, lengthConversionBtn, unitConversionPickerViewDiameter, unitConversionPickerViewLength;
@synthesize resultVIew;
@synthesize diameterConvLable, lengthConvLable;
@synthesize diaLengthLable;
@synthesize convertDiameter, convertLength;
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
	self.title = @"Weights";
    [self setupMenuBarButtonItems];
    
    convertRatioDiameter = 1.0f;
    convertRatioLength = 1.0f;
    
    convertUnits = @[@"Meter", @"Milimeter",
                       @"Inches",];
    
    [diameterTxtField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [lengthTxtField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    if(keyboardDismissGestureRecognizer == nil)
    {
        keyboardDismissGestureRecognizer = [[UITapGestureRecognizer alloc]
                                            initWithTarget:self
                                            action:@selector(dismissKeyboard)];
        keyboardDismissGestureRecognizer.cancelsTouchesInView = NO;
        
        [self.view addGestureRecognizer:keyboardDismissGestureRecognizer];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    unitConversionPickerViewDiameter.hidden = YES;
    unitConversionPickerViewLength.hidden = YES;
    resultVIew.hidden = YES;
    
    double density =     [[NSUserDefaults standardUserDefaults] doubleForKey:@"DensityValue"];
    NSString * grade =     [[NSUserDefaults standardUserDefaults] stringForKey:@"GradeValue"];
    
    NSString * densityStr = [NSString ConvertoNumberFormate:[NSString stringWithFormat:@"%f", density]];
    
    densityLable.text = [NSString stringWithFormat:@"Density = %@ g/cm\u00B3 (%@)", densityStr, grade];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Left Button
- (void)showLeftMenuPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (void)showRightMenuPressed:(id)sender {
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
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
        self.navigationItem.rightBarButtonItem = [self rightMenuBarButtonItem];
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

- (UIBarButtonItem *)rightMenuBarButtonItem {
    UIBarButtonItem * rightBarButton =  [[UIBarButtonItem alloc]
                                        initWithTitle:@"Grades"
                                         style:UIBarButtonItemStyleBordered
                                        target:self
                                        action:@selector(showRightMenuPressed:)];
    [rightBarButton setTintColor:[UIColor redColor]];
    
    return rightBarButton;
}

- (UIBarButtonItem *)backBarButtonItem {
    UIBarButtonItem * leftbackButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-arrow.png"]
                                                                        style:UIBarButtonItemStyleBordered
                                                                       target:self
                                                                       action:@selector(backButtonPressed:)];
    [leftbackButton setTintColor:[UIColor darkGrayColor]];
    return leftbackButton;
}


#pragma mark Calculations
-(double)calculateVolumeWithDiameter:(double)diameter andLength:(double)length
{
    double volume = 0.0;
    
    volume = (22 * diameter*convertRatioDiameter * diameter*convertRatioDiameter * length*convertRatioLength) / (4*7) ;
    
    return volume;
}

-(double)calculateSurfaceAreaWithDiameter:(double)diameter andLength:(double)length;
{
    double surfaceArea = 0.0;
    
    surfaceArea = ((22 * diameter*convertRatioDiameter * diameter*convertRatioDiameter)/(2*7)) + ((22 * diameter*convertRatioDiameter * length*convertRatioLength)/7);
    
    return surfaceArea;
}

-(double)calculateWeightWithVolume:(double)volume andDensity:(double)density
{
    double weight = 0.0;
    
    weight = volume * density * 1000;
    
    return weight;
}

-(double)calculateWeightInPounds:(double)weightInKg
{
    double weight = 0.0;
    
    weight = weightInKg * Pounds;
    
    return weight;
}


-(BOOL)validateFields
{
    if([diameterTxtField.text isEqualToString:@""])
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please enter Diameter" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [diameterTxtField becomeFirstResponder];
        return NO;
    }
    else if([lengthTxtField.text isEqualToString:@""])
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please enter Length" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [lengthTxtField becomeFirstResponder];
        return NO;
    }
    else
        return YES;
}

- (IBAction)caculateValues:(id)sender
{
    if ([self validateFields])
    {
        self.resultVIew.hidden = NO;
        
        [self.view bringSubviewToFront:resultVIew];
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
            [resultVIew setFrame:CGRectMake(134 , 0 , resultVIew.frame.size.width,resultVIew.frame.size.height)];
        else
            [resultVIew setFrame:CGRectMake(10 , 0 , resultVIew.frame.size.width,resultVIew.frame.size.height)];
        [UIView beginAnimations:@"openAddQuantity" context:nil];
        [UIView setAnimationDuration:0.4];
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
            [resultVIew setFrame:CGRectMake(134, 324, resultVIew.frame.size.width,resultVIew.frame.size.height)];
        else
            [resultVIew setFrame:CGRectMake(10, 135, resultVIew.frame.size.width,resultVIew.frame.size.height)];
        [UIView commitAnimations];

        double volume = [self calculateVolumeWithDiameter:[diameterTxtField.text doubleValue] andLength:[lengthTxtField.text doubleValue]];
        double surfaceArea = [self calculateSurfaceAreaWithDiameter:[diameterTxtField.text doubleValue] andLength:[lengthTxtField.text doubleValue]];
        
        double density =     [[NSUserDefaults standardUserDefaults] doubleForKey:@"DensityValue"];
        
        double weight = [self calculateWeightWithVolume:volume andDensity:density];
        
        double weightPounds = [self calculateWeightInPounds:weight];;
        
        volumeLable.text = [NSString stringWithFormat:@"%@ m\u00B3", [NSString ConvertoMaxThreeDecimalNumberFormate:[NSString stringWithFormat:@"%f", volume]]];
        surfaceAreaLable.text = [NSString stringWithFormat:@"%@ m\u00B2", [NSString ConvertoMaxThreeDecimalNumberFormate:[NSString stringWithFormat:@"%f", surfaceArea]]];
        weightLable.text = [NSString stringWithFormat:@"%@ Kgs", [NSString ConvertoMaxThreeDecimalNumberFormate:[NSString stringWithFormat:@"%f", weight]]];
        weightPoundsLable.text = [NSString stringWithFormat:@"%@ Lbs", [NSString ConvertoMaxThreeDecimalNumberFormate:[NSString stringWithFormat:@"%f", weightPounds]]];
        diaLengthLable.text = [NSString stringWithFormat:@"Diameter : %@ %@ & Length : %@ %@", diameterTxtField.text,diameterConvLable.text,lengthTxtField.text, lengthConvLable.text];
    }
    
}

- (IBAction)doneCalculateView:(id)sender
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        [resultVIew setFrame:CGRectMake(134, 324, resultVIew.frame.size.width,resultVIew.frame.size.height)];
    else
        [resultVIew setFrame:CGRectMake(10, 135, resultVIew.frame.size.width,resultVIew.frame.size.height)];
    [UIView beginAnimations:@"openAddQuantity" context:nil];
    [UIView setAnimationDuration:0.6];
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        [resultVIew setFrame:CGRectMake(134, 1124, resultVIew.frame.size.width,resultVIew.frame.size.height)];
    else
        [resultVIew setFrame:CGRectMake(10, 600, resultVIew.frame.size.width,resultVIew.frame.size.height)];
    
    [UIView commitAnimations];
}



#pragma mark text field

-(void)textFieldDidChange:(UITextField*)textField
{
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{

    
}


- (void) dismissKeyboard
{
    [self performSelector:@selector(dismissKeyboardSelector) withObject:nil afterDelay:0.01];
    
    unitConversionPickerViewDiameter.hidden = YES;
    unitConversionPickerViewLength.hidden = YES;
    convertLength = NO;
    convertDiameter = NO;
    
}

- (void) dismissKeyboardSelector
{
    [self.view endEditing:YES];

}


#pragma mark Picker View

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return convertUnits.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return convertUnits[row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    if (convertDiameter)
    {
        switch (row) {
            case 0:
                convertRatioDiameter = 1.0f;
                diameterConvLable.text = @"m";
                break;
            case 1:
                convertRatioDiameter = 0.001f;
                diameterConvLable.text = @"mm";
                break;
            case 2:
                convertRatioDiameter = 0.0254f;
                diameterConvLable.text = @"Inch";
                break;
                
            default:
                break;
        }
        
    }
    else if (convertLength)
    {
        switch (row) {
            case 0:
                convertRatioLength = 1.0f;
                lengthConvLable.text = @"m";
                break;
            case 1:
                convertRatioLength = 0.001f;
                lengthConvLable.text = @"mm";
                break;
            case 2:
                convertRatioLength = 0.0254f;
                lengthConvLable.text = @"Inch";
                break;
                
            default:
                break;
        }
    }
    
}



- (IBAction)diameterConversion:(id)sender
{
    unitConversionPickerViewDiameter.hidden = NO;
    convertDiameter = YES;
}

- (IBAction)lengthConversion:(id)sender
{
    unitConversionPickerViewLength.hidden = NO;
    convertLength = YES;
}

@end
