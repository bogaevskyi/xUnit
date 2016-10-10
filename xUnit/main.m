//
//  main.m
//  xUnit
//
//  Created by Andrew Bogaevskyi on 31.07.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Test.h"
#import "TestSuite.h"
#import "TestCaseTest.h"
#import "TestMathOperation.h"

int main(int argc, char * argv[])
{
    Test *test = [[Test alloc] init];
    
    [test addTestCaseClass:[TestMathOperation class]]; // 2 tests failed
    [test addTestCaseClass:[TestCaseTest class]];
    
    TestResult *result = [[TestResult alloc] init];
    [test run:result];
    
    NSLog(@"%@",[result sessionLog]);
    NSLog(@"%@",[result summary]);

}
