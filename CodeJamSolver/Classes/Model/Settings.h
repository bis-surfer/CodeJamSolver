//
//  Settings.h
//  CodeJamSolver
//
//  Created by Ilya Borisov on 2/27/14.
//  Copyright (c) 2014 Ilya Borisov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Settings : NSObject

@property (strong, nonatomic) NSString *inputFilePath;
@property (strong, nonatomic) NSString *outputFilePath;

@property (nonatomic) NSUInteger testCasesCount;
@property (nonatomic) NSInteger testCaseIndex;


+ (Settings *)sharedInstance;

- (void)setup;

- (double)progress;


@end
