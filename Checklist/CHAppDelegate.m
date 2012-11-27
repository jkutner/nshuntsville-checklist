//
//  CHAppDelegate.m
//  Checklist
//
//  Created by Joe on 11/26/12.
//  Copyright (c) 2012 LogicHaus. All rights reserved.
//

#import <Parse/Parse.h>
#import "CHAppDelegate.h"
#import "CHChecklistViewController.h"
#import "ListItemModel.h"

@implementation CHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"xxx"
                  clientKey:@"xxx"];
  
    [PFTwitterUtils initializeWithConsumerKey:@"xxx"
                               consumerSecret:@"xxx"];
    
    NSArray *checklist = [[NSArray alloc] initWithObjects:
                          [[ListItemModel alloc] initWithTitle:@"Lager"],
                          [[ListItemModel alloc] initWithTitle:@"Ale"],
                          [[ListItemModel alloc] initWithTitle:@"Stout"],
                          [[ListItemModel alloc] initWithTitle:@"Porter"],
                          nil];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    CHChecklistViewController *checklistController = [[tabBarController viewControllers] objectAtIndex:0];
    checklistController.checklistItems = checklist;
    
    return YES;
}

@end
