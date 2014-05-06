//
//  Round1AProblemASolver.m
//  CodeJamSolver
//
//  Created by Ilya Borisov on 4/20/14.
//  Copyright (c) 2014 Ilya Borisov. All rights reserved.
//
//  In order to build fully-functional OS X app (with simple UI)
//  intended to construct output text file by input text file according to Google Code Jam contest requirements
//  please download Xcode project at https://github.com/bis-surfer/CodeJamSolver
//  and replace file of the same name ("Round1AProblemASolver.m") with the present file.
//  Also rewrite method +[Computer specificProblemSolverClass] to return [Round1AProblemASolver class].
//
//  Charging Chaos Problem (A)
//

#import "Round1AProblemASolver.h"

#import "NSMutableArray+FlipSwitches.h"


@implementation Round1AProblemASolver

NSString *kNotPossible = @"NOT POSSIBLE";

- (NSUInteger)linesPerCaseCount {
    
    return 3;
}

- (NSString *)outputForTestCaseWithIndex:(NSUInteger)testCaseIndex andInputLines:(NSArray *)inputLines {
    
    NSArray *NL = [[inputLines objectAtIndex:0] componentsSeparatedByString:@" "];
    NSUInteger N = (NSUInteger)[[NL objectAtIndex:0] integerValue];
    NSUInteger L = (NSUInteger)[[NL objectAtIndex:1] integerValue];
    
    NSArray *initialFlows = [[inputLines objectAtIndex:1] componentsSeparatedByString:@" "];
    NSArray *requiredFlows = [[inputLines objectAtIndex:2] componentsSeparatedByString:@" "];
    
    NSMutableArray *outletsFlows = [NSMutableArray array];
    for (NSString *outletFlow in initialFlows) {
        [outletsFlows addObject:[NSMutableString stringWithString:outletFlow]];
    }
    
    NSUInteger numberOfSwitches = 0;
    
    for (NSInteger order = 0; order < L; order++) {
        
        NSUInteger numberOfOnesInDevicesSpecForThisOrder = 0;
        
        for (NSInteger device = 0; device < N; device++) {
            
            NSString *deviceSpec = [requiredFlows objectAtIndex:device];
            
            if ([deviceSpec characterAtIndex:(L - 1 - order)] == '1') {
                
                numberOfOnesInDevicesSpecForThisOrder ++;
            }
        }
        
        NSUInteger numberOfOnesInOutletsSpecForThisOrder = 0;
        
        for (NSInteger outlet = 0; outlet < N; outlet++) {
            
            NSString *outletSpec = [initialFlows objectAtIndex:outlet];
            
            if ([outletSpec characterAtIndex:(L - 1 - order)] == '1') {
                
                numberOfOnesInOutletsSpecForThisOrder ++;
            }
        }
        
        if (numberOfOnesInDevicesSpecForThisOrder == numberOfOnesInOutletsSpecForThisOrder) {
            
            continue;
        }
        else if (numberOfOnesInDevicesSpecForThisOrder == N - numberOfOnesInOutletsSpecForThisOrder) {
            
            numberOfSwitches++;
            
            for (NSMutableString *outletFlow in outletsFlows) {
                
                NSString *initialDigit = [outletFlow substringWithRange:NSMakeRange(L - 1 - order, 1)];
                NSString *digit = @"0";
                if ([digit isEqualToString:initialDigit]) {
                    digit = @"1";
                }
                
                [outletFlow replaceCharactersInRange:NSMakeRange(L - 1 - order, 1) withString:digit];
            }
            
            continue;
        }
        else {
            
            return kNotPossible;
        }
    }
    
    if ([self isPossibleToChargeDeviceFlows:requiredFlows withOutletsFlows:outletsFlows]) {
        
        return [NSString stringWithFormat:@"%lu", numberOfSwitches];
    }
    
    return kNotPossible;
}

- (BOOL)isPossibleToChargeDeviceFlows:(NSArray *)deviceFlows withOutletsFlows:(NSMutableArray *)outletsFlows {
    
    for (NSString *deviceFlow in deviceFlows) {
        
        if ([outletsFlows containsObject:deviceFlow]) {
            
            [outletsFlows removeObject:deviceFlow];
        }
        else {
            
            return NO;
        }
    }
    
    return YES;
}

@end
