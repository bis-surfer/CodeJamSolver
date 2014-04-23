//
//  Round1AProblemSolver.m
//  CodeJamSolver
//
//  Created by Ilya Borisov on 4/20/14.
//  Copyright (c) 2014 Ilya Borisov. All rights reserved.
//

#import "Round1AProblemSolver.h"


@implementation Round1AProblemSolver

- (NSString *)outputForTestCaseWithIndex:(NSUInteger)testCaseIndex andInputLines:(NSArray *)inputLines {
    
    NSInteger testCaseInput = (NSUInteger)[[inputLines objectAtIndex:0] integerValue];
    
    NSInteger testCaseOutput = testCaseInput;
    
    return [NSString stringWithFormat:@"%ld", testCaseOutput];
}

@end
