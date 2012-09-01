//
//  CRExecCommand.h
//  crem
//
//  Created by sbkro on 2012/09/01.
//  Copyright (c) 2012 sbkro-apps. All rights reserved.
//

// ------------------------------------------------------------------------------------
//  Header files
// ------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>


@protocol CRExecCommand <NSObject>
- (void) execute:(int) argc arguments:(const char * []) argv;
@end
