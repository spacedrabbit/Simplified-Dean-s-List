//
//  ViewController.m
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/14/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "ViewController.h"
#import "AddPersonViewController.h"
#import "AddCoursesViewController.h"
#import "AddPersonToCourseViewController.h"
#import "University.h"
#import "Course.h"
#import "Staff.h"
#import "Student.h"
#import "NYUTableViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *addStudent;
@property (strong, nonatomic) University * nyu;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Welcome to Dean's List";
    self.nyu = [University new];
    
    //Pre-loaded arrays
    Course * course1 = [[Course alloc] initCourse:@"Bio 101" locatedAt:@"Bobst" onDays:@"Mon,Wed" atTime:@"12p"];
    [self.nyu.courses addObject:course1];
    
    course1 = [[Course alloc] initCourse:@"Chem 101" locatedAt:@"Bobst" onDays:@"Mon,Wed" atTime:@"12p"];
    [self.nyu.courses addObject:course1];
    
    course1 = [[Course alloc] initCourse:@"Comp Sci 101" locatedAt:@"Bobst" onDays:@"Mon,Wed" atTime:@"12p"];
    [self.nyu.courses addObject:course1];
    
    NSLog(@"Number of Courses: %lu", [self.nyu.courses count]);
    
    Staff * staff1 = [[Staff alloc] initWithName:@"Eric Wang" SSN:@"999-999-9999" andDOB:nil];
    [staff1 setUpBio:@"This is the body of the bio description" withFunFact:@"I Like to HangGlide" andDegreeEarned:@"MS Computer Science, NYU"];
    [self.nyu.staff addObject:staff1];
    
    staff1 = [[Staff alloc] initWithName:@"Louis Tur" SSN:@"999-999-9999" andDOB:nil];
    [staff1 setUpBio:@"This is the body of the bio description" withFunFact:@"I have dual citizenship" andDegreeEarned:@"MS Computer Science, NYU"];
    [self.nyu.staff addObject:staff1];
    
    staff1 = [[Staff alloc] initWithName:@"Paul Park" SSN:@"999-999-9999" andDOB:nil];
    [staff1 setUpBio:@"This is the body of the bio description" withFunFact:@"I am an eagle scout" andDegreeEarned:@"PhD Computer Science, NYU"];
    [self.nyu.staff addObject:staff1];
    
    NSLog(@"Number of Staff: %lu", [self.nyu.staff count]);
    
    Student * student1 = [[Student alloc] initWithName:@"Jim Norris" SSN:@"999-9999-9999" andDOB:nil];
    [self.nyu.students addObject:student1];
    
    student1 = [[Student alloc] initWithName:@"Shawn Koonin" SSN:@"999-9999-9999" andDOB:nil];
    [self.nyu.students addObject:student1];
    
    student1 = [[Student alloc] initWithName:@"Devin o Daniel" SSN:@"999-9999-9999" andDOB:nil];
    [self.nyu.students addObject:student1];
    
    NSLog(@"Number of Staff: %lu", [self.nyu.students count]);
}

- (IBAction)addStudent:(UIButton *)sender {
}

/**********************************************
 
                Print buttons
 
 
**********************************************/

//would like to make buttons disabled until count > 1
- (IBAction)printStudents:(UIButton *)sender {
    if ([self.nyu.students count]) {
        NSLog(@"Students\n-----------");
        NSLog(@"%@", self.nyu.students);
    }else{
        NSLog(@"No students enrolled");
    }
    
}
- (IBAction)printStaff:(UIButton *)sender {
    if ([self.nyu.staff count]) {
        NSLog(@"Staff\n-----------");
        NSLog(@"%@", self.nyu.staff);
    }else{
        NSLog(@"No staff hired");
    }
    
}
- (IBAction)printCourses:(UIButton *)sender {
    if ([self.nyu.courses count]) {
        NSLog(@"Courses\n-----------");
        NSLog(@"%@", self.nyu.courses);
    }else{
        NSLog(@"No courses listed");
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**********************************************
 
            Segue Controls
 
 
 **********************************************/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender{
    
    //add a person to NYU
    if ([[segue identifier] isEqualToString:@"addPerson"]) {
        AddPersonViewController * nextView = [segue destinationViewController];
        
        // add a student
        if ( [[sender currentTitle] isEqualToString:@"Add Students"] ) {
            nextView.isStaff = FALSE;
            nextView.personArray = self.nyu.students;
        
        //add a staff member
        }else{
            nextView.isStaff = TRUE;
            nextView.personArray = self.nyu.staff;
        }
    
    // add a course to course list
    }else if ( [[segue identifier] isEqualToString:@"addCourse"]){
        
        AddCoursesViewController * nextView = [segue destinationViewController];
        nextView.courseCatalog = self.nyu.courses;
    
    // assign a person to a course
    }else if ( [[segue identifier] isEqualToString:@"addPersonToCourse"]){
        
        AddPersonToCourseViewController * nextView = [segue destinationViewController];
        nextView.courseList = self.nyu.courses;
        
        //adding a staff to a course
        if ( [[sender currentTitle] isEqualToString:@"Assign Staff to Courses"] ){
            nextView.personList = self.nyu.staff;
            nextView.isStaff = TRUE;
        }
        
        //adding a student to a course
        else
        {
            nextView.personList = self.nyu.students;
            nextView.isStaff = FALSE;
        }
        
    // displaying all information
    }else if ([[segue identifier] isEqualToString:@"allInfo"]){
        NYUTableViewController * nextView = [segue destinationViewController];
        
        nextView.students = self.nyu.students;
        nextView.teachers = self.nyu.staff;
        nextView.courses = self.nyu.courses;
    }
    
    //placeholder error handler
    else
    {
        NSLog(@"Wrong place");
    }
}

@end
