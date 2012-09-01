//
//  CRExecCommandFactoryTest.h
//  crem
//
//  Created by sbkro on 2012/09/01.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//

// ------------------------------------------------------------------------------------
//  Header files
// ------------------------------------------------------------------------------------
#import <SenTestingKit/SenTestingKit.h>
#import "CRExecCommandFactory.h"


// ------------------------------------------------------------------------------------
//  Unit test code for CRExecCommandFactory
// ------------------------------------------------------------------------------------
@interface CRExecCommandFactoryTest : SenTestCase


// ------------------------------------------------------------------------------------
//  Instance Methods
// ------------------------------------------------------------------------------------

// Test for sharedFactory.
- (void) testSharedFactory;

// Test for createInstace:command.
- (void) testCreateInstance;

@end
