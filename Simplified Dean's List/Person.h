//
//  Person.h
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic, readonly) NSString * name;
@property (strong, nonatomic) NSDate * dateOfBirth;
@property (strong, nonatomic) NSString * SSN;

@property (strong, nonatomic) NSMutableSet * associatedCoursesSet;
//done to prevent adding multiple of the same course

@property (strong, nonatomic) NSMutableDictionary * bio;

- (id) initWithName: (NSString *) theName SSN: (NSString *) theSSN andDOB: (NSDate *) theDOB;
-(void) setUpBio: (NSString *) bio withFunFact: (NSString *) fact andDegreeEarned: (NSString *) degree;
-(NSString *) printBio;

@end
