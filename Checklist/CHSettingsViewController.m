//
//  CHSettingsViewController.m
//  Checklist
//
//  Created by Joe on 11/26/12.
//  Copyright (c) 2012 LogicHaus. All rights reserved.
//

#import <Parse/Parse.h>

#import "CHSettingsViewController.h"

@interface CHSettingsViewController ()

@end

@implementation CHSettingsViewController


- (IBAction)connectToTwitter:(UIButton *)sender {
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Twitter login.");
        } else {
            NSLog(@"User logged in with Twitter!");
            
            NSURL *verify = [NSURL URLWithString:@"https://api.twitter.com/1.1/account/settings.json"];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:verify];
            [[PFTwitterUtils twitter] signRequest:request];
            NSURLResponse *response = nil;
            NSData *data = [NSURLConnection sendSynchronousRequest:request
                                                 returningResponse:&response
                                                             error:&error];
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            NSString *username = [@"@" stringByAppendingString:[dict objectForKey:@"screen_name"]];
            
            self.usernameLabel.text = username;
        }
    }];      
}

@end
