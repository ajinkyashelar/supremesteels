//
//  NSString+ConvetDouble.h
//  POint.P
//
//  Created by Saint-Gobain Indec on 5/21/12.
//  Copyright (c) 2012 Saint-Gobain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ConvetDouble)
+(double)convertTodouble:(NSString *)value;
+(NSString*)ConvetToString:(double)value;
+(int)convertToInt:(NSString *)value;
+(NSString *)ConvertoNumberFormate:(NSString *)value;
+(NSString *)convetCommaToDotFormat:(NSString *)value;
+(NSString *)ConvertoPriceFormate:(NSString *)value;
+(NSString *)ConvertoDistanceFormate:(NSString *)value;
+(NSString *)ConvertoMaxThreeDecimalNumberFormate:(NSString *)value;
+(NSString *)ConvertPriceToMaxThreeDecimalNumberFormate:(NSString *)value;
+(NSString *)ConvertoEncodedString:(NSString *)value;
@end
