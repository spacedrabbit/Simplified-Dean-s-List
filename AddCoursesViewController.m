//
//  AddCoursesViewController.m
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/15/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "AddCoursesViewController.h"
#import "Course.h"

@interface AddCoursesViewController ()

@property (weak, nonatomic) IBOutlet UITextField *courseName;
@property (weak, nonatomic) IBOutlet UITextField *courseDays;
@property (weak, nonatomic) IBOutlet UITextField *courseTimes;
@property (weak, nonatomic) IBOutlet UITextField *courseLocation;

@property (weak, nonatomic) IBOutlet UITextView *addCourseResults;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *courseTextFields;


@end

@implementation AddCoursesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addDoneButtonToKeyboards:self.courseTextFields];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)addCourse:(UIButton *)sender {
    
    NSString * courseName = self.courseName.text;
    NSString * courseDays = self.courseDays.text;
    NSString * courseTimes = self.courseTimes.text;
    NSString * courseLocation = self.courseLocation.text;
    
    if ([self checkForEmptyString:self.courseTextFields]) {
        
        Course * newCourse = [[Course alloc] initCourse:courseName locatedAt:courseLocation onDays:courseDays atTime:courseTimes];
        
        [self.courseCatalog addObject:newCourse];
        
        self.addCourseResults.text = [NSString stringWithFormat:@"%@ successfully added", newCourse];
    }
    else{
        self.addCourseResults.text = @"Sorry, you are missing information. Please re-submit";
    }
    
    [self clearTextFields:self.courseTextFields];
    [self dismissKeyboard];
    
}

/***********************************************
 
    Add these to super class
 
 
 **********************************************/


-(BOOL) checkForEmptyString: (NSArray *) array{
    for (UITextField * text in array ) {
        if ([text.text isEqualToString:@""]) {
            return FALSE;
        }
    }
    return TRUE;
}

-(void) clearTextFields: (NSArray *) array{
    for (UITextField * text in array ) {
        text.text = @"";
    }
}

-(void) addDoneButtonToKeyboards: (NSArray *) array{
    for (UITextField* label in array) {
        label.returnKeyType = UIReturnKeyDone;
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.addCourseResults.text =@"";
}

@end
