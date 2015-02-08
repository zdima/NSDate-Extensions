//
//  NSDate+UtilitiesTest.m
//  NSDate+Utilities
//
//  Created by Dmitriy on 8/2/14.
//  Copyright (c) 2014 ZDima. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "NSDate+Utilities.h"
#import "NSDate+Epoch.h"

@interface NSDate_UtilitiesTest : XCTestCase
@end

@implementation NSDate_UtilitiesTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
	
    NSTimeZone* tz = [NSTimeZone defaultTimeZone];
	NSDate* date = [NSDate date];
    NSDate* localTime1970 = [[NSDate dateWithTimeIntervalSince1970:0] dateByAddingMinutes:-tz.secondsFromGMT/60];
	NSInteger days = [date daysSinceEpoch];
	
	XCTAssert( [date isEqualToDate:[[date dateByAddingDays:110] dateBySubtractingDays:110]], "Add/Sub days");
	
	NSInteger distance = -[date distanceInDaysToDate:localTime1970];
	
	XCTAssert( [[date dateAtStartOfDay] isEqualToDate:[[localTime1970 dateByAddingDays:distance] dateAtStartOfDay]], "distanceInDaysToDate/dateByAddingDays");
	
    XCTAssert( [[NSDate dateOnDay:days] isEqualTo:[date dateAtStartOfDay]] , @"[NSDate date] Pass");

	date = [NSDate date];
	const unsigned componentFlags = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit);
	for( int n=0; n < 365; n++ ) {
		for( int hour = 0; hour < 24; hour+=3 ) {
			for( int minute = 0; minute < 60; minute+=3 ) {
				for( int second = 0; second < 60; second+=21 ) {
					NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:date];
					components.hour = hour;
					components.minute = minute;
					components.second = second;
					NSDate* td = [[NSDate currentCalendar] dateFromComponents:components];
					days = [td daysSinceEpoch];
					XCTAssert( [[NSDate dateOnDay:days] isEqualTo:[td dateAtStartOfDay]] , @"%@ Pass", td );
				}
			}
		}
		date = [date dateBySubtractingDays:1];
	}
}

@end
