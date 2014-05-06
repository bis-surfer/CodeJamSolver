//
//  Round1BProblemASolver.m
//  CodeJamSolver
//
//  Created by Ilya Borisov on 5/03/14.
//  Copyright (c) 2014 Ilya Borisov. All rights reserved.
//
//  In order to build fully-functional OS X app (with simple UI)
//  intended to construct output text file by input text file according to Google Code Jam contest requirements
//  please download Xcode project at https://github.com/bis-surfer/CodeJamSolver
//  and replace file of the same name ("Round1BProblemASolver.m") with the present file.
//  Also rewrite method +[Computer specificProblemSolverClass] to return [Round1BProblemASolver class].
//
//  The Repeater Problem (A)
//

#import "Round1BProblemASolver.h"


@implementation Round1BProblemASolver

NSString *kFeglaWon = @"Fegla Won";

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
    
    NSArray *reducedString = [allStringsReduced objectAtIndex:0];
    
    for (NSArray *reducedInputString in allStringsReduced) {
        
        if (![reducedInputString isEqualToArray:reducedString]) {
            
            return kFeglaWon;
        }
    }
    
    NSUInteger numberOfMoves = 0;
    
    for (NSString *character in reducedString) {
        
        NSUInteger wholeNumberOfCharacters = 0;
        NSUInteger maximumCharacterCount = 0;
        NSMutableArray *characterCounts = [NSMutableArray array];
        for (NSMutableArray *inputString in allStrings) {
            
            NSInteger characterCount = 0;
            while ((inputString.count > 0) && [[inputString objectAtIndex:0] isEqualToString:character]) {
                
                characterCount++;
                [inputString removeObjectAtIndex:0];
            }
            
            if (characterCount > maximumCharacterCount) {
                maximumCharacterCount = characterCount;
            }
            
            wholeNumberOfCharacters += characterCount;
            
            [characterCounts addObject:[NSNumber numberWithInteger:characterCount]];
        }
        
        if (maximumCharacterCount > 1) {
            
            NSInteger minimumNumberOfMovesInc = N*maximumCharacterCount;
            
            for (NSInteger optimalNumberOfCharacters = 1; optimalNumberOfCharacters <= maximumCharacterCount; optimalNumberOfCharacters++) {
                
                NSInteger numberOfMovesInc = 0;
                
                for (NSNumber *chCount in characterCounts) {
                    
                    NSInteger characterCount = [chCount integerValue];
                    
                    numberOfMovesInc += abs((int)(characterCount - optimalNumberOfCharacters));
                }
                
                if (numberOfMovesInc < minimumNumberOfMovesInc) {
                    
                    minimumNumberOfMovesInc = numberOfMovesInc;
                }
            }
            
            numberOfMoves += minimumNumberOfMovesInc;
        }
    }
    
    return [NSString stringWithFormat:@"%lu", numberOfMoves];
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
