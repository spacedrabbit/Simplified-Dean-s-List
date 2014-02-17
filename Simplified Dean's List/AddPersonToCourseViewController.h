//
//  AddPersonToCourseViewController.h
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/16/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "DeansMasterViewController.h"

@interface AddPersonToCourseViewController : DeansMasterViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSMutableArray * courseList;
@property (strong, nonatomic) NSMutableArray * personList;

@property (nonatomic) BOOL isStaff;

@end
