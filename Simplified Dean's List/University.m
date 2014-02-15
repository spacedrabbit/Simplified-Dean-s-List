//
//  University.m
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/15/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "University.h"

@implementation University

-(id)init{
    self = [super init];
    if (self) {
        _name = @"New York University";
        _location = @"New York, NY";
        _students = [NSMutableArray array];
        _staff  =   [NSMutableArray array];
        _courses =  [NSMutableArray array];
    }
    
    return self;
}

@end
