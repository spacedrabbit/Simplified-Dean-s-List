//
//  NYUTableViewController.m
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/17/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "NYUTableViewController.h"
#define TEACHER 0
#define STUDENT 1
#define COURSES 2

@interface NYUTableViewController ()

@end

@implementation NYUTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/******************************************************
 
    Setting up the Table
 
 ******************************************************/

// three sections: students, staff, courses
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

//number of rows per section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == TEACHER) {
        return [self.teachers count];
    }
    else if (section == STUDENT){
        return [self.students count];
    }else{
        return [self.courses count];
    }
    
}

//cell contents, first checks section then checks row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section == TEACHER) {
        cell.textLabel.text = [[self.teachers objectAtIndex:indexPath.row] name];
    }else if (indexPath.section == STUDENT){
        cell.textLabel.text = [[self.students objectAtIndex:indexPath.row] name];
    }else{
        cell.textLabel.text = [[self.courses objectAtIndex:indexPath.row] name];
    }

    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == TEACHER) {
        return @"Teachers";
    }else if (section == STUDENT){
        return @"Students";
    }else{
        return @"Courses";
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"details"]) {
        NSIndexPath * path = [self.tableView indexPathForSelectedRow];
        
        if (path.section == TEACHER) {
            NSLog(@"Techer detail");
        }else if (path.section == STUDENT){
            NSLog(@"Student detail");
        }else{
            NSLog(@"Course Details");
        }
        
        //need to send the proper information here, send the object
        
        //[[segue destinationViewController] set]
        //[[segue destinationViewController] setDetailItem:object];
    }
}


@end
