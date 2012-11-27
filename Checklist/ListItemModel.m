//
//  ListItemModel.m
//  Checklist
//
//  Created by Joe on 11/26/12.
//  Copyright (c) 2012 LogicHaus. All rights reserved.
//

#import <Parse/Parse.h>

#import "ListItemModel.h"

@implementation ListItemModel

@synthesize complete, title;

-(id)initWithTitle:(NSString *)t
{
    self = [super init];
    if (self) {
        self.title = t;        
    }
    return self;
}

-(void)save {
    PFUser *user = [PFUser currentUser];
    
    if (user) {
        PFQuery *query = [PFQuery queryWithClassName:@"ListItemModel"];
        [query whereKey:@"user" equalTo:user.username];
        [query whereKey:@"uid" equalTo:self.title];
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            PFObject *record;
            if (!objects || [objects count] == 0) {
                
                record = [PFObject objectWithClassName:@"ListItemModel"];
                [record setObject:user.username forKey:@"user"];
                [record setObject:self.title forKey:@"uid"];
            } else {
                record = (PFObject *)[objects lastObject];
            }
            [record setObject:[NSNumber numberWithBool:self.complete] forKey:@"complete"];
            [record saveEventually];
        }];
    }
}

@end
