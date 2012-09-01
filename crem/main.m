//
//  main.m
//  crem
//
//  Created by sbkro on 2012/08/29.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//

// ------------------------------------------------------------------------------------
//  Header files
// ------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
#import "CRExecCommandFactory.h"
#import "CRExecCommand.h"


// ------------------------------------------------------------------------------------
//  Define Macro
// ------------------------------------------------------------------------------------
#define DEFAULT_COMMAND @"help"
#define ARG_CMD_NUM     1
#define ARG_CMD_NAME    2


// ------------------------------------------------------------------------------------
//  Main funciton.
// ------------------------------------------------------------------------------------
int main(int argc, const char * argv[])
{

	@autoreleasepool {
		id<CRExecCommand> command;
		NSString * commandName;

		// Get command name from command line arguments.
		if (argc < ARG_CMD_NUM) {
			commandName = DEFAULT_COMMAND;
		} else {
			commandName = [NSString stringWithCString:argv[ARG_CMD_NAME] encoding:NSUTF8StringEncoding];
		}
		
		// Create CRExecCommand class
		// If you failed to create CRExecCommand, display help page.
		if ((command = [[CRExecCommandFactory sharedFactory] createInstance:commandName]) == nil) {
			command = [[CRExecCommandFactory sharedFactory] createInstance:DEFAULT_COMMAND];
		}
		
		// Execute command
		[command execute:argc arguments:argv];
	}
	
    return 0;
}

