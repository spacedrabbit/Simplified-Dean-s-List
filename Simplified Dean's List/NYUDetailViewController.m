//
//  NYUDetailViewController.m
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/17/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "NYUDetailViewController.h"
#import "Course.h"
#import "Staff.h"
#import "Student.h"

#define TEACHER 0
#define STUDENT 1
#define COURSES 2

@interface NYUDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *descriptionBox;
@property (nonatomic) id detailObject;
@property (nonatomic) NSUInteger type;

@end

@implementation NYUDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Object: %@", self.detailObject);
    NSLog(@"Type: %lu", self.type);

    [self printObjectDetails];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setDetailObject:(id)detailObject{
    if (!_detailObject) {
        _detailObject = detailObject;
    }
}
-(void)setDetailObjectType:(NSUInteger)type{
    _type = type;
}
-(void)printObjectDetails{
    
    if (self.type == STUDENT) {
        
        Person * student = self.detailObject;
        self.navigationItem.title = student.name;
        NSString * detailString = [NSString stringWithFormat:@"\n%@\nCourse List\n---------------------------\n%@", student.name, student.associatedCourses];
        self.descriptionBox.text = detailString;
        
    }else if(self.type == TEACHER){
        
        Person * teacher = self.detailObject;
        self.navigationItem.title = teacher.name;
        NSString * detailString = [NSString stringWithFormat:@"\n%@\nCourses Taught\n---------------------------\n%@", teacher.name, teacher.associatedCourses];
        self.descriptionBox.text = detailString;
        
    }
    else{
        
        Course * course = self.detailObject;
        self.navigationItem.title = course.name;
        NSString * detailString = [NSString stringWithFormat:@"%@\n---------------------------\nTaught By: %@\n\nEnrolled Students: %@",course.name, course.teacher, course.students];
        self.descriptionBox.text = detailString;
    }
    
}

@end
