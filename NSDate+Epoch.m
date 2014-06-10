//
//  NSDate+Epoch.m
//
//  Created by Dmitriy on 6/9/14.
//
//

#import "NSDate+Epoch.h"
#import "NSDate+Utilities.h"

static NSDate* epochMark = nil;

@implementation NSDate (Epoch)

+ (void) initialize
{
    // set Epoch to 1970 when class first called
    epochMark = [NSDate dateWithTimeIntervalSince1970:0];
}

+ (void) setEpochMark:(NSDate*)aMark
{
    epochMark = aMark;
}

+ (NSDate*) dateOnDay:(NSInteger)daysSinceEpoch
{
    NSAssert( epochMark!=nil, @"epochMark not initialized");
    return [epochMark dateByAddingDays:daysSinceEpoch];
}

- (NSInteger) daysSinceEpoch
{
    return [self daysAfterDate:epochMark];
}

@end
