//
//  Round1BProblemBSolver.m
//  CodeJamSolver
//
//  Created by Ilya Borisov on 5/05/14.
//  Copyright (c) 2014 Ilya Borisov. All rights reserved.
//
//  In order to build fully-functional OS X app (with simple UI)
//  intended to construct output text file by input text file according to Google Code Jam contest requirements
//  please download Xcode project at https://github.com/bis-surfer/CodeJamSolver
//  and replace file of the same name ("Round1BProblemBSolver.m") with the present file.
//  Also rewrite method +[Computer specificProblemSolverClass] to return [Round1BProblemBSolver class].
//
//  New Lottery Game Problem (B)
//

#import "Round1BProblemBSolver.h"


@implementation Round1BProblemBSolver

- (NSString *)outputForTestCaseWithIndex:(NSUInteger)testCaseIndex andInputLines:(NSArray *)inputLines {
    
    NSArray *ABK = [[inputLines objectAtIndex:0] componentsSeparatedByString:@" "];
    
    NSInteger A = [[ABK objectAtIndex:0] integerValue];
    NSInteger B = [[ABK objectAtIndex:1] integerValue];
    NSInteger K = [[ABK objectAtIndex:2] integerValue];
    
    // NSLog(@"A = %ld; B = %ld; K = %ld", A, B, K);
    
    unsigned long long winningPairsCount = A*B;
    
    if (A > K && B > K) {
        
        winningPairsCount = K*B + (A - K)*K;
        
        for (NSInteger n1 = K; n1 < A; n1++) {
            for (NSInteger n2 = K; n2 < B; n2++) {
                
                NSInteger n = (n1 & n2);
                
                // NSLog(@"n = %ld", n);
                
                if (n < K) {
                    
                    winningPairsCount++;
                }
            }
        }
    }
    
    return [NSString stringWithFormat:@"%llu", winningPairsCount];
}

@end
