//
//  TestAssertions.h
//  xUnit
//
//  Created by Andrew Bogaevskyi on 31.07.16.
//  Copyright © 2016 Andrew Bogaevskyi. All rights reserved.
//

#ifndef TestAssertions_h
#define TestAssertions_h

#define xUnitAssertTrue(expression, ...)                                                                     \
    if (!(expression))                                                                                       \
    {                                                                                                        \
        NSString *msg = [NSString stringWithFormat:@"'%s' failed in line %d",__PRETTY_FUNCTION__, __LINE__]; \
        NSString *reason = [@[__VA_ARGS__] componentsJoinedByString:@""];                                    \
        @throw [NSException exceptionWithName:msg                                                            \
                                       reason:reason                                                         \
                                     userInfo:nil];                                                          \
    }                                                                                                        \


#endif /* TestAssertions_h */
