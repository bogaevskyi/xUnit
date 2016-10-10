//
//  TestSuite.h
//  xUnit
//
//  Created by Andrew Bogaevskyi on 31.07.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import "TestCase.h"

@interface TestSuite : TestCase

- (void)add:(TestCase *)testCase;

@end
