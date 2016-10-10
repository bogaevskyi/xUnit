//
//  TestCase.m
//  xUnit
//
//  Created by Andrew Bogaevskyi on 31.07.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import "TestCase.h"
#import <objc/message.h>

@interface TestCase ()

@property (nonatomic, strong) NSString *name;

@end

@implementation TestCase

- (instancetype)initWithMethodName:(NSString *)methodName
{
    self = [super init];
    if (self)
    {
        self.name = methodName;
    }
    return self;
}

- (void)setUp
{
}

- (void)tearDown
{
}

- (void)run:(TestResult *)testResult
{
    [testResult started:self];
    [self setUp];

    @try
    {
        SEL selector = NSSelectorFromString(self.name);
        IMP imp = [self methodForSelector:selector];
        void (*func)(id, SEL) = (void *)imp;
        func(self, selector);
        
        [testResult success];
    }
    @catch (NSException *exception)
    {
        [testResult failed:exception];
    }

    [self tearDown];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"-[%@ %@]",NSStringFromClass([self class]), self.name];
}

@end
