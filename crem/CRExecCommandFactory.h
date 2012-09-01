//
//  CRExecCommandFactory.h
//  crem
//
//  Created by sbkro on 2012/09/01.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//

// ------------------------------------------------------------------------------------
//  Header files
// ------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
#import "CRExecCommand.h"

// ------------------------------------------------------------------------------------
//  Factory class for CRExecCommand.
//  This class provide a function to create subclass of "CRExecCommand".
//  And this is a singleton class. You can get a instance using |sharedFactory|.
// ------------------------------------------------------------------------------------
@interface CRExecCommandFactory : NSObject
{
	@private
	NSMutableDictionary * _commandDictionary;  // Hashmap for args and CRExecCommand subclass name.
}

// ------------------------------------------------------------------------------------
//  Class methods
// ------------------------------------------------------------------------------------

// Singleton method.
+ (CRExecCommandFactory *) sharedFactory;

// ------------------------------------------------------------------------------------
//  Instance methods
// ------------------------------------------------------------------------------------

// Factory method for CRExecCommand.
// Creates an instance that corresponds to the variable (|command|).
// Relation of |command| and return value define |_commandFactory|.
- (id <CRExecCommand>) createInstance:(NSString *) command;

@end
