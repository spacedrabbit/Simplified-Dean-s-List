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
#import "University.h"

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
}

- (IBAction)addStudent:(UIButton *)sender {
}

- (IBAction)printStudents:(UIButton *)sender {
    NSLog(@"Students\n-----------");
    NSLog(@"%@", self.nyu.students);
}
- (IBAction)printStaff:(UIButton *)sender {
    NSLog(@"Staff\n-----------");
    NSLog(@"%@", self.nyu.staff);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender{
    
    if ([[segue identifier] isEqualToString:@"addPerson"]) {
        AddPersonViewController * nextView = [segue destinationViewController];
        
        if ( [[sender currentTitle] isEqualToString:@"Add Students"] ) {
            nextView.isStaff = FALSE;
            nextView.personArray = self.nyu.students;
            
        }else{
            nextView.isStaff = TRUE;
            nextView.personArray = self.nyu.staff;
        }
    }else if ( [[segue identifier] isEqualToString:@"addCourse"]){
        AddCoursesViewController * nextView = [segue destinationViewController];
        nextView.courseCatalog = self.nyu.courses;
    }else{
        NSLog(@"Wrong place, homie");
    }
}

@end
