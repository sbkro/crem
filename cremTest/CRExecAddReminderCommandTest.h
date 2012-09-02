//
//  CRExecAddReminderCommandTest.h
//  crem
//
//  Created by sbkro on 2012/09/02.
//  Copyright (c) 2012年 sbkro. All rights reserved.
//


// ------------------------------------------------------------------------------------
//  Header files
// ------------------------------------------------------------------------------------
#import <SenTestingKit/SenTestingKit.h>
#import "CRExecAddReminderCommand.h"


// ------------------------------------------------------------------------------------
//  Unit test code for CRExecAddReminderCommand
// ------------------------------------------------------------------------------------
@interface CRExecAddReminderCommandTest : SenTestCase

// Test for execute. (Normal test)
- (void) testExecuteNormal;

// Test for execute. (Abnormal test)
- (void) testExecuteAbnormal;

@end
