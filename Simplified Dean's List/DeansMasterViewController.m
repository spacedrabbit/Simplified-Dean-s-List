//
//  DeansMasterViewController.m
//  Simplified Dean's List
//
//  Created by Louis Tur on 2/15/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "DeansMasterViewController.h"

@interface DeansMasterViewController ()

@end

@implementation DeansMasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/***********************************************
 
 Getting rid of the keyboard
 
***********************************************/

//touch anywhere on the view to dismiss
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismissKeyboard];
}

//easy to read method
-(void)dismissKeyboard{
    [self.view endEditing:YES];
}

//click 'return' to dismiss keyboard as well. this method works by delegating control to the ViewController, this is a protocol method
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return TRUE;
}


@end
