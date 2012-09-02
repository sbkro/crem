//
//  CRExecAddReminderCommandTest.m
//  crem
//
//  Created by sbkro on 2012/09/02.
//  Copyright (c) 2012年 sbkro. All rights reserved.
//


// ------------------------------------------------------------------------------------
//  Header files
// ------------------------------------------------------------------------------------
#import "CRExecAddReminderCommandTest.h"


// ------------------------------------------------------------------------------------
//  Category (Local)
// ------------------------------------------------------------------------------------
@interface CRExecAddReminderCommandTest (Local)
- (void) _exetute:(int) argc arguments:(const char * []) argv;

// Normal case
- (void) _testExecuteNormalCase01;
- (void) _testExecuteNormalCase02;
- (void) _testExecuteNormalCase03;

// Abnormal case
- (void) _testExecuteAbormalCase01;
@end


@implementation CRExecAddReminderCommandTest

// Test for execute. (Normal test)
- (void) testExecuteNormal
{
	STAssertNoThrow([self _testExecuteNormalCase01], @"");
	STAssertNoThrow([self _testExecuteNormalCase02], @"");
}

// Test for execute. (Abnormal test)
- (void) testExecuteAbnormal
{
	STAssertNoThrow([self _testExecuteAbormalCase01], @"");
}

#pragma mark - Category (Local)

- (void) _exetute:(int) argc arguments:(const char * []) argv
{
	CRExecAddReminderCommand * command = [[CRExecAddReminderCommand alloc] init];
	[command execute:argc arguments:argv];
}

// -----------------------------------------------------
// Normal test

- (void) _testExecuteNormalCase01
{
	int num_arg = 3;
	int argc = num_arg;
	const char * argv[num_arg];
	
	argv[0] = "command";
	argv[1] = "add";
	argv[2] = "title:hoge";

	[self _exetute:argc arguments:argv];
}

- (void) _testExecuteNormalCase02
{
	int num_arg = 4;
	int argc = num_arg;
	const char * argv[num_arg];
	
	argv[0] = "command";
	argv[1] = "add";
	argv[2] = "title:hoge";
	argv[3] = "list:Inbox";
	
	[self _exetute:argc arguments:argv];
}

- (void) _testExecuteNormalCase03
{
	int num_arg = 5;
	int argc = num_arg;
	const char * argv[num_arg];
	
	argv[0] = "command";
	argv[1] = "add";
	argv[2] = "title:hoge";
	argv[3] = "list:Inbox";
	argv[4] = "aaaaaaaaaa";
	
	[self _exetute:argc arguments:argv];
}

// -----------------------------------------------------
// Abnormal test

- (void) _testExecuteAbormalCase01
{
	int num_arg = 4;
	int argc = num_arg;
	const char * argv[num_arg];
	
	argv[0] = "command";
	argv[1] = "hoge";
	argv[2] = "title:hoge";
	argv[3] = "list:Inbox";
	
	[self _exetute:argc arguments:argv];

}

@end
