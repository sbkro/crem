//
//  CRExecCommandFactoryTest.m
//  crem
//
//  Created by sbkro on 2012/09/01.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//

#import "CRExecCommandFactoryTest.h"

@interface CRExecCommandFactory (Local)
// Test for createInstance.
- (void) _checkCreatedInstanceWithCommand: (NSString *) command instanceName: (NSString *) name;
- (void) _checkCreatedInstanceWithInvalidCommand: (NSString *) command;

// Test for _initDictionary
- (void) _checkInitDictNormalCaseWithKey:(NSString *) key expectValue:(NSString *) value;
- (void) _checkInitDictAbNormalCase:(NSString *) key;
@end

@implementation CRExecCommandFactoryTest

// Test for sharedFactory.
- (void) testSharedFactory
{
	CRExecCommandFactory * factory1 = [CRExecCommandFactory sharedFactory];
	CRExecCommandFactory * factory2 = [CRExecCommandFactory sharedFactory];
	
	STAssertNotNil(factory1, @"CRExecCommandFactory instance is nil.");
	STAssertEqualObjects(factory1, factory2, @"CRExecCommandFactory is not singleton.");
}

// Test for createInstace:command.
- (void) testCreateInstance
{
	// Normal test
	[self _checkCreatedInstanceWithCommand:@"version" instanceName:@"CRExecVersionCommand"];
	[self _checkCreatedInstanceWithCommand:@"help"    instanceName:@"CRExecHelpCommand"];
	
	// Abnormal test
	[self _checkCreatedInstanceWithInvalidCommand:@""];
	[self _checkCreatedInstanceWithInvalidCommand:@"Not exist command"];
	[self _checkCreatedInstanceWithInvalidCommand:nil];
}

- (void) test_initDictionary
{
	NSMutableDictionary * dict = [[CRExecCommandFactory sharedFactory] valueForKey:@"_commandDictionary"];
	
	// Normal test
	STAssertNotNil(dict, @"_commandDictionary is nil.");
	[self _checkInitDictNormalCaseWithKey:[dict objectForKey:@"version"] expectValue:@"CRExecVersionCommand"];
	[self _checkInitDictNormalCaseWithKey:[dict objectForKey:@"help"]    expectValue:@"CRExecHelpCommand"];
	[self _checkInitDictNormalCaseWithKey:[dict objectForKey:@"add"]     expectValue:@"CRExecAddReminderCommand"];
	
	// Abnormal test
	[self _checkInitDictAbNormalCase:[dict objectForKey:@"Not exist key"]];
	[self _checkInitDictAbNormalCase:[dict objectForKey:@""]];
	[self _checkInitDictAbNormalCase:[dict objectForKey:nil]];
}

#pragma mark - Category (Local)

- (void) _checkCreatedInstanceWithCommand: (NSString *) command instanceName: (NSString *) name
{
	id obj = [[CRExecCommandFactory sharedFactory] createInstance:command];
	STAssertNotNil(obj, [NSString stringWithFormat:@"Failed to create instance. (command = %@)", command]);
	NSString * className = NSStringFromClass([obj class]);
	STAssertTrue([className isEqualToString:name], [NSString stringWithFormat:@"Command object is invalid.(%@,%@)",className, name]);
}

- (void) _checkCreatedInstanceWithInvalidCommand: (NSString *) command
{
	id obj = [[CRExecCommandFactory sharedFactory] createInstance:command];
	STAssertNil(obj, [NSString stringWithFormat:@"Create to instance. (command = %@)", command]);
}

- (void) _checkInitDictNormalCaseWithKey:(NSString *) key expectValue:(NSString *) value
{
	NSString * msg = [[NSString stringWithFormat:@"Failed to get Instance (key = %@, value = %@)", key, value] autorelease];
	STAssertEquals(key, value, msg);
}

- (void) _checkInitDictAbNormalCase:(NSString *) key
{
	NSString * msg = [[NSString stringWithFormat:@"_commandDictionary is invalid. (key = %@)", key] autorelease];
	STAssertNil(key, msg);
}


@end
