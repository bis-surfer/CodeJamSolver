//
//  AppDelegate.m
//  CodeJamSolver
//
//  Created by Ilya Borisov on 2/27/14.
//  Copyright (c) 2014 Ilya Borisov. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.masterViewController = [[MasterViewController alloc] init];
    
    NSView *masterView = (NSView *)self.masterViewController.view;
    masterView.frame = ((NSView *)self.window.contentView).bounds;
    
    [self.window.contentView addSubview:self.masterViewController.view];
}

@end
