//
//  CHSettingsViewController.h
//  Checklist
//
//  Created by Joe on 11/26/12.
//  Copyright (c) 2012 LogicHaus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHSettingsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;

- (IBAction)connectToTwitter:(UIButton *)sender;

@end
