//
//  AddPersonToCourseViewController.m
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/16/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "AddPersonToCourseViewController.h"
#import "Person.h"
#import "Course.h"

@interface AddPersonToCourseViewController ()

@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;

@property (weak, nonatomic) IBOutlet UIPickerView *personPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *coursePicker;

@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation AddPersonToCourseViewController{
    
    Person * selectedPerson;
    Course * selectedCourse;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //by default when the picker loads, there is nothing technically selected, meaning it will return nil if I query right away. to get around this, I set the person and course specifically to the first item in the array.
    if ([self.personList count] && [self.courseList count]) {
        selectedPerson = self.personList[0];
        selectedCourse = self.courseList[0];
    }
    
    if (self.isStaff) {
        self.navigationItem.title = @"Assign Staff";
        [self.addButton setTitle:@"Assign" forState:UIControlStateNormal];
    }
    else{
        self.navigationItem.title = @"Enroll Student";
        [self.addButton setTitle:@"Enroll" forState:UIControlStateNormal];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/********************************************
 
            Submit Button
 
 ********************************************/

//checks pickerView for current selections, and then adds course/people
- (IBAction)addButton:(UIButton *)sender {
    
    //if it's a teacher
    if (self.isStaff)
    {
        //adds teacher to course
        selectedCourse.teacher = selectedPerson;
    }
    //if it's a student
    else
    {
        //adds student to course
        [selectedCourse.studentsSet addObject:selectedPerson];

    }
    
    //adds course to the student or staff
    [selectedPerson.associatedCoursesSet addObject:selectedCourse];
}


/********************************************

 Picker View Set Up
 
 ********************************************/

//how many sections in picker view
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//how many rows in each component
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if ( pickerView == self.personPicker )
    {
        return [self.personList count];
    }
    else{
        return [self.courseList count];
    }
}

//fills pickerView content
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if ( pickerView == self.personPicker )
    {
        //for some reason, my custom classes's description methods weren't being automatically called, so I had to specify the description method
        return [self.personList[row] description];
    }
    else{
        return [self.courseList[row] description];
    }
}

//handles currently selected row
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if ( pickerView == self.personPicker )
    {
        selectedPerson = self.personList[row];
    }
    else
    {
        selectedCourse = self.courseList[row];
    }
}
@end
