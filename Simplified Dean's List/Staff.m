//
//  Staff.m
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "Staff.h"

@implementation Staff

-(void)assignToCourse:(Course *)courseName {
    [self.associatedCoursesSet addObject:courseName];
}
-(NSSet *)showCoursesTaught{
    return self.associatedCoursesSet;
}
@end
