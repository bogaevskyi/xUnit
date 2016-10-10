//
//  TestCaseTest.m
//  xUnit
//
//  Created by Andrew Bogaevskyi on 31.07.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import "TestCaseTest.h"

#import "TestResult.h"
#import "TestSuite.h"
#import "WasRun.h"
#import "Test.h"

#import <objc/runtime.h>

@interface TestCaseTest ()

@property (nonatomic, strong) WasRun *wasRun;
@property (nonatomic, strong) TestResult *result;
@property (nonatomic, strong) TestSuite *suite;

@end

@implementation TestCaseTest

- (void)setUp
{
    self.result = [[TestResult alloc] init];
}

- (void)testResult
{
    self.wasRun = [[WasRun alloc] initWithMethodName:@"testMethod"];
    [self.wasRun run:self.result];

    xUnitAssertTrue([@"1 run. 0 failed" isEqualToString:[self.result summary]]);
}

- (void)testFailedResultFormatting
{
    [self.result started:self];
    [self.result failed:nil];

    xUnitAssertTrue([@"1 run. 1 failed" isEqualToString:[self.result summary]]);
}

- (void)testFailedResult
{
    self.wasRun = [[WasRun alloc] initWithMethodName:@"testBrokenMethod"];
    [self.wasRun run:self.result];

    xUnitAssertTrue([@"1 run. 1 failed" isEqualToString:[self.result summary]]);
}

- (void)testSuite
{
    self.suite = [[TestSuite alloc] init];

    [self.suite add:[[WasRun alloc] initWithMethodName:@"testMethod"]];
    [self.suite add:[[WasRun alloc] initWithMethodName:@"testBrokenMethod"]];

    [self.suite run:self.result];

    xUnitAssertTrue([@"2 run. 1 failed" isEqualToString:[self.result summary]]);
}

- (void)testTest
{
    Test *test = [[Test alloc] init];
    [test addTestCaseClass:[WasRun class]];
    [test run:self.result];
    
    xUnitAssertTrue([@"2 run. 1 failed" isEqualToString:[self.result summary]]);
}

@end
