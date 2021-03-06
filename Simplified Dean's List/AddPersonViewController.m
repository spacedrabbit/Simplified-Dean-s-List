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
@property (weak, nonatomic) IBOutlet UITextField *ssn;

@property (weak, nonatomic) IBOutlet UILabel *confirmationLabel;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *entryFields;

@end

@implementation AddPersonViewController

- (NSMutableArray *)personArray{
    if (!_personArray) {
        _personArray = [NSMutableArray array];
    }
    return _personArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.isStaff ? @"Hire Staff" : @"Enroll Student";
    
    [self addDoneButtonToKeyboards];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(UIButton *)sender {
    
    //refactor this code?
    NSString *firstName = self.firstName.text;
    NSString *lastName = self.lastName.text;
    NSString *ssn = self.ssn.text;
    
    if ([firstName isEqualToString:@""] || [lastName isEqualToString:@""] || [ssn isEqualToString:@""]) {
        [self displayConfirmMessage:@"Sorry, not a valid entry"];
    }
    else{
        //creating student objects
        Person * person = [[Person alloc] initWithName:[NSString stringWithFormat:@"%@ %@", firstName, lastName] SSN:ssn andDOB:Nil];
    
        [self.personArray addObject:person];
        [self displayConfirmMessage:[NSString stringWithFormat:@"Successfully added %@", person.name]];
        
    }
    
    [self clearTextFields]; // refactored!
    [self dismissKeyboard];

}

/**********************************************
 
    Working with the labels and text
 
    Would be nice to add this to the ViewController superclass
 
 ***********************************************/

//clearing label on next input
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.confirmationLabel.text =@"";
}

//clearing textfield collection
-(void) clearTextFields{
    for (UITextField * text in self.entryFields) {
        text.text = @"";
    }
}

//displaying a simply message in a pre-defined label
-(void) displayConfirmMessage: (NSString *) message{
    self.confirmationLabel.adjustsFontSizeToFitWidth = TRUE;
    self.confirmationLabel.textAlignment = NSTextAlignmentCenter;
    self.confirmationLabel.text = message;
}

//changing 'return' button to say 'done'
-(void) addDoneButtonToKeyboards{
    for (UITextField* label in self.entryFields) {
        label.returnKeyType = UIReturnKeyDone;
    }
}


@end
