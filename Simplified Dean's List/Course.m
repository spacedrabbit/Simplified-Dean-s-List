//
//  Course.m
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/15/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "Course.h"

@implementation Course

- (id)initCourse: (NSString *)name locatedAt: (NSString *)location onDays: (NSString *)days atTime: (NSString *) time
{
    self = [super init];
    if (self) {
        _name = name;
        _location = location;
        _days = days;
        _time = time;
    }
    return self;
}

-(id)init{
    return [self initCourse:@"No Name" locatedAt:@"Undefined Location" onDays:@"Unknown Days" atTime:@"Time Not Set"];
}

-(NSString *)description{
    return self.name;
}

@end
