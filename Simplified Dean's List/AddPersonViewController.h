//
//  AddPersonViewController.h
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/14/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPersonViewController : UIViewController <UITextFieldDelegate>
    @property (nonatomic) BOOL isStaff;
    @property (strong, nonatomic) NSMutableArray * personArray;
@end
