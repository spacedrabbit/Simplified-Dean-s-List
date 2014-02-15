//
//  University.h
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/15/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface University : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * location;

@property (nonatomic, strong) NSMutableArray * students;
@property (nonatomic, strong) NSMutableArray * staff;

@property (nonatomic, strong) NSMutableArray * courses;
@end
