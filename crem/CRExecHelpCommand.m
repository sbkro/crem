//
//  CRExecHelpCommand.m
//  crem
//
//  Created by sbkro on 2012/09/01.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//


// ------------------------------------------------------------------------------------
//  Header files
// ------------------------------------------------------------------------------------
#import "CRExecHelpCommand.h"


// ------------------------------------------------------------------------------------
//  Implemantaion
// ------------------------------------------------------------------------------------
@implementation CRExecHelpCommand

// display usage.
- (void) execute:(int) argc arguments:(const char * []) argv
{
	printf("\nUsage");
	printf("\n  $ crem [command] [option]");
	printf("\n");
	printf("\n[command]");
	printf("\n * add        Add a new reminder.");
	printf("\n  [option]");
	printf("\n   * title:   Title of reminder. (required)");
	printf("\n   * list:    List of reminder. If this parameter ignored, crem use default list.");
	printf("\n");
	printf("\n * version    Display version information.");
	printf("\n * help       Display usage (this screen).");
	printf("\n\n");
}

@end
