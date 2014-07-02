//
//  CreateTaskViewController.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-17.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "CreateTaskViewController.h"
#import "TaskService.h"
@interface CreateTaskViewController ()

@end

@implementation CreateTaskViewController
@synthesize caseno;
@synthesize caseType;
@synthesize garageType;

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setCaseno:nil];
    [self setCaseType:nil];
    [self setGarageType:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)createTask:(id)sender {
    [[AcModule sharedModule] setForegroundViewController:self];
    NSString* type;
    if (self.caseType.selectedSegmentIndex==0) {
        type=@"单方事故";
    }else if(self.caseType.selectedSegmentIndex==1){
        type=@"双方事故";
    }
    else{
     type=@"";
    }

    [[TaskService taskService] createTaskWith:self.caseno.text andTaskflowtype:@"VIP查勘" caseType:type];
    
    
}

- (IBAction)select:(id)sender {
    NSLog(@"%d",[sender selectedSegmentIndex]);
}

- (IBAction)endEditState:(id)sender {
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
}
@end
