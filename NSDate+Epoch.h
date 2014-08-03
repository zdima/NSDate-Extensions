//
//  NSDate+Epoch.h
//
//  Created by Dmitriy on 6/9/14.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Epoch)

/**
 *  Set Epoch date to use during calculation
 *
 *  @param aMark Epoch date
 */
+ (void) setEpochMark:(NSDate*)aMark;

/**
 *  Create instance of NSDate that daysSinceEpoch days from Epoch
 *
 *  @param daysSinceEpoch days from Epoch
 *
 *  @return return NSDate instance that is daysSinceEpoch from Epoch and time set to at start of day
 */
+ (NSDate*) dateOnDay:(NSInteger)daysSinceEpoch;

/**
 *  Return number of days from Epoch
 *
 *  @return days from Epoch
 */
- (NSInteger) daysSinceEpoch;

@end
