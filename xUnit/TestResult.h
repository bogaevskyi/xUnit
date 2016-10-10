//
//  TestResult.h
//  xUnit
//
//  Created by Andrew Bogaevskyi on 31.07.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TestCase;

@interface TestResult : NSObject

- (void)started:(TestCase *)testCase;
- (void)success;
- (void)failed:(NSException *)exception;

- (NSString *)sessionLog;
- (NSString *)summary;

@end
