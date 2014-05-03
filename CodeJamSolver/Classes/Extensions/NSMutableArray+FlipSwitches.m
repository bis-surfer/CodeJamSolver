//
//  NSMutableArray+FlipSwitches.m
//  CodeJamSolver
//
//  Created by Илья Борисов on 26.04.14.
//  Copyright (c) 2014 The Lost World. All rights reserved.
//

#import "NSMutableArray+FlipSwitches.h"


@implementation NSMutableArray (FlipSwitches)

- (void)flipSwitchWithIndex:(NSUInteger)index {
    
    for (NSMutableString *s in self) {
        
        NSRange r = NSMakeRange(index, 1);
        
        NSString *bit = [s substringWithRange:r];
        NSString *inverseBit = @"0";
        if ([bit isEqualToString:@"0"]) {
            inverseBit = @"1";
        }
        
        [s replaceCharactersInRange:r withString:inverseBit];
    }
}

@end
