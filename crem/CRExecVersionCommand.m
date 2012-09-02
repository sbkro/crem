//
//  CRExecVersionCommand.m
//  crem
//
//  Created by sbkro on 2012/09/01.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//

// ------------------------------------------------------------------------------------
//  Header file
// ------------------------------------------------------------------------------------
#import "CRExecVersionCommand.h"


// ------------------------------------------------------------------------------------
//  Macro
// ------------------------------------------------------------------------------------
#define VERSION    "0.1.0"       // module version
#define BUILD_DATE "2012/09/02"  // build date


// ------------------------------------------------------------------------------------
//  Implemantation
// ------------------------------------------------------------------------------------
@implementation CRExecVersionCommand

// display ver info.
- (void) execute:(int) argc arguments:(const char * []) argv
{
	printf("\ncrem (Command Line Reminder for OSX) version %s (%s)", VERSION, BUILD_DATE);
	printf("\nCopyright (c) 2012 sbkro-apps. All rights reserved.");
	printf("\n\n");
}

@end
