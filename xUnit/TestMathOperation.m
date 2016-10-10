//
//  TestMathOperation.m
//  xUnit
//
//  Created by Andrew Bogaevskyi on 31.07.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import "TestMathOperation.h"

@implementation TestMathOperation

- (void)testSumSuccess
{
    NSInteger a = 5;
    NSInteger b = 5;

    xUnitAssertTrue(a + b == 10);
}

// Failed
- (void)testSumFailed
{
    NSInteger a = 5;
    NSInteger b = 5;

    xUnitAssertTrue(a + b == 9, @"Wrong sum of two NSInteger values.");
}

// Failed
- (void)testMultiplyFailed
{
    NSInteger a = 5;
    NSInteger b = 0;
    
    xUnitAssertTrue(a * b == 5);
}

@end
