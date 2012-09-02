//
//  CRExecAddReminderCommand.h
//  crem
//
//  Created by sbkro on 2012/09/02.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//


// ------------------------------------------------------------------------------------
//  Header files
// ------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>
#import "CRExecCommand.h"


// ------------------------------------------------------------------------------------
//  
// ------------------------------------------------------------------------------------
@interface CRExecAddReminderCommand : NSObject <CRExecCommand>
{
	@private
	EKEventStore * _eventStore;
}

// Add a new reminder.
- (void) execute:(int)argc arguments:(const char *[])argv;

@end
