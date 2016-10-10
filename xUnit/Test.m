//
//  Test.m
//  xUnit
//
//  Created by Andrew Bogaevskyi on 03.08.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import "Test.h"

#import <objc/runtime.h>
#import "TestSuite.h"

@interface Test ()

@property (nonatomic, strong) NSMutableArray<TestSuite *> *suites;

@end

@implementation Test

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.suites = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addTestCaseClass:(Class)testCaseClass
{
    TestSuite *suite = [[TestSuite alloc] init];

    NSInteger i = 0;
    unsigned int count = 0;
    Method *list = class_copyMethodList(testCaseClass, &count);

    for (i = 0; i < count; ++i)
    {
        NSString *selectorName = NSStringFromSelector(method_getName(list[i]));
        if ([selectorName hasPrefix:@"test"])
        {
            [suite add:[[testCaseClass alloc] initWithMethodName:selectorName]];
        }
    }

    [self.suites addObject:suite];
}

- (void)run:(TestResult *)testResult
{
    for (TestSuite *suite in self.suites)
    {
        [suite run:testResult];
    }
}

@end
