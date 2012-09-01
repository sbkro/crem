//
//  CRExecCommandFactory.m
//  crem
//
//  Created by sbkro on 2012/09/01.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//


// ------------------------------------------------------------------------------------
//  Header files
// ------------------------------------------------------------------------------------
#import "CRExecCommandFactory.h"


// ------------------------------------------------------------------------------------
//  Const variables
// ------------------------------------------------------------------------------------
static CRExecCommandFactory * _sharedInstace;


// ------------------------------------------------------------------------------------
//  Category
// ------------------------------------------------------------------------------------

// Local
@interface CRExecCommandFactory (Local)

// Initialized |_commandDictionary|.
// If you add CRExecCommand subclass, edit hashmap(|_commandDictionary|) in this method.
- (void) _initDictionary;
@end


// ------------------------------------------------------------------------------------
//  Implementation
// ------------------------------------------------------------------------------------
@implementation CRExecCommandFactory

#pragma mark - Class methods

+ (CRExecCommandFactory *) sharedFactory
{
	if (_sharedInstace == nil) {
		_sharedInstace = [[CRExecCommandFactory alloc] init];
	}
	
	return _sharedInstace;
}

#pragma mark - Instance methods

- (id) init
{
	self = [super init];
	
	if (self == nil) {
		return nil;
	}
	
	[self _initDictionary];
	
	return self;
}

- (void) dealloc
{
	[_commandDictionary release], _commandDictionary = nil;
	[super dealloc];
}

- (id <CRExecCommand>) createInstance:(NSString *) command
{
	if (command == nil || [command length] == 0) {
		return nil;
	}
	Class clazz = NSClassFromString([_commandDictionary objectForKey:command]);
	id <CRExecCommand> obj = [[clazz alloc] init];

	return obj;
}

#pragma mark - Category (Local)

- (void) _initDictionary
{
	_commandDictionary = [[[NSMutableDictionary alloc] init] retain];
	[_commandDictionary setObject:@"CRExecHelpCommand"    forKey:@"help"];
	[_commandDictionary setObject:@"CRExecVersionCommand" forKey:@"version"];
}

@end
