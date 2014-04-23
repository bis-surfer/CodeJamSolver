//
//  AppDelegate.h
//  CodeJamSolver
//
//  Created by Ilya Borisov on 2/27/14.
//  Copyright (c) 2014 Ilya Borisov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MasterViewController;


@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong, nonatomic) MasterViewController *masterViewController;


@end
