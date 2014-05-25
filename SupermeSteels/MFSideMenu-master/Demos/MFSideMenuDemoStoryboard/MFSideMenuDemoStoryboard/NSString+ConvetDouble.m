//
//  NSString+ConvetDouble.m
//  POint.P
//
//  Created by Saint-Gobain Indec on 5/21/12.
//  Copyright (c) 2012 Saint-Gobain. All rights reserved.
//

#import "NSString+ConvetDouble.h"

@implementation NSString (ConvetDouble)

+(double)convertTodouble:(NSString *)value
{
    double val=0;
    NSScanner *scan=[NSScanner scannerWithString:value];
    [scan scanDouble:&val];
    return val;
}
+(NSString*)ConvetToString:(double)value
{
    return [NSString stringWithFormat:@"%.2f",value];
}
+(int)convertToInt:(NSString *)value
{
    int val=0;
    NSScanner *scan=[NSScanner scannerWithString:value];
    [scan scanInt:&val];
    return val;
}

+(NSString *)ConvertoNumberFormate:(NSString *)value
{
    NSNumber *myNumber=[NSNumber numberWithDouble:[NSString convertTodouble:value]];
    NSString *floatString = [myNumber stringValue];
    NSArray *floatStringComps;
    
    NSCharacterSet * setDot = [NSCharacterSet characterSetWithCharactersInString:@"."];
    NSCharacterSet * setComma = [NSCharacterSet characterSetWithCharactersInString:@","];
    
    
    if ([floatString rangeOfCharacterFromSet:setComma].location != NSNotFound)
        
    {
        floatStringComps = [floatString componentsSeparatedByString:@","];
    }
    else
    {
        if ([floatString rangeOfCharacterFromSet:setDot].location != NSNotFound)
        {
            floatStringComps = [floatString componentsSeparatedByString:@"."];
        }
    }
    
     int numberOfDecimalPlaces = [[floatStringComps objectAtIndex:1] length];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterNoStyle];
    [formatter setMaximumFractionDigits:2];
    if (numberOfDecimalPlaces>0) 
        [formatter setMinimumFractionDigits:2];
    else
        [formatter setMinimumFractionDigits:0];
    
    [formatter setLocale:[NSLocale currentLocale]];
    

    NSString *resultQuantity = [formatter stringFromNumber:myNumber];
    resultQuantity = [resultQuantity stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceAndNewlineCharacterSet]];
    
    NSString* appendZero;
    
    if ([[floatStringComps objectAtIndex:0] isEqualToString:@"0"])
    {
        NSString * zero = [NSString stringWithFormat:@"0"];
        appendZero  = [zero stringByAppendingString:resultQuantity];
        resultQuantity = appendZero;
    }
    return resultQuantity;
}

+(NSString *)ConvertoMaxThreeDecimalNumberFormate:(NSString *)value
{
    NSNumber *myNumber=[NSNumber numberWithDouble:[NSString convertTodouble:value]];
    NSString *floatString = [myNumber stringValue];
    NSArray *floatStringComps;
    
    NSCharacterSet * setDot = [NSCharacterSet characterSetWithCharactersInString:@"."];
    NSCharacterSet * setComma = [NSCharacterSet characterSetWithCharactersInString:@","];
    
    
    if ([floatString rangeOfCharacterFromSet:setComma].location != NSNotFound)
        
    {
        floatStringComps = [floatString componentsSeparatedByString:@","];
    }
    else
    {
        if ([floatString rangeOfCharacterFromSet:setDot].location != NSNotFound)
        {
            floatStringComps = [floatString componentsSeparatedByString:@"."];
        }
    }
    
    int numberOfDecimalPlaces = [[floatStringComps objectAtIndex:1] length];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterNoStyle];
    [formatter setMaximumFractionDigits:3];
    if (numberOfDecimalPlaces>0)
        [formatter setMinimumFractionDigits:2];
    else
        [formatter setMinimumFractionDigits:0];
    
    [formatter setLocale:[NSLocale currentLocale]];
    
    
    NSString *resultQuantity = [formatter stringFromNumber:myNumber];
    resultQuantity = [resultQuantity stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceAndNewlineCharacterSet]];
    
    NSString* appendZero;
    
    if ([[floatStringComps objectAtIndex:0] isEqualToString:@"0"])
    {
        NSString * zero = [NSString stringWithFormat:@"0"];
        appendZero  = [zero stringByAppendingString:resultQuantity];
        resultQuantity = appendZero;
    }
    
    return resultQuantity;
}

