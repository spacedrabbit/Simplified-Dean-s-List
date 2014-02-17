//
//  Person.m
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "Person.h"

@interface Person ()

@property (strong, nonatomic) NSString * name;

@end

@implementation Person

-(id)initWithName:(NSString *)theName SSN:(NSString *)theSSN andDOB:(NSDate *)theDOB{
    
    self = [super init];
    if (self) {
        _name = theName;
        _dateOfBirth = theDOB;
        _SSN = theSSN;
    }
    return self;
}

- (id)init
{
    return [self initWithName:@"No Name" SSN:@"No SSN" andDOB:NULL];
}

-(NSString *)description{
    return self.name;
}

-(NSMutableDictionary *)bio{
    if (!_bio) {
        _bio = [NSMutableDictionary dictionary];
    }
    return _bio;
}
-(NSMutableSet *)associatedCoursesSet{
    if (!_associatedCoursesSet) {
        _associatedCoursesSet = [NSMutableSet set];
    }
    return _associatedCoursesSet;
}

-(void) setUpBio: (NSString *) bio withFunFact: (NSString *) fact andDegreeEarned: (NSString *) degree {
    
    self.bio = [NSMutableDictionary dictionaryWithObjectsAndKeys:bio, @"Bio",fact, @"Fun Fact", degree, @"Degree", nil];
}

-(NSString *) printBio{
    
    NSArray * allKeys = [self.bio allKeys];
    NSMutableString * formattedBio = [NSMutableString string];
    
    for ( NSString * key in allKeys) {
        [formattedBio appendFormat:@"\n\n%@:\n\n%@\n\n",key, [self.bio objectForKey:key] ];
    }
    
    return formattedBio;
}

@end
