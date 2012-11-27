//
//  CHChecklistViewController.m
//  Checklist
//
//  Created by Joe on 11/26/12.
//  Copyright (c) 2012 LogicHaus. All rights reserved.
//

#import "CHChecklistViewController.h"
#import "ListItemModel.h"

@interface CHChecklistViewController ()

@end

@implementation CHChecklistViewController

@synthesize checklistItems;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [checklistItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChecklistCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ListItemModel *item = [checklistItems objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.title;
    
    if (item.complete) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListItemModel *item = [checklistItems objectAtIndex:indexPath.row];    
    item.complete = !(item.complete);
    [item save];
    [tableView reloadData];
}

@end
