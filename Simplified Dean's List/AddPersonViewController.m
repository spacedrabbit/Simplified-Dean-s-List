//
//  AddPersonViewController.m
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/14/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "AddPersonViewController.h"
#import "Person.h"

@interface AddPersonViewController ()
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;

@end

@implementation AddPersonViewController{
    NSMutableArray *students;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor purpleColor]];
    students = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(UIButton *)sender {
    
    NSString *firstName = self.firstName.text;
    NSString *lastName = self.lastName.text;
    
    if ([firstName isEqualToString:@""] || [lastName isEqualToString:@""]) {
        NSLog(@"Sorry, not a valid name");
    }
    else{
    Person * stud = [[Person alloc] initWithName:[NSString stringWithFormat:@"%@ %@", firstName, lastName] SSN:@"999-999-9999" andDOB:Nil];
    
    [students addObject:stud];
    NSLog(@"%@", students);
    }
    
    self.firstName.text = @"";
    self.lastName.text = @"";

}


@end
