//
//  TestResult.m
//  xUnit
//
//  Created by Andrew Bogaevskyi on 31.07.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import "TestResult.h"
#import "TestCase.h"

@interface TestResult ()

@property (nonatomic, assign) NSInteger runCount;
@property (nonatomic, assign) NSInteger errorCount;
@property (nonatomic, strong) NSMutableString *log;
@property (nonatomic, strong) TestCase *testCase;

@end

@implementation TestResult

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.runCount = 0;
        self.errorCount = 0;
        self.log = [[NSMutableString alloc] initWithString:@"Tests started\n"];
        self.testCase = nil;
    }
    return self;
}

- (void)started:(TestCase *)testCase
{
    self.testCase = testCase;
    self.runCount++;
    [self.log appendFormat:@"\n%@ started", self.testCase];
}

- (void)success
{
    [self.log appendFormat:@"\n%@ success\n", self.testCase];
    self.testCase = nil;
}

- (void)failed:(NSException *)exception
{
    NSString *message = [NSString stringWithFormat:@"%@. %@",exception.name ,exception.reason];
    [self.log appendFormat:@"\n%@ failed: %@\n", self.testCase, message];
    self.errorCount++;
    self.testCase = nil;
}

- (void)testStarted
{
    self.runCount++;
}

- (void)testFailed
{
    self.errorCount++;
}

- (NSString *)sessionLog
{
    return self.log;
}

- (NSString *)summary;
{
    return [NSString stringWithFormat:@"%@ run. %@ failed", @(self.runCount), @(self.errorCount)];
}

@end
