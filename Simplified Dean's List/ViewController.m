//
//  ViewController.m
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/14/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *addStudent;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor purpleColor]];
}

- (IBAction)addStudent:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender{
    
    if ([[segue identifier] isEqualToString:@"addPerson"]) {
        NSLog(@"Fine");
        if ([sender.currentTitle isEqualToString:@"Add Students"]) {
            NSLog(@"Students");
        }
    }
}

-(void) justDoSomething{
    NSLog(@"Doing it");
}

@end
