//
//  NYUTableViewController.h
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/17/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYUTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray * courses;
@property (strong, nonatomic) NSMutableArray * students;
@property (strong, nonatomic) NSMutableArray * teachers;


@end
