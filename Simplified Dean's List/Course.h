//
//  Course.h
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/15/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Course : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * location;
@property (strong, nonatomic) NSString * days;
@property (strong, nonatomic) NSString * time;

@property (strong, nonatomic) Person * teacher;
@property (strong, nonatomic) NSMutableArray * students;

- (id)initCourse: (NSString *)name locatedAt: (NSString *)location onDays: (NSString *)days atTime: (NSString *) time;

@end
