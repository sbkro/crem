//
//  CRExecAddReminderCommand.m
//  crem
//
//  Created by sbkro on 2012/09/02.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//


// ------------------------------------------------------------------------------------
//  Header files
// ------------------------------------------------------------------------------------
#import "CRExecAddReminderCommand.h"


// ------------------------------------------------------------------------------------
//  Define Macro
// ------------------------------------------------------------------------------------
#define ARG_CMD_NUM     2
#define ARG_CMD_NAME    1


// ------------------------------------------------------------------------------------
//  Category (Local)
// ------------------------------------------------------------------------------------
@interface CRExecAddReminderCommand (Local)
- (BOOL) _validate:(int)argc arguments:(const char *[])argv;
- (void) _initReminder:(EKReminder *) reminder argCount:(int) argc arguments:(const char * []) argv;
@end


// ------------------------------------------------------------------------------------
//  Implementation
// ------------------------------------------------------------------------------------
@implementation CRExecAddReminderCommand

- (id) init
{
	self = [super init];
	
	if (self == nil) {
		return nil;
	}
	
	_eventStore = [[EKEventStore alloc] initWithAccessToEntityTypes:EKEntityMaskReminder];
	
	return self;
}

- (void) dealloc
{
	[_eventStore release], _eventStore = nil;
	[super dealloc];
}

- (void) execute:(int)argc arguments:(const char *[])argv
{
	if ([self _validate:argc arguments:argv] == NO) {
		printf("Error: invalid parameter.");
		return;
	}
	
	EKReminder * reminder = [EKReminder reminderWithEventStore:_eventStore];
	[self _initReminder:reminder argCount:argc arguments:argv];

	NSError * error;
	if ([_eventStore saveReminder:reminder commit:YES error:&error]) {
		printf("Reminder is added.\n");
	} else {
		printf("Error: %s\n", [[error localizedDescription] UTF8String]);
		return;
	}
}

#pragma mark - Category (Local)

- (BOOL) _validate:(int)argc arguments:(const char *[])argv
{
	if (argc <= 2) {
		return NO;
	}
	
	if (strcmp(argv[1], "add") != 0) {
		return NO;
	}
	
	return YES;
}

- (void) _initReminder:(EKReminder *) reminder argCount:(int) argc arguments:(const char * []) argv
{
	// Required ... title, calendar
	
	// update calender
	reminder.calendar = [_eventStore defaultCalendarForNewReminders];
	
	for (int i =  2; i < argc; i++) {
		NSArray * data = [[NSString stringWithCString:argv[i] encoding:NSUTF8StringEncoding] componentsSeparatedByString:@":"];
		NSString * key = [data objectAtIndex:0];
		NSString * val = [data objectAtIndex:1];

		// Title
		if ([key isEqualToString:@"title"]) {
			reminder.title = val;
			continue;
		}
		
		// List
		if ([key isEqualToString:@"list"]) {
			for (EKCalendar * cal in [_eventStore calendarsForEntityType:EKEntityTypeReminder]) {
				if ([cal.title isEqualToString:val]) {
					reminder.calendar = cal;
					continue;
				}
			}
		}
	}
}

@end
