//
//  NYUDetailViewController.h
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/17/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "DeansMasterViewController.h"

@interface NYUDetailViewController : DeansMasterViewController

-(void) setDetailObjectType: (NSUInteger) type;
-(void) setDetailObject: (id) detailObject;

@end
