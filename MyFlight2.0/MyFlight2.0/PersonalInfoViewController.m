//
//  PersonalInfoViewController.m
//  MyFlight2.0
//
//  Created by Davidsph on 12/20/12.
//  Copyright (c) 2012 LIAN YOU. All rights reserved.
//

#import "PersonalInfoViewController.h"

@interface PersonalInfoViewController ()

@end

@implementation PersonalInfoViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
   
    [_personalName release];
    [_detailAddress release];
    [_sexChoice release];
    [_sexName release];
    [super dealloc];
}
- (void)viewDidUnload {
    
    [self setPersonalName:nil];
    [self setDetailAddress:nil];
    [self setSexChoice:nil];
    [self setSexName:nil];
    [super viewDidUnload];
}
- (IBAction)backKeyBoard:(id)sender {
    
    [sender resignFirstResponder];
}
@end