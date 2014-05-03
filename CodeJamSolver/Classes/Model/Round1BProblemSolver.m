//
//  Round1BProblemSolver.m
//  CodeJamSolver
//
//  Created by Ilya Borisov on 5/03/14.
//  Copyright (c) 2014 Ilya Borisov. All rights reserved.
//
//  In order to build fully-functional OS X app (with simple UI)
//  intended to construct output text file by input text file according to Google Code Jam contest requirements
//  please download Xcode project at https://github.com/bis-surfer/CodeJamSolver
//  and replace file of the same name "Round1AProblemSolver.m" with the present file
//
//  Specific Problem Name
//

#import "Round1BProblemSolver.h"


@implementation Round1BProblemSolver

NSString *kSomeDefaultAnswer = @"DEFAULT";

- (NSUInteger)linesPerCaseCount {
    
    return 3;
}

- (NSString *)outputForTestCaseWithIndex:(NSUInteger)testCaseIndex andInputLines:(NSArray *)inputLines {
    
    return kSomeDefaultAnswer;
}

@end