+(NSString *)ConvertPriceToMaxThreeDecimalNumberFormate:(NSString *)value
{
    value = [NSString convetCommaToDotFormat:value];
    NSNumber *myNumber=[NSNumber numberWithDouble:[NSString convertTodouble:value]];
    NSString *floatString = [myNumber stringValue];
    NSArray *floatStringComps;
    
    NSCharacterSet * setDot = [NSCharacterSet characterSetWithCharactersInString:@"."];
    NSCharacterSet * setComma = [NSCharacterSet characterSetWithCharactersInString:@","];
    
    
    if ([floatString rangeOfCharacterFromSet:setComma].location != NSNotFound)
        
    {
        floatStringComps = [floatString componentsSeparatedByString:@","];
    }
    else
    {
        if ([floatString rangeOfCharacterFromSet:setDot].location != NSNotFound)
        {
            floatStringComps = [floatString componentsSeparatedByString:@"."];
        }
    }
        
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterNoStyle];
    [formatter setMaximumFractionDigits:3];
    [formatter setMinimumFractionDigits:2];
    
    [formatter setLocale:[NSLocale currentLocale]];
    
    
    NSString *resultQuantity = [formatter stringFromNumber:myNumber];
    resultQuantity = [resultQuantity stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceAndNewlineCharacterSet]];
    
    NSString* appendZero;
    
    if ([[floatStringComps objectAtIndex:0] isEqualToString:@"0"])
    {
        NSString * zero = [NSString stringWithFormat:@"0"];
        appendZero  = [zero stringByAppendingString:resultQuantity];
        resultQuantity = appendZero;
    }
    
    return resultQuantity;
}



+(NSString *)ConvertoPriceFormate:(NSString *)value
{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMinimumFractionDigits:2];
    [formatter setMaximumFractionDigits:2];
    [formatter setLocale:[NSLocale currentLocale]];
    
    NSNumber *myNumber=[NSNumber numberWithDouble:[NSString convertTodouble:value]];
    
    NSString *resultQuantity = [formatter stringFromNumber:myNumber];
    return resultQuantity;
}


+(NSString *)convetCommaToDotFormat:(NSString *)value
{
    
    NSString * modValue = [value stringByReplacingOccurrencesOfString:@"," withString:@"."];
    modValue = [modValue stringByReplacingOccurrencesOfString:@" " withString:@""];

    NSNumber *myNumber=[NSNumber numberWithDouble:[NSString convertTodouble:modValue]];
    NSString *resultQuantity = [NSString stringWithFormat:@"%@",myNumber];
    return resultQuantity;
}


+(NSString *)ConvertoDistanceFormate:(NSString *)value
{
    NSString * distanceInMeterStr = value;
    double  distanceInMeter = [NSString convertTodouble:value];
    double distance = [NSString convertTodouble:value];
    
    NSString * distanceUnit;
    NSArray * charactersOfString;
    
    distanceInMeterStr = [NSString stringWithFormat:@"%f", distanceInMeter/1000];
    
    NSCharacterSet * setDot = [NSCharacterSet characterSetWithCharactersInString:@"."];
    NSCharacterSet * setComma = [NSCharacterSet characterSetWithCharactersInString:@","];
    
    if ([distanceInMeterStr rangeOfCharacterFromSet:setComma].location != NSNotFound)
    {
        charactersOfString = [distanceInMeterStr componentsSeparatedByString:@","];
    }
    else
    {
        if ([distanceInMeterStr rangeOfCharacterFromSet:setDot].location != NSNotFound)
        {
            charactersOfString = [distanceInMeterStr componentsSeparatedByString:@"."];
        }
        
    }
    
    //NSLog(@"charactersOfString : %@", charactersOfString);
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    if ([[charactersOfString objectAtIndex:0] isEqualToString:@"0"])
    {
        //Convert the Distance to M
        distanceInMeterStr = [NSString stringWithFormat:@"%f", distance];
        [formatter setMaximumFractionDigits:0];
        distanceUnit = @"m";
        //NSLog(@"Distance Check M = %@", distanceInMeterStr);
    }
    else
    {
        //Convert the Distance to KM
        distanceInMeterStr = [NSString stringWithFormat:@"%f", distance/1000];
        [formatter setMaximumFractionDigits:1];
        distanceUnit = @"km";
        //NSLog(@"Distance Check KM= %@", distanceInMeterStr);
    }
    
    [formatter setLocale:[NSLocale currentLocale]];
    NSNumber *myNumber=[NSNumber numberWithDouble:[NSString convertTodouble:distanceInMeterStr]];
    NSString *convertedDistance = [formatter stringFromNumber:myNumber];
    
    NSString * resultDistance = [NSString stringWithFormat:@"Distance: %@ %@", convertedDistance, distanceUnit];
    //NSLog(@"Distance Converted = %@", convertedDistance);
    //NSLog(@"Distance Result = %@", resultDistance);
    
    
    return resultDistance;
}
+(NSString *)ConvertoEncodedString:(NSString *)value
{
    NSString *encodedString=value;
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"%" withString:@"%25"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"/" withString:@"%2F"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"–" withString:@"%96"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@":" withString:@"%3a"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@";" withString:@"%3b"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"(" withString:@"%28"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@")" withString:@"%29"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"€" withString:@"%E2%82%AC"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"£" withString:@"%A3"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"'" withString:@"%27"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"\\" withString:@"%5C"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"." withString:@"%2E"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"é" withString:@"%E9"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@">" withString:@"%3E"];
    return encodedString;
}

@end
