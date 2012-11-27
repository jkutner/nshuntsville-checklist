//
//  ListItemModel.h
//  Checklist
//
//  Created by Joe on 11/26/12.
//  Copyright (c) 2012 LogicHaus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItemModel : NSObject

@property BOOL complete;
@property (strong, nonatomic) NSString *title;

-(id)initWithTitle:(NSString *)t;

-(void)save;

@end
