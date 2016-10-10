//
//  TestSuite.m
//  xUnit
//
//  Created by Andrew Bogaevskyi on 31.07.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import "TestSuite.h"

@interface TestSuite ()

@property (nonatomic, strong) NSMutableArray<TestCase *> *tests;

@end

@implementation TestSuite

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.tests = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)add:(TestCase *)testCase
{
    [self.tests addObject:testCase];
}

- (void)run:(TestResult *)testResult
{
    for (TestCase *test in self.tests)
    {
        [test run:testResult];
    }
}

@end
