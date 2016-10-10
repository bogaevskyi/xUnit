//
//  TestCase.h
//  xUnit
//
//  Created by Andrew Bogaevskyi on 31.07.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TestAssertions.h"
#import "TestResult.h"

@interface TestCase : NSObject

- (instancetype)initWithMethodName:(NSString *)methodName;

- (void)setUp;
- (void)tearDown;
- (void)run:(TestResult *)testResult;

@end
