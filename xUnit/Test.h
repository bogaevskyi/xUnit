//
//  Test.h
//  xUnit
//
//  Created by Andrew Bogaevskyi on 03.08.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestCase.h"

@interface Test : TestCase

- (void)addTestCaseClass:(Class)testCaseClass;

@end
