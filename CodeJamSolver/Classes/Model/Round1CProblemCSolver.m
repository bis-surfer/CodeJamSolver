//
//  Round1CProblemCSolver.m
//  CodeJamSolver
//
//  Created by Ilya Borisov on 5/05/14.
//  Copyright (c) 2014 Ilya Borisov. All rights reserved.
//
//  In order to build fully-functional OS X app (with simple UI)
//  intended to construct output text file by input text file according to Google Code Jam contest requirements
//  please download Xcode project at https://github.com/bis-surfer/CodeJamSolver
//  and replace file of the same name ("Round1CProblemBSolver.m") with the present file.
//  Also rewrite method +[Computer specificProblemSolverClass] to return [Round1CProblemCSolver class].
//
//  *** Problem (C)
//

#import "Round1CProblemCSolver.h"


@implementation Round1CProblemCSolver

NSString *kDefaultOutput1C_C = @"DEFAULT";

- (NSUInteger)linesPerCaseCount {
    
    return 1;
}

- (BOOL)isLinesPerCaseCountVariable {
    
    return YES;
}

- (NSUInteger)linesPerCaseCountWithString:(NSString *)linesCountString {
    
    return (1 + [linesCountString integerValue]);
}

- (NSString *)outputForTestCaseWithIndex:(NSUInteger)testCaseIndex andInputLines:(NSArray *)inputLines {
    
    NSUInteger N = inputLines.count - 1;
    
    if (N > 0) {
        
        NSMutableArray *allStrings        = [NSMutableArray array];
        NSMutableArray *allStringsReduced = [NSMutableArray array];
        
        for (NSString *inputString in inputLines) {
            
            if ([inputLines indexOfObject:inputString] == 0) {
                
                continue;
            }
            
            NSMutableArray *inputArray = [NSMutableArray arrayWithArray:[self arrayFromString:inputString]];
            NSArray *reducedInputArray = [self arrayWithoutRepetitionFromArray:inputArray];
            
            [allStrings addObject:inputArray];
            [allStringsReduced addObject:reducedInputArray];
        }
        
        return kDefaultOutput1C_C;
    }
    
    NSArray *ABK = [[inputLines objectAtIndex:0] componentsSeparatedByString:@" "];
    
    NSInteger A = [[ABK objectAtIndex:0] integerValue];
    NSInteger B = [[ABK objectAtIndex:1] integerValue];
    NSInteger K = [[ABK objectAtIndex:2] integerValue];
    
    unsigned long long winningPairsCount = A*B;
    
    if (A <= K || B <= K) {
        
        return [NSString stringWithFormat:@"%llu", winningPairsCount];
    }
    
    NSArray *CFX = [[inputLines objectAtIndex:0] componentsSeparatedByString:@" "];
    
    double C = [[CFX objectAtIndex:0] doubleValue];
    double F = [[CFX objectAtIndex:1] doubleValue];
    double X = [[CFX objectAtIndex:2] doubleValue];
    
    return [NSString stringWithFormat:@"%.7f", C*F*X];
}

- (NSArray *)arrayFromString:(NSString *)string {
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSUInteger characterIndex = 0; characterIndex < string.length; characterIndex++) {
        
        NSString *character = [string substringWithRange:NSMakeRange(characterIndex, 1)];
        
        [array addObject:character];
    }
    
    return [NSArray arrayWithArray:array];
}

- (NSArray *)arrayWithoutRepetitionFromArray:(NSArray *)inputArray {
    
    NSMutableArray *outputArray = [NSMutableArray array];
    
    id lastObject = nil;
    
    for (id object in inputArray) {
        
        if (![object isEqualTo:lastObject]) {
            
            [outputArray addObject:object];
            
            lastObject = object;
        }
    }
    
    return [NSArray arrayWithArray:outputArray];
}

@end
